Function Set-SPOFLanguageSettings ($SiteUrl,$MultilingualSetting){

    #Creating client context CSOM
    $SPOCredentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Global:AdminCredentials.UserName , $Global:AdminCredentials.Password)
    $Ctx = New-Object Microsoft.SharePoint.Client.ClientContext($SiteUrl)
    $Ctx.Credentials = $SPOCredentials

    $Web = $Ctx.Web
    if($MultilingualSetting -eq "OFF"){
        $Web.IsMultilingual=$False
        $Web.Update()
    }else{
        $Web.IsMultilingual=$True
        $Web.Update()
        
    }
    $Ctx.ExecuteQuery()
    $Ctx.Dispose()

}