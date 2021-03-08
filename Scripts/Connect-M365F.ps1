#Function to Connect to SharePoint Online management shell, SharePointPNPOnline and/or create an exchenge session
function Connect-M365F
{

    [CmdletBinding()]
        Param( 
            [parameter(ParameterSetName='INIT',Mandatory=$False)]
            [switch]$SPO,
            [parameter(ParameterSetName='PNP',Mandatory=$False)]
            [switch]$PNP,
            [parameter(ParameterSetName='PNP',Mandatory=$True)]
            [string]$PNPUrl,
            [parameter(ParameterSetName='INIT',Mandatory=$False)]
            [switch]$Exchange,
            [parameter(ParameterSetName='INIT',Mandatory=$False)]
            [switch]$Teams,
            [parameter(ParameterSetName='INIT',Mandatory=$False)]
            [switch]$AzureAD

        )
    Begin
    {
        $AdminCredentialsName = $XMLConfig.Config.SPOAdminLogger.CredentialName
        $AdminUrl = $XMLConfig.Config.SPOAdminLogger.Url
    
        #Network Credentials
        Import-Module "$($Global:ModulePath)\Modules&Assemblies\CredentialManagement\1.0.3\CredentialManagement.psd1"
        $AdminCredentials = Get-StoredCredentials -Target $AdminCredentialsName
    }

    Process
    {
        #Connect SharePoint Online Management shell
        if($SPO)
        {
            Import-Module "$($Global:ModulePath)\Modules&Assemblies\Microsoft.Online.SharePoint.PowerShell\16.0.20324.12000\Microsoft.Online.SharePoint.PowerShell.psd1"
            Write-Host "Connecting to SharePoint Management Shell"
            Connect-SPOService -Url $AdminUrl -Credential $AdminCredentials
        }
        
        #Connect SharePoint Online PNP
        if($PNP)
        {
            Import-Module "$($Global:ModulePath)\Modules&Assemblies\SharePointPnPPowerShellOnline\3.24.2008.1\SharePointPnPPowerShellOnline.psd1"
            Write-Host "Connecting to SharePoint PNP Online"
            Connect-PnPOnline -Url $PNPUrl -Credentials $AdminCredentials
        }


        #Connect Exchange Online
        if($Exchange)
        {
            Write-Host "Connecting to Exchange Online..."
            if ($PSSessionExchange = Get-PSSession | Where-Object {$_.ComputerName -eq "outlook.office365.com"}) {
    
                $PSSessionExchange | ForEach-Object {Remove-PSSession $PSSessionExchange}
            }
            
            Import-Module "$($Global:ModulePath)\Modules&Assemblies\ExchangeOnlineManagement\1.0.1\ExchangeOnlineManagement.psd1"
            Connect-ExchangeOnline -Credential $AdminCredentials | Out-Null
        }

        #Connect SharePoint Online Management shell
        if($Teams)
        {
            Import-Module "$($Global:ModulePath)\Modules&Assemblies\MicrosoftTeams\1.1.4\MicrosoftTeams.psd1"
            Write-Host "Connecting to Microsoft Teams"
            Connect-MicrosoftTeams -Credential $AdminCredentials | Out-Null
        }

        #Connect to Azure AD
        if($AzureAD)
        {
            Connect-AzureAD -TenantDomain "l-acoustics.com" -Credential $AdminCredentials | Out-Null
        }
    }

    end{
        Set-Variable -Scope Global -Name "AdminCredentials" -Value $AdminCredentials
    }
    
}