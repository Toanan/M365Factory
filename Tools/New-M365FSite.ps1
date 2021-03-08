<#
.Synopsis
   Create SharePoint Online website based on pre-configured Templates
.DESCRIPTION
   Create SharePoint Online website based on pre-configured Templates.
   Use of Site Design, SharePoint Modules and Client side object model (CSOM).
   The script needs a configuration file, SPFConfig.xml has to be in the root folder
.EXAMPLE
   New-SPOFSite -SiteName "My super site" -Template LA InternalTeamSite-En -Verbose
.EXAMPLE
   New-SPOFSite -SiteName "My super site" -Template LA InternalTeamSite-En -AdminCredentialsName 'MyStoredCredentials' -Verbose
#>
function New-M365FSite
{
    [CmdletBinding()]
    Param
    (
        #Site name
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        [String]$SiteName,

        #Site template to use
        [Parameter(Mandatory=$true)]
        [ValidateSet("LA InternalTeamSite","LA ExternalTeamSite","LA Division Site","LA-ExternalTeamSite","LA-ExternalComSite")]
        [string]$Template,

        #Regional settings to use
        [Parameter(Mandatory=$true)]
        [ValidateSet("EN","FR","US","DE")]
        [string]$Region
    )

    Begin
    {
        #We create the logfile full name
        $logFile = ''
        $logFilePath = '<LogFilePath>'
        $logFileName = Convert-M365FDynamicText -Text "%functionName%(%year%-%month%-%day%-%hours%-%minutes%-%seconds%).log"
        $logFile = "$logFilePath\$logFileName"
        Set-Variable -Scope Global -Name M365FLogFile -Value $logFile
        Write-M365FLog -Message "Starting New-M365FSite for $SiteName" -Level Information

        #We create an empty array to store classified errors
        $StepFails = @()
    }
    Process
    {
        #We connect to SPO & ExO services
        Connect-M365F -SPO -Exchange

        #We replace the Site name spaces with "_" to calculate the site url
        $NewSiteAlias = $SiteName -replace '\s','_'
        if($Template -eq "LA Division Site") {$NewSiteAlias = "ORG-$NewSiteAlias"}
        elseif ($Template -eq "LA-ExternalComSite") { $NewSiteAlias = "EXT-$NewSiteAlias" }

        #We load the site template from the Config XML file
        $SiteTemplate = $Global:XMLConfig.Config.SPOTemplate | Where-Object { $_.Name -eq $Template }
        $SiteRegion = $Global:XMLConfig.Config.Region | Where-Object { $_.Name -eq $Region }
        $NewSiteUrl = "$($XMLConfig.Config.SPOSiteRootUrl)$NewSiteAlias"

        #We process the SPO site Creation
        $HashSPOSiteCreation = @{
            Url = $NewSiteUrl
            Title = $SiteName
            Owner = $Global:AdminCredentials.UserName
            Template = $SiteTemplate.SPOTemplate
            StorageQuota = $SiteTemplate.StorageQuota
            LocaleId = $SiteRegion.Lcid
            TimeZoneId = $siteRegion.TimeZone
        }

        #We return SPO Site creation information in the console and ask for confirmation
        $HashSPOSiteCreation
        $Confirm = Read-Host "Confirm SharePoint Online Site creation ? Y/N"
        if($Confirm.ToUpper() -ne "Y")
        {
            write-host "SharePoint Online Site creation aborded" -foregroundColor Darkred
            return
        }

        #We check for duplicates with Groups DisplayName & SharePoint Online Site Url
        Write-Host "Searching for duplicates with Groups and SharePoint Online sites"
        Search-SPOFO365GroupExists -O365GroupName $NewSiteAlias        
        Search-SPOFSiteExists -Url $NewSiteUrl

        #We try to create the SPO Site
        Write-Host "Creating site $SiteName..."
        New-SpoSite @HashSPOSiteCreation -ErrorAction Stop | Out-Null
        Write-Host "$SiteName Created"

        #We try to get the newly created SPO Site to make sure it available for configuration
        $Continue = $false
        while (!($Continue)) 
        {
            try 
            {
                $Continue = $true
                Get-SPOSite -Identity $NewSiteUrl -ErrorAction Stop | Out-Null
            }
            catch 
            {
                $Continue = $false
            } 
        }        
        
        #We set the sharing capabilities of the SPO Site with the provided $Template
        Write-Host "Applying sharing settings to $($SiteTemplate.ExternalSharing)"
        Set-SPOSite -Identity $NewSiteUrl -DenyAddAndCustomizePages $false -SharingCapability $SiteTemplate.ExternalSharing 
        if($SiteTemplate.SharingForNonOnwer -eq "OFF") { 
            Write-Host "Applying non owner sharing settings to $($SiteTemplate.SharingForNonOnwer)"
            try
            {
                Set-SPOSite -Identity $NewSiteUrl -DisableSharingForNonOwners -ErrorAction Stop
            }
            catch
            {
                $StepFails += New-Object psobject -Property @{
                    Step = 'SharingForNonOwner'
                    ErrorMessage = $_.Exception.Message
                }
            }
        }

        #We set the access request settings of the SPO Site with the provided $Template
        if($SiteTemplate.AllowAccessRequest)
        {
            if($SiteTemplate.AllowAccessRequest -eq "ON"){$AllowAccessRequest=$true}else{$AllowAccessRequest=$false}
            Write-Host "Applying access request to $AllowAccessRequest"
            try{
                Set-SPOFAccessRequest -SiteUrl $NewSiteUrl -Enabled:$AllowAccessRequest
            }catch{
                $StepFails += New-Object psobject -Property @{
                    Step = 'AccessRequest'
                    ErrorMessage = $_.Exception.Message
                }
            }
        }

        #If the $Template provided requires a Site Design invocation, we run it
        if($SiteTemplate.SiteDesignId){
            Write-Host "Applying site design : $($SiteTemplate.SiteDesignId)"
            Invoke-PnPSiteDesign -Identity $SiteTemplate.SiteDesignId -WebUrl $NewSiteUrl
        }

        #If the $Template provided requires to promote the site as a HubSite, we do it
        if($SiteTemplate.isHubSite -eq "ON"){
            Write-Host "Promoting to HubSite"
            try{
                Register-SPOHubSite -Url $NewSiteUrl -Principals $null
            }catch{
                $StepFails += New-Object psobject -Property @{
                    Step = 'HubSitePromotion'
                    ErrorMessage = $_.Exception.Message
                }
            } 
        }

        #If the $Template provided requires a HubSiteAssociation, we run it  
        if($SiteTemplate.HubSiteUrl){
            Write-Host "Associating to HubSite : $($SiteTemplate.HubSiteUrl)"
            try{
                Add-SPOHubSiteAssociation -site $NewSiteUrl -hubsite $SiteTemplate.HubSiteUrl
                #If the $Template provided requires adding the new site to the Hub Site navigation, we add it
                if($SiteTemplate.AddToHubSiteNavigation){
                    if($SiteTemplate.HubSiteNavParent){
                        Write-Host "Adding navigation link to hubsite Navigation under $($SiteTemplate.HubSiteNavParent)"
                        Add-SPOFHubSiteNavigationLink -Url $NewSiteUrl -Name $SiteName -HubSiteUrl $SiteTemplate.HubSite -ParentNavigationNodeTitle $SiteTemplate.HubSiteNavParent
                    }else{
                        Write-Host "Adding navigation link to hubsite Navigation"
                        Add-SPOFHubSiteNavigationLink -Url $NewSiteUrl -Name $SiteName -HubSiteUrl $SiteTemplate.HubSite
                    }
                }
            }catch{
                $StepFails += New-Object psobject -Property @{
                    Step = 'HubSiteAssociation'
                    ErrorMessage = $_.Exception.Message
                }
            }
        }

        #Setting language traduction settings provided by site template
        if($SiteTemplate.Multilingual){
            Write-Host "Changing multilingual settings to : $($SiteTemplate.Multilingual)"
            try{
                Set-SPOFLanguageSettings -SiteUrl $NewSiteUrl -MultilingualSetting $SiteTemplate.Multilingual
            }catch{
                $StepFails += New-Object psobject -Property @{
                    Step = 'LanguageSettings'
                    ErrorMessage = $_.Exception.Message
                } 
            }
        }

        #We try to add Static Site Owners if provided by Site Template
        if($SiteTemplate.StaticOwner){
            Write-Host "Adding static Owner : $($SiteTemplate.StaticOwner)"
            try{
                Add-SPOFUserToOwnerGroup -SiteUrl $NewSiteUrl -Email $SiteTemplate.StaticOwner -ErrorAction Stop
                #Add-SPOUser -Site $NewSiteUrl -LoginName $SiteTemplate.StaticOwner -Group "$SiteName Owners" -ErrorAction Stop | Out-Null
            }catch{
                $StepFails += New-Object psobject -Property @{
                    Step = 'StaticOwner'
                    ErrorMessage = $_.Exception.Message
                } 
            }
        }

        #We set the classification of the SPO Site with the provided $Template
        if($SiteTemplate.Classification){
            try{
                Write-Host "Applying classification to $($SiteTemplate.Classification)"
                Set-SPOFSiteClassification -SiteUrl $NewSiteUrl -SiteTemplate $SiteTemplate.Classification
            }catch{
                $StepFails += New-Object psobject -Property @{
                    Step = 'SiteClassification'
                    ErrorMessage = $_.Exception.Message
                }
            }
        }

        if($StepFails){
            Write-Host "Errors while provisioning the SharePoint Online Site :" -foregroundColor Red
            $StepFails | Select-Object Step,ErrorMessage |  Format-Table -AutoSize 
            Write-Host "=> $NewSiteUrl"
        }else{
            write-host "All good => $NewSiteUrl" -ForegroundColor Green
        }            
    }
    End
    {
        #Close
        Disconnect-M365F -SPO -PNP -Exchange -Teams
    }
}



