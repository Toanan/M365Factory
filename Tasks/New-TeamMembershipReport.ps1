$CSVPath = "Url" + $Now + "TeamsReport.csv"
$userCredential = Get-StoredCredentials -Target "<CredName>"

Connect-MicrosoftTeams -Credential $userCredential

$allTeams = Get-Team
$result = @()

foreach($team in $allTeams){
    $Owners = (Get-TeamUser -GroupId $team.GroupId -Role "Owner").Name -join " - "
    $Members = (Get-TeamUser -GroupId $team.GroupId -Role "Member").Name -join " - "

    $output = New-Object psobject -Property @{
        TeamName = $team.DisplayName
        Owners = $Owners
        Members = $Members
    }
    $result += $output | Select-Object TeamName,Owners,Members
}

#Set Report file
$Now = Get-Date -Format "MM-dd-yyyy@hh-mm-ss"
$CSVPath = 'C:\L-Acoustics\M365Factory\Results' + "\" + $Now + "TeamsReport.csv"


$result | Export-Csv -Path $CSVPath -Encoding UTF8

Disconnect-MicrosoftTeams