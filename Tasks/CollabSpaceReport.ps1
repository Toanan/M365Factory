<#
Planned Tasks - Run the Collaborative space report
    #Retrieve SharePoint Sites and Teams
#>

#Param
$IncludePrivateChannels = $false

#We create the logfile full name
$logFile = ''
$logFilePath = 'C:\L-Acoustics\M365Factory\Logs'
$logFileName = Convert-M365FDynamicText -Text "%functionName%(%year%-%month%-%day%-%hours%-%minutes%-%seconds%).log"
$logFile = "$logFilePath\$logFileName"
Set-Variable -Scope Global -Name M365FLogFile -Value $logFile
Write-M365FLog -Message "Starting CollabSpaceReport, includePrivateChannels is set to $IncludePrivateChannels" -Level Information

#Connect Services
Write-M365FLog -Message "Connecting to Services (SPO - Exchange - Teams)" -Level Information
Connect-M365F -SPO -Exchange -Teams

#Load SharePoint CSOM Assemblies
try 
{
    Write-M365FLog -Message "Loading CSOM Assemblies" -Level Information
    Add-Type -Path "C:\Program Files\WindowsPowerShell\Modules\Microsoft.Online.SharePoint.PowerShell\16.0.20324.12000\Microsoft.SharePoint.Client.dll"
    Add-Type -Path "C:\Program Files\WindowsPowerShell\Modules\Microsoft.Online.SharePoint.PowerShell\16.0.20324.12000\Microsoft.SharePoint.Client.Runtime.dll"
    Write-M365FLog -Message "CSOM Assemblies loaded" -Level Information
}
catch 
{
    Write-M365FLog -Message "Failed to load CSOM Assemblies" -Level Error
    Return
}

$CSOMCredentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Global:AdminCredentials.Username, $Global:AdminCredentials.Password)
Write-M365FLog -Message "CSOM Credentials built" -Level Information

#Scoped Variables
Write-M365FLog -Message 'Retrieving Unified Groups...' -Level Information
$UGroups = Get-UnifiedGroup -ResultSize Unlimited
$UGroupsCount = $UGroups | Measure-Object
Write-M365FLog -Message "$($UGroupsCount.Count) Unified Groups Found" -Level Information
$result = @()
$progress = 0



###########
## Begin ##
###########

$sites = Get-SPOSite -Limit All 
$total = $sites.Count 
Write-M365FLog -Message "$total sites Found" -Level Information

foreach ($site in $sites) 
{
    
    #Scoped Variables
    $Progress ++
    $processed = $false
    $SiteCreated = ''

    Write-M365FLog -Message "$progress/$total => Processing $($site.Url)" -Level Information

    #Is it a private channel ?
    if($site.Template -eq 'TEAMCHANNEL#0')
    {
        #In case private channel param is set to true
        if($IncludePrivateChannels)
        {
            $result += Get-M365FPrivateChannelDetail -site $site
            $Processed = $true
            Write-M365FLog -Message "[Processed] Private Channel - $($Site.Url)" -Level Information
        #Otherwise we skip this site
        }
        else 
        {
            $processed = $true
            Write-M365FLog -Message "[Skiped] Private Channel - $($Site.Url)" -Level Information
        }
    }
    #For non private channel sites, we retrieve the creation date
    else
    {
        $Ctx = New-Object Microsoft.SharePoint.Client.ClientContext($site.Url)
        $Ctx.Credentials = $CSOMCredentials
        $Web = $Ctx.Web
        $Ctx.Load($Web)
        
        try
        {
            $Ctx.ExecuteQuery()
            $SiteCreated = $Web.Created.ToShortDateString()
            $Ctx.Dispose()
        }
        catch
        {
            $SiteCreated = ''
            $Ctx.Dispose()
        }
    }

    #For non private channels, we define if the site is connected to an office 365 group
    if(!$processed)
    {
        if($UGroup = Get-M365FConnectedSiteGroup -site $site -UGroups $UGroups)
        {
            $result += Get-M365FConnectedSiteDetail -Ugroup $UGroup -SiteCreated $SiteCreated -site $site
            Write-M365FLog -Message "[Processed] SPO Connected site - $($Site.Url)" -Level Information
        }
        else
        {
            $result += Get-M365FSiteDetail -site $site -SiteCreated $SiteCreated
            Write-M365FLog -Message "[Processed] SPO Classic site - $($Site.Url)" -Level Information
        }
    }
}

Disconnect-M365F -Exchange -Teams

