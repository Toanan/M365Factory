#function to disable library syncronization
function Set-M365FLibraryConfig ($SiteUrl, $LibraryName, $LibSync, $Versionning) {

    #Creating client context CSOM
    $SPOCredentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Global:AdminCredentials.UserName , $Global:AdminCredentials.Password)
    $Ctx = New-Object Microsoft.SharePoint.Client.ClientContext($SiteUrl)
    $Ctx.Credentials = $SPOCredentials

    $spoList = $Ctx.Web.Lists.GetByTitle($LibraryName) 
    $Ctx.Load($spoList) 
    $Ctx.ExecuteQuery() 
 
    #Enabling / Disabling offline syncronization 
    switch ($LibSync)  
    {  
    "Enable" { 
        Write-Verbose "Enabling syncrhonization for document library $LibraryName" 
        $spoList.ExcludeFromOfflineClient=$false 
        } 
    "Disable"{ 
        Write-Verbose "Disabling syncrhonization for document library $LibraryName" 
        $spoList.ExcludeFromOfflineClient=$true 
        } 
    default{ 
        Write-Verbose "Requested operation is not valid"  
        }            
    }         

    #Versionning check
    if ($Versionning -eq "Minor") { $spoList.EnableMinorVersions = $true }
    
    #Execute
    $spoList.Update() 
    $Ctx.ExecuteQuery()   
}