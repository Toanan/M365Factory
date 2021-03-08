#Retrieve Connected SPO Site reporting details
function Get-M365FConnectedSiteDetail($UGroup,$SiteCreated,$site){
    
    #Scoped Variables
    $output= @()
    $isDemo=''
    $techno = ""
    
    #Demo site ?
    $isDemo = Test-M365FDemoSite -siteTitle $site.Title

    #Connected to Teams ?
    if($Ugroup.ResourceProvisioningOptions -contains "Team"){$techno = "Teams"}else{$techno = "SharePointO365"}

    $output = New-Object psobject -Property @{
        'Title' = $site.Title
        'SiteUrl' = $site.Url
        'Techno' = $techno
        'ExternalSharing'= $site.SiteDefinedSharingCapability
        'OwnerGroupName' = $UGroup.DisplayName
        'OwnerGroupMembers' = $UGroup.ManagedBy -join "#"
        'LastContentModifiedDate' = $site.LastContentModifiedDate.ToShortDateString()
        'isDemo' = $isDemo
        'Created' = $SiteCreated 
    }
    Write-Output $output
}