#Function to load XML setting file
function Import-M365FSetting ($XMLConfig) {

    If(Test-Path -Path "Variable:Global:XMLConfig") { 
        Remove-Variable -Name 'XMLConfig' -Scope Global
        New-Variable -Name 'XMLConfig' -Scope Global -Value $XMLConfig
    }else {
        New-Variable -Name 'XMLConfig' -Scope Global -Value $XMLConfig
    }
}