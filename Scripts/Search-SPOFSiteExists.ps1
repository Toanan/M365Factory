Function Search-SPOFSiteExists{
    [CmdletBinding()]
    Param(
      [parameter(Mandatory=$True)]
        [ValidateNotNullorEmpty()]
        [String]$Url
    )

    try{
        $SiteExists = Get-SPOSite -Identity $Url -ErrorAction Stop
        $SiteExists = $true
    }catch{
        $SiteExists = $false
    }
    try{
        $RemovedSiteExists = Get-SPORemovedSite -Identity $Url -ErrorAction Stop
        $RemovedSiteExists = $true
    }catch{
        $RemovedSiteExists = $false
    }
    if($SiteExists){Throw "Please Double check, a site allready exists with this Url $Url"}
    if($RemovedSiteExists){Throw "Please Double check, a removed site allready exists with this Url $Url"}
}