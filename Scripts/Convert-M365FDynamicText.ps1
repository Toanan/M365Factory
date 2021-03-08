#Requires -version 4.0
    <#
      .SYNOPSIS
      Convert a string containing variables replacing variables with their values
  
      .DESCRIPTION
      Allow using generic strings and replace variables on the fly
      Doing the following translations
        %ScriptName%    : Name of the calling script (file .ps1)
        %FunctionName%  : Name of the calling function
        %Temp%          : Temp file path (variable $env:TEMP)
        %UserName%      : User name
        %UserDomain%    : User Domain
        %Year%          : Year 4 digits format
        %Month%         : Month 2 digits format
        %Day%           : Day 2 digits format
        %Hours%         : Hours 2 digits format
        %Minutes%       : Minutes 2 digits format
        %Seconds%       : Seconds 2 digits format
  
      .PARAMETER Text
      String containing the variables name to convert
    #>
Function Convert-M365FDynamicText {
    
  
    [CmdletBinding()]
    Param(
      [parameter(Mandatory=$True)]
        [ValidateNotNullorEmpty()]
        [String]$Text
    )
  
    #Script name defined empty by default
    $strScriptName = ""
    #Reviewing calls till with find the script name .ps1
    Get-PSCallStack | %{ if($_.Command -like "*.ps1") { $strScriptName = $_.Command } }
    
    #We retrieve BaseName --> Exemple for "template.ps1", BaseName is "template"
    $strScriptBaseName = $strScriptName -replace ".ps1",""
      
    #Name of the calling function
    $strFunctionName = (Get-PSCallStack)[1].Command
  
    #REplacing variable name by value if necessary
    $Text = $Text -Replace "%ScriptName%", $strScriptName
    $Text = $Text -Replace "%FunctionName%", $strFunctionName
    $Text = $Text -Replace "%Temp%", $env:TEMP
    $Text = $Text -Replace "%UserName%", $env:USERNAME
    $Text = $Text -Replace "%UserDomain%", $env:USERDOMAIN
    $Text = $Text -Replace "%Year%", (Get-Date -Format "yy")
    $Text = $Text -Replace "%Month%", (Get-Date -Format "MM")
    $Text = $Text -Replace "%Day%", (Get-Date -Format "dd")
    $Text = $Text -Replace "%Hours%", (Get-Date -Format "HH")
    $Text = $Text -Replace "%Minutes%", (Get-Date -Format "mm")
    $Text = $Text -Replace "%Seconds%", (Get-Date -Format "ss")
        
    Write-Output $Text
  
  }