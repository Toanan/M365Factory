#Requires -version 4.0 
    <# 
    .SYNOPSIS 
       Write a log in CMTrace format
     
    .DESCRIPTION 
        
       1/ Write a log message in the log file 
       2/ Return the message in the console type Information, Warning, Verbose, Debug or Error

       Available message levels :

            2 : Warning
            3 : Error
            4 : Verbose
            5 : Debug
            6 : Information
     
    .EXAMPLE 
    Try{ Get-Mailbox -Identity ed@contoso.com }
    Catch{ Write-OFLog -FilePath ".\logfile.log -Message $Error[0] -Level "Error" }
     
    .EXAMPLE
    Write-OFLog -Message "Message d'information" -Level "Information"
  
    .NOTES
        
    #> 
Function Write-M365FLog {  
      [CmdletBinding()]
      Param( 
        [parameter(Mandatory=$False)]
          [String]$FilePath,
        [parameter(Mandatory=$False)]
          $Message,
        [parameter(Mandatory=$True)]
          [ValidateSet("Warning","Error","Verbose","Debug","Information")]
          [String]$Level
      )

      #Name of the default log file to use if none is found in the global variables
      Set-Variable -Option Constant -Name "DEFAULTLOGFILENAME" -Value (Convert-M365FDynamicText -Text "M365Factory(%year%-%month%-%day%-%hours%-%minutes%-%seconds%).log")
      #Default maximum file size : 50 mo
      Set-Variable -Option Constant -Name "DEFAULTLOGMAXFILESIZE" -Value 50
      
      #Number message level (converting from [String]$Level)
      Switch($Level) {
        "Warning"     { $intLevel = 2 }
        "Error"       { $intLevel = 3 }
        "Verbose"     { $intLevel = 4 }
        "Debug"       { $intLevel = 5 }
        "Information" { $intLevel = 6 }
        default       { $intLevel = 3 }
      }
  
      #Si c'est du Debug et que le switch Debug n'est pas passé, nous n'en tenons pas compte
      If($Level -eq "Debug" -and ($Global:DebugPreference -eq "SilentlyContinue" -or [String]::IsNullOrEmpty($Global:DebugPreference)) -and ($Script:DebugPreference -eq "SilentlyContinue" -or [String]::IsNullOrEmpty($Script:DebugPreference)) ) { Return }
  
      #Si c'est du Verbose et que le switch Verbose n'est pas passé, nous n'en tenons pas compte
      If($Level -eq "Verbose" -and ($Global:VerbosePreference -eq "SilentlyContinue" -or [String]::IsNullOrEmpty($Global:VerbosePreference)) -and ($Script:VerbosePreference -eq "SilentlyContinue" -or [String]::IsNullOrEmpty($Script:VerbosePreference)) ) { Return }
      
      #Définition du niveau de Debug
      If(($Global:DebugPreference -eq "Continue") -or ($Script:DebugPreference -eq "Continue")) { $strDebugPreference = "Continue"}
      elseif(($Global:DebugPreference -eq "Inquire") -or ($Script:DebugPreference -eq "Inquire")) { $strDebugPreference = "Inquire"}
      else { $strDebugPreference = "SilentlyContinue" }
  
      #Définition du niveau de Verbose
      If(($Global:VerbosePreference -eq "Continue") -or ($Script:VerbosePreference -eq "Continue")) { $strVerbosePreference = "Continue"}
      elseif(($Global:VerbosePreference -eq "Inquire") -or ($Script:VerbosePreference -eq "Inquire")) { $strVerbosePreference = "Inquire"}
      else { $strVerbosePreference = "SilentlyContinue" }
      
      #Définition du nom de script à vide par défaut
      $strScriptName = ""
      #On parcourt les appels jusqu'à trouver un nom de script qui contient ".ps1"
      Get-PSCallStack | %{ 
        if($_.Command -like "*.ps1") { $strScriptName = $_.Command }
      }
      
      #On récupère le BaseName --> Exemple, pour "template.ps1", le BaseName est "template"
      $strScriptBaseName = $strScriptName -replace "\..{3,5}$",""
      
      #Nom de la fonction appellante
      $strFunctionName = (Get-PSCallStack)[1].Command
  
      #Si un chemin a été spécifié en paramètre d'entrée, nous tentons de l'utiliser
      If(-not([String]::IsNullOrEmpty($FilePath))) {
        Try {
          #Si FilePath ne contient aucun backslash, c'est qu'il n'y a qu'un nom de fichier.
          #Dans ce cas, nous ajoutons .\ devant pour définir dans le répertoire courant
          if($FilePath -notlike "*\*") { $FilePath = ".\$FilePath" }
          #On récupère le nom du fichier dans le chemin spécifié
          $strLogFileName = $FilePath | Split-Path -Leaf
          #On récupère le dossier dans le chemin spécifié
          $strLogFolder = $FilePath | Split-Path
        } Catch {
          Write-Verbose "[Write-OFLog] Le chemin du fichier de log n'est pas correct : $FilePath"
          $strLogFolder = ""
          $strLogFileName = ""
        }
      #Si aucun chemin n'a été spécifié en paramètre d'entrée mais que la variable globale M365FLogFile est définie, nous tentons de l'utiliser
      } elseif (-not([String]::IsNullOrEmpty($Global:M365FLogFile))) {
        Try {
          #Si M365FLogFile ne contient aucun backslash, c'est qu'il n'y a qu'un nom de fichier.
          #Dans ce cas, nous ajoutons .\ devant pour définir dans le répertoire courant
          if($Global:M365FLogFile -notlike "*\*") { $Global:M365FLogFile = ".\$($Global:M365FLogFile)" }
          #On récupère le nom du fichier dans le chemin spécifié
          $strLogFileName = $Global:M365FLogFile | Split-Path -Leaf
          #On récupère le dossier dans le chemin spécifié
          $strLogFolder = $Global:M365FLogFile | Split-Path
        } Catch {
          Write-Verbose "[Write-OFLog] Le chemin du fichier de log n'est pas correct : $($Global:M365FLogFile)"
          $strLogFolder = ""
          $strLogFileName = ""
        }
      }
          
      #Si aucun chemin valide n'a été fourni via le paramètre FilePath ou via la variable globale $Global:M365FLogFile, nous en construisons un
      #en utilisant la constante $DEFAULTLOGFILENAME qui est définie en début de script
      If([String]::IsNullOrEmpty($strLogFolder) -or [String]::IsNullOrEmpty($strLogFileName)) {
      
        #On utilise le répertoire courant pour le fichier de log
        $strLogFolder = (Get-Item -Path .).FullName
        #On utilise la constante $DEFAULTLOGFILENAME en tant que nom de fichier de log
        $strLogFileName = $DEFAULTLOGFILENAME
      
      }
      
      #On vérifie que le dossier existe bien. Si ce n'est pas le cas, on tente de le créer
      Try {
        #Création du dossier (et de toute l'arborescence si nécessaire avec -Force)
        If(-not(Test-Path -Path $strLogFolder)) { New-Item -Type Directory -Path $strLogFolder -Force }
        #On vérifie que le dossier est bien créé. Si ce n'est pas le cas, on redirige les logs dans le dossier courant
        If(-not(Test-Path -Path $strLogFolder)) { $strLogFolder = "." }
      #Si on a une erreur, on redirige les logs dans le dossier courant
      } Catch { $strLogFolder = "." }
        
  
      #On définit le chemin complet du log
      $FilePath = "{0}\{1}" -f $strLogFolder,$strLogFileName
  
      
      #On récupère la limite de taille du fichier de log que l'on s'est fixée, soit avec la constante $DEFAULTLOGMAXFILESIZE, soit avec les paramètres du script si elle est définie
      Try {
        $intLogMaxFileSize = [int]$Global:XMLConfig.Config.LogMaxFileSize
        #Si la taille est inférieure à 1 Mo, on remet la valeur par défaut
        if($intLogMaxFileSize -lt 1) { $intLogMaxFileSize = $DEFAULTLOGMAXFILESIZE }
      }
      Catch { $intLogMaxFileSize = $DEFAULTLOGMAXFILESIZE }
  
      #Si le log actuel est supérieur à cette taille, on le tronque
      Try {
        #On vérifie la taille du fichier (en octet) et on la compare à la taille maximale (en Mo)
        if(Test-Path -Path $FilePath) {
          if((Get-Item -Path $FilePath).Length -gt ($intLogMaxFileSize * 1024 * 1024)) {
            $intCounter = 0
            $bFound = $false
            while(($intCounter -lt 10000) -and ($bFound -eq $false)) {
              $intCounter++
              #Au cas où le fichier ne contiendrait pas de .log, on en ajoute un à la fin afin d'éviter d'avoir une boucle qui tourne dans le vide
              if($FilePath -notcontains ".log") { $strDestinationFile = "$FilePath.log" }
              else { $strDestinationFile = $FilePath }
              #On calcule un nom de fichier de destination
              $strDestinationFile = $strDestinationFile -replace "\..{3,5}$",".$intCounter.log"
              #On vérifie s'il existe ou non
              If(-not(Test-Path -Path $strDestinationFile)) { $bFound = $true }
            }
  
            #On déplace le contenu du fichier $FilePath vers $strDestinationFile
            Get-Content -Path $FilePath | Add-Content -Encoding UTF8 -FilePath $strDestinationFile  
            #On vide le fichier source
            Clear-Content -Path $FilePath
          }
        }
      } Catch { Write-Warning "[Write-OFLog] Impossible d'historiser le contenu du fichier $FilePath dans $strDestinationFile" }
  
      #On récupère l'appelant (la fonction ou autre qui a appelé la la méthode de log)
      $objCaller = (Get-PSCallStack)[1]
  
      #Emplacement de l'appel de la fonction de log dans la fonction source
      $strCallerLocation = (Get-PSCallStack)[1].Location
  
      #Si on a trouvé un nom de script, on l'indique dans la colonne "Component". Sinon, on indique seulement le nom du processus
      if(-not([String]::IsNullOrEmpty($strScriptName))) {
        $Component = "{0} ({1})" -f (Get-Process -Id $PID).ProcessName,$strScriptName
      } else {
        $Component = (Get-Process -Id $PID).ProcessName
      }
  
      #ID du processus
      $intProcessID = $PID
  
      #Formatage de la date en UTC
      $objDateTime = New-Object -ComObject WbemScripting.SWbemDateTime  
      $objDateTime.SetVarDate($(Get-Date)) 
      $strUtcOffset = $objDateTime.Value.Substring(21, $objDateTime.Value.Length - 21)
      #Date au format US pour qu'il puisse être interprêté par CMTrace
      $strDate = Get-Date -Format M-d-yyyy
      #Heure du log
      $strTime = "$(Get-Date -Format HH:mm:ss.fff)$($strUtcOffset)"
      
      #Nom d'utilisateur complet au format Domain\UserName
      $strFullUserName = "$env:USERDOMAIN\$env:USERNAME"
      
      #Niveau de l'erreur au format texte (conversion depuis [MessageLevel])
      $strLevel = $Level.ToUpper()
  
      #En fonction du type de message (si c'est une erreur, un avertissement, ...), on journalise un message différent dans le fichier de log
      Switch($intLevel){
        2 { #Warning
          #Ecriture dans le log au format CMTrace.
          $strLine = "<![LOG[$($strLevel): $Message]LOG]!>" +`
                     "<time=""$strTime"" " +`
                     "date=""$strDate"" " +`
                     "component=""$Component"" " +`
                     "context=""$strFullUserName"" " +`
                     "type=""$intLevel"" " +`
                     "thread=""$intProcessID"" " +`
                     "file=""$strCallerLocation"">"
          $strLine | Out-File -Append -Encoding UTF8 -FilePath $FilePath
                
          #Ecriture dans la console
          Switch($PSCmdlet.GetVariableValue('WarningPreference')){
            'Continue' {$WarningPreference = 'Continue';Write-Warning -Message "$Message";$WarningPreference=''}
            'Stop' {$WarningPreference = 'Stop';Write-Warning -Message "$Message";$WarningPreference=''}
            'Inquire' {$WarningPreference ='Inquire';Write-Warning -Message "$Message";$WarningPreference=''}
            'SilentlyContinue' {}
          }
        }
  
        3 { #Error
          #This if statement is to catch the two different types of errors that may come through. A normal terminating exception will have all the information that is needed, if it's a user generated error by using Write-Error,
          #then the else statment will setup all the information we would like to log.   
          if($Message.exception.Message){                
            #Ecriture dans le log au format CMTrace.
            $strLine = "<![LOG[$($strLevel): $([String]$Message.Exception.Message)`r`r" + `
                        "`nCommand: $($Message.InvocationInfo.MyCommand)" + `
                        "`nScriptName: $($Message.InvocationInfo.Scriptname)" + `
                        "`nLine Number: $($Message.InvocationInfo.ScriptLineNumber)" + `
                        "`nColumn Number: $($Message.InvocationInfo.OffsetInLine)" + `
                        "`nLine: $($Message.InvocationInfo.Line))]LOG]!>" +`
                        "<time=""$strTime"" " +`
                        "date=""$strDate"" " +`
                        "component=""$Component"" " +`
                        "context=""$strFullUserName"" " +`
                        "type=""$intLevel"" " +`
                        "thread=""$intProcessID"" " +`
                        "file=""$strCallerLocation"">"
            $strLine | Out-File -Append -Encoding UTF8 -FilePath $FilePath
  
            #Ecriture dans la console
            Switch($PSCmdlet.GetVariableValue('ErrorActionPreference')) {
              'Stop'{$ErrorActionPreference = 'Stop';$Host.Ui.WriteErrorLine("ERROR: $([String]$Message.Exception.Message)");Write-Error $Message -ErrorAction 'Stop';$ErrorActionPreference=''}
              'Inquire'{$ErrorActionPreference = 'Inquire';$Host.Ui.WriteErrorLine("ERROR: $([String]$Message.Exception.Message)");Write-Error $Message -ErrorAction 'Inquire';$ErrorActionPreference=''}
              'Continue'{$ErrorActionPreference = 'Continue';$Host.Ui.WriteErrorLine("ERROR: $([String]$Message.Exception.Message)");$ErrorActionPreference=''}
              'Suspend'{$ErrorActionPreference = 'Suspend';$Host.Ui.WriteErrorLine("ERROR: $([String]$Message.Exception.Message)");Write-Error $Message -ErrorAction 'Suspend';$ErrorActionPreference=''}
              'SilentlyContinue'{}
            }
          } else {
            [System.Exception]$Exception = $Message
            [String]$ErrorID = 'Custom Error'
            [System.Management.Automation.ErrorCategory]$ErrorCategory = [Management.Automation.ErrorCategory]::WriteError
            $ErrorRecord = New-Object Management.automation.errorrecord ($Exception,$ErrorID,$ErrorCategory,$Message)
            $Message = $ErrorRecord
            #Ecriture dans le log au format CMTrace.
            $strLine = "<![LOG[$($strLevel): $([String]$Message.Exception.Message)`r`r" + `
                       "`nFunction: $($objCaller.FunctionName)" + `
                       "`nScriptName: $($objCaller.Scriptname)" + `
                       "`nLine Number: $($objCaller.ScriptLineNumber)" + `
                       "`nColumn Number: $($objCaller.Position.StartColumnNumber)" + `
                       "`nLine: $($objCaller.Position.StartScriptPosition.Line))]LOG]!>" +`
                        "<time=""$strTime"" " +`
                        "date=""$strDate"" " +`
                        "component=""$Component"" " +`
                        "context=""$strFullUserName"" " +`
                        "type=""$intLevel"" " +`
                        "thread=""$intProcessID"" " +`
                        "file=""$strCallerLocation"">"
            $strLine | Out-File -Append -Encoding UTF8 -FilePath $FilePath
  
            #Ecriture dans la console
            Switch($PSCmdlet.GetVariableValue('ErrorActionPreference')){
              'Stop'{$ErrorActionPreference = 'Stop';$Host.Ui.WriteErrorLine("ERROR: $([String]$Message.Exception.Message)");Write-Error $Message -ErrorAction 'Stop';$ErrorActionPreference=''}
              'Inquire'{$ErrorActionPreference = 'Inquire';$Host.Ui.WriteErrorLine("ERROR: $([String]$Message.Exception.Message)");Write-Error $Message -ErrorAction 'Inquire';$ErrorActionPreference=''}
              'Continue'{$ErrorActionPreference = 'Continue';$Host.Ui.WriteErrorLine("ERROR: $([String]$Message.Exception.Message)");Write-Error $Message 2>&1 > $null;$ErrorActionPreference=''}
              'Suspend'{$ErrorActionPreference = 'Suspend';$Host.Ui.WriteErrorLine("ERROR: $([String]$Message.Exception.Message)");Write-Error $Message -ErrorAction 'Suspend';$ErrorActionPreference=''}
              'SilentlyContinue'{}
            }
          }   
        }
  
        4 { #Verbose
  
          #Ecriture dans le log au format CMTrace.
          $strLine = "<![LOG[$($strLevel): $Message]LOG]!>" +`
                     "<time=""$strTime"" " +`
                     "date=""$strDate"" " +`
                     "component=""$Component"" " +`
                     "context=""$strFullUserName"" " +`
                     "type=""$intLevel"" " +`
                     "thread=""$intProcessID"" " +`
                     "file=""$strCallerLocation"">"
          $strLine | Out-File -Append -Encoding UTF8 -FilePath $FilePath; 
  
          #Ecriture dans la console
          Switch ($strVerbosePreference) {
            'Continue' {$VerbosePreference = 'Continue'; Write-Verbose -Message "$Message";$VerbosePreference = ''}
            'Inquire' {$VerbosePreference = 'Inquire'; Write-Verbose -Message "$Message";$VerbosePreference = ''}
            'Stop' {$VerbosePreference = 'Stop'; Write-Verbose -Message "$Message";$VerbosePreference = ''}
          }
           
        }
  
        5 { #Debug
  
          #Ecriture dans le log au format CMTrace.
          $strLine = "<![LOG[$($strLevel): $Message]LOG]!>" +`
                     "<time=""$strTime"" " +`
                     "date=""$strDate"" " +`
                     "component=""$Component"" " +`
                     "context=""$strFullUserName"" " +`
                     "type=""$intLevel"" " +`
                     "thread=""$intProcessID"" " +`
                     "file=""$strCallerLocation"">"
          $strLine | Out-File -Append -Encoding UTF8 -FilePath $FilePath;  
  
          #Ecriture dans la console
          Switch ($strDebugPreference) {
            'Continue' {$DebugPreference = 'Continue'; Write-Debug -Message "$Message";$DebugPreference = ''}
            'Inquire' {$DebugPreference = 'Inquire'; Write-Debug -Message "$Message";$DebugPreference = ''}
            'Stop' {$DebugPreference = 'Stop'; Write-Debug -Message "$Message";$DebugPreference = ''}
          }
                          
        }
  
        6 { #Information
  
          #Ecriture dans le log au format CMTrace.
          $strLine = "<![LOG[$($strLevel): $Message]LOG]!>" +`
                     "<time=""$strTime"" " +`
                     "date=""$strDate"" " +`
                     "component=""$Component"" " +`
                     "context=""$strFullUserName"" " +`
                     "type=""$intLevel"" " +`
                     "thread=""$intProcessID"" " +`
                     "file=""$strCallerLocation"">"
          $strLine | Out-File -Append -Encoding UTF8 -FilePath $FilePath;  
  
          #Ecriture dans la console
          Switch ($PSCmdlet.GetVariableValue('InformationPreference')) {
            'Continue' {$InformationPreference = 'Continue'; Write-Host -Object "INFORMATION: $Message";$InformationPreference = ''}
            'Inquire' {$InformationPreference = 'Inquire'; Write-Host -Object "INFORMATION: $Message";$InformationPreference = ''}
            'Stop' {$InformationPreference = 'Stop'; Write-Host -Object "INFORMATION: $Message";$InformationPreference = ''}
            'Suspend' {$InformationPreference = 'Suspend'; Write-Host -Object "INFORMATION: $Message";$InformationPreference = ''}
          }
        }
  
      }
    }