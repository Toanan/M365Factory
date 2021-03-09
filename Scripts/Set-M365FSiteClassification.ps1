#function to set Site classification
function Set-M365FSiteClassification ($SiteUrl, $SiteClassification) {

    <# CSOM - not working properly 
    #Creating client context CSOM
    $SPOCredentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Global:AdminCredentials.UserName , $Global:AdminCredentials.Password)
    $Ctx = New-Object Microsoft.SharePoint.Client.ClientContext($SiteUrl)
    $Ctx.Credentials = $SPOCredentials

    #Set Site classification
    Write-Verbose "Set site classification to $($SiteClassification)"
    $Ctx.Site.Classification = $SiteClassification
    $Ctx.ExecuteQuery()
    Write-Verbose "Site classification OK"
    #>

    #Connecting to the site using PNP module
    Write-Verbose "Connecting with PNP to $($SiteUrl)"
    Connect-M365F -PNP -PNPUrl $siteUrl

    #Set Site classification
    Write-Verbose "Set site classification to $($SiteClassification)"
    Set-PNPSite -Classification $SiteClassification
    Write-Verbose "Site classification OK"
}


















