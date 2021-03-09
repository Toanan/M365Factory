#Function to check if an O365Group exists
function Search-M365FO365GroupExists ($O365GroupName) {

    [bool]$GroupExists = $false
    try{$O365Group = Get-UnifiedGroup -identity $O365GroupName -ErrorAction Stop }catch{$GroupExists = $false}
    if ($O365Group) {$GroupExists = $true }

    if($GroupExists){throw "Please double check, an Office 365 group allready exists with this name"}
}
