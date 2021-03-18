<#
.Synopsis
   Create a report csv file for OneDrive for Business
.DESCRIPTION
   This function create a report for OneDrive account in the tenant.
   It provides with URL and used storage
.EXAMPLE
   New-SPOFODReport
.EXAMPLE
   New-SPOFODReport -Verbose
#>
function New-M365FODReport
{

# Get a list of OneDrive for Business sites in the tenant sorted by the biggest consumer of quota
$ODFBSites = Get-SPOSite -IncludePersonalSite $True -Limit All -Filter "Url -like '-my.sharepoint.com/personal/'" | Select Owner, Title, URL, StorageQuota, StorageUsageCurrent | Sort StorageUsageCurrent -Desc
$TotalODFBGBUsed = [Math]::Round(($ODFBSites.StorageUsageCurrent | Measure-Object -Sum).Sum /1024,2)
$Report = [System.Collections.Generic.List[Object]]::new()
ForEach ($Site in $ODFBSites) {
      $ReportLine   = [PSCustomObject]@{
        Owner       = $Site.Title
        Email       = $Site.Owner
        URL         = $Site.URL
        QuotaGB     = [Math]::Round($Site.StorageQuota/1024,2) 
        UsedGB      = [Math]::Round($Site.StorageUsageCurrent/1024,4)
        PercentUsed = [Math]::Round(($Site.StorageUsageCurrent/$Site.StorageQuota * 100),4) }
      $Report.Add($ReportLine) }
$Report | Export-CSV -NoTypeInformation c:\temp\OneDriveSiteConsumption.CSV
Write-Host "Current OneDrive for Business storage consumption is" $TotalODFBGBUsed "GB. Report is in C:\temp\OneDriveSiteConsumption.CSV"
}