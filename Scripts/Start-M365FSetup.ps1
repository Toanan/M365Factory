#Requires -version 4.0
    <#
      .SYNOPSIS
      Start the Config setup process
  
      .DESCRIPTION
      Start the Config setup process by asking SPO Admin url and Crednetials Name
  
      .PARAMETER AppConfig
      XML Content of the config file

      .PARAMETER ConfigPath
      String path to config file
    #>
    Function Start-M365FSetup {
    
        [CmdletBinding()]
        Param( 
            [parameter(Mandatory=$True)]
            $AppConfig,
            [parameter(Mandatory=$True)]
            $ConfigPath
        )
        Write-Host "Welcome to M365Factory setup" -ForegroundColor DarkGreen
        $url = Read-Host "Please type the SPO Admin url of your tenant"
        $credName = Read-Host "What is the credential label to use from the credential manager ?"
        $AppConfig.Config.SPOAdminLogger.Url = $url.ToString()
        $AppConfig.Config.SPOAdminLogger.CredentialName = $credName.ToString()

        Write-Host "Thank you !" -ForegroundColor Green

        $AppConfig.save($ConfigPath)

    }