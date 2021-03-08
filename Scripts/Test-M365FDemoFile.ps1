#Check if 'Demo' or 'Test' is present in the site Title
function Test-M365FDemoSite($siteTitle){
    if(($siteTitle -ilike '*demo*') -or ($siteTitle -ilike '*test*')){
        $output = $true
    }else{
        $output = $false
    }
    Write-Output $output
}