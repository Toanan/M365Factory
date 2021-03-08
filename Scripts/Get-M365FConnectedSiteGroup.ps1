#Retrieve Connected group or false
function Get-M365FConnectedSiteGroup($site,$UGroups){
    $output = $false
    If($UGroup = $UGroups | Where-Object {$_.SharePointSiteUrl -eq $site.Url}){ $output = $UGroup }    
    Write-Output $output
}