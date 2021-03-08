#Requires -version 4.0 
    <# 
    .SYNOPSIS 
       
     
    .DESCRIPTION 
     
    .EXAMPLE 
    
     
    .EXAMPLE
    
  
    .NOTES
        
    #> 
Function Set-SPOFAccessRequest {
    [CmdletBinding()]
    Param( 
        [parameter(Mandatory=$True)]
        [String]$SiteUrl,
        [parameter(Mandatory=$True)]
        [Switch]$Enabled
    )
    Connect-PnPOnline -Url $SiteUrl -Credentials $Global:XMLConfig.Config.SPOAdminLogger.CredentialName | Out-Null
    $Ctx = Get-PnPContext
    $Web = $Ctx.Web
    if($Enabled){
        #We set the group option to true to enable the setting
        $Web.SetUseAccessRequestDefaultAndUpdate($true)
        #Uncomment the following line to set a custom message
        #$web.SetAccessRequestSiteDescriptionAndUpdate("Welcome to this page (group)")
        $Web.Update()
        $Ctx.ExecuteQuery()
    }else{
        #We set the email address to en empty string to disable the setting
        $Web.RequestAccessEmail = ""
        $Web.SetUseAccessRequestDefaultAndUpdate($false)
        $Web.Update()
        $Ctx.ExecuteQuery()
    }
}