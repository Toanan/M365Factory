#Requires -version 4.0
    <#
      .SYNOPSIS
      Add a library to a SharePoint Online Site
  
      .DESCRIPTION
      Add a library to a SharePoint Online Site
  
      .PARAMETER Name
      String name of the library
    #>
    Function Add-M365FLibrary {
    
  
        [CmdletBinding()]
        Param(
            [parameter(Mandatory=$True)]
            [ValidateNotNullorEmpty()]
            [String]$SiteUrl
        )

        Connect-M365F -PNP -PNPUrl $SiteUrl
        New-PnPList -Title 'Board' -Template DocumentLibrary -OnQuickLaunch
        New-PnPList -Title 'Shared' -Template DocumentLibrary -OnQuickLaunch
        New-PnPList -Title 'Operations' -Template DocumentLibrary -OnQuickLaunch
        Remove-PnPList -Identity 'Documents'
    }