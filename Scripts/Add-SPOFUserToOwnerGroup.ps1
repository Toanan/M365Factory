#Requires -version 4.0 
    <# 
    .SYNOPSIS 
       
     
    .DESCRIPTION 
     
    .EXAMPLE 
    
     
    .EXAMPLE
    
  
    .NOTES
        
    #> 
    Function Add-SPOFUserToOwnerGroup {
        [CmdletBinding()]
        Param( 
            [parameter(Mandatory=$True)]
            [String]$SiteUrl,
            [parameter(Mandatory=$True)]
            [String]$Email
        )

        Connect-PnPOnline -Url $SiteUrl -Credentials $Global:XMLConfig.Config.SPOAdminLogger.CredentialName | Out-Null
        $OwnerGroup = Get-PnPGroup -AssociatedOwnerGroup
        Add-PnPUserToGroup -LoginName $Email -Identity $OwnerGroup.Id

}