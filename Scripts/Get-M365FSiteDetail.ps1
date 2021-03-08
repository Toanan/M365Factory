#Retrieve SPO Site reporting details
function Get-M365FSiteDetail($site,$SiteCreated){
    $output = @()
    $isDemo = ''
    
    #Demo site ?
    $isDemo = Test-M365FDemoSite -siteTitle $site.Title
    
    <#try{
        $siteGroups = Get-SPOSiteGroup -Site $site.url -ErrorAction Stop
    }catch{
        while (!$siteGroups){
            Start-Sleep -Seconds 2
            $siteGroups = Get-SPOSiteGroup -Site $site.url -ErrorAction SilentlyContinue
        } 
    }#>

    $output += New-Object psobject -Property @{
        'Title' = $site.Title
        'SiteUrl' = $site.Url
        'ExternalSharing'= $site.SiteDefinedSharingCapability
        'Techno' = "SharePoint"
        <#'OwnerGroupName' = $siteGroup.Title 
        'OwnerGroupMembers' = $siteGroup.Users -join "#"#>
        'LastContentModifiedDate' = $site.LastContentModifiedDate.ToShortDateString()
        'isDemo' = $isDemo
        'Created' = $SiteCreated       
    }
    Write-Output $output
}