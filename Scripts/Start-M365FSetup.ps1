#Requires -version 4.0
    <#
      .SYNOPSIS
      Add a library to a SharePoint Online Site
  
      .DESCRIPTION
      Add a library to a SharePoint Online Site
  
      .PARAMETER Name
      String name of the library
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