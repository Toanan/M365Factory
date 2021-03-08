#Function to disconnect from Exchange Online session
function Disconnect-M365F
 {
    [CmdletBinding()]
    Param( 
        [parameter(Mandatory=$False)]
        [switch]$SPO,
        [parameter(Mandatory=$False)]
        [switch]$PNP,
        [parameter(Mandatory=$False)]
        [switch]$Exchange,
        [parameter(Mandatory=$False)]
        [switch]$Teams,
        [parameter(Mandatory=$False)]
        [switch]$AzureAD
    )

    #Disconnect SharePoint Online management shell
    if($SPO)
    {
        Disconnect-SPOService
    }
    
    #Disconnect PNP Online
    if($PNP)
    {
        Disconnect-PnPOnline
    }
    
    #Disconnect all exchange session
    if($Exchange)
    {
        if ($PSSessionExchange = Get-PSSession | ?{$_.ComputerName -eq "outlook.office365.com"}) {
    
            $PSSessionExchange |%{Remove-PSSession $PSSessionExchange}
        }
    }

    if($Teams)
    {
        Disconnect-MicrosoftTeams
    }

    If($AzureAD)
    {
        Disconnect-AzureAD
    }
    

}