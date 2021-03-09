#Requires -version 4.0 
    <# 
    .SYNOPSIS 
       
     
    .DESCRIPTION 
     
    .EXAMPLE 
    
     
    .EXAMPLE
    
  
    .NOTES
        
    #> 
    Function Add-M365FUserToOwnerGroup {
        [CmdletBinding()]
        Param( 
            [parameter(Mandatory=$True)]
            [String]$SiteUrl,
            [parameter(Mandatory=$True)]
            [String]$Email
        )

        Connect-M365F -PNP -PNPUrl $SiteUrl
        $OwnerGroup = Get-PnPGroup -AssociatedOwnerGroup
        Add-PnPUserToGroup -LoginName $Email -Identity $OwnerGroup.Id

}