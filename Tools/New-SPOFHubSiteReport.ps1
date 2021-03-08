<#
.Synopsis
   Description sommaire
.DESCRIPTION
   Description détaillée
.EXAMPLE
   Exemple d’usage de cette applet de commande
.EXAMPLE
   Another example of how to use this cmdlet
#>
function New-SPOFHubSiteReport
{
    [CmdletBinding()]
    Param
    (

    )

    #Defining Report Path & Headers
    $ReportPath = $env:APPDATA + "\HubSiteReport" + (Get-Date -Format "MM-dd-yyyy-HH-mm") + ".csv"
    "SiteName,SiteUrl,IsHubSite,HubSiteID,HubSiteUrl" | Out-File -FilePath $ReportPath

    #Retrieve HubSites
    $HubSites = Get-SPOFHubSite
    
    #Reporting HubSites
    $HubSites | %{ $MyString = "$($_.Title),$($_.Url),$($_.IsHubSite),$($_.HubSiteId),$($_.Url)" | Out-File -FilePath $ReportPath -Append }

    $AssociatedSites = @()

    foreach ($HubSite in $HubSites) {

        $AssociatedSites = Get-SPOFAssociatedSite -HubSiteId $HubSite.HubSiteId

        $AssociatedSites |%{ $MyString = "$($_.Title),$($_.Url),$($_.IsHubSite),$($_.HubSiteId),$($HubSite.Url)" | Out-File -FilePath $ReportPath -Append }
    }
}