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
function Get-SPOFAssociatedSite
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([int])]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true)]
        [string]
        $HubSiteId
    )

    $sites = Get-SPOSite -Detailed
    $AssociatedSites = @()

    foreach ($site in $sites) {

        $mySite = Get-SPOSite -Identity $site.Url -Detailed
        if (($mySite.HubSiteId -eq $HubSiteId) -and ($mySite.IsHubSite -eq $false)) {

            $AssociatedSites += $mySite
        }
    }
    Write-Output $AssociatedSites
}