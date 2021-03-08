#Retrieve Private channel reporting details
function Get-M365FPrivateChannelDetail($site){
    $output= @()
    $isDemo =''
    $isDemo= Test-M365FDemoSite -siteTitle $site.Title

    $output = New-Object psobject -Property @{
        
        'Title' = $site.Title
        'SiteUrl' = $site.Url
        'Techno' = "PrivateChannel"
        'ExternalSharing'= $site.SiteDefinedSharingCapability
        'OwnerGroupName' = ($site.Title -split "-")[0]
        'OwnerGroupMembers' = $site.Owner -join "#"
        'LastContentModifiedDate' = $site.LastContentModifiedDate.ToShortDateString()
        'isDemo'= $isDemo
        'Created' = '' 
    }
    Write-Output $output
}