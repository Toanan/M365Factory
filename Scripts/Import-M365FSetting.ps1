#Function to load XML setting file
function Import-M365FSetting ($ConfigPath) {
    
    Try
    {
        
        [XML]$AppConfig = Get-Content $ConfigPath -ErrorAction Stop
    }
    Catch
    {
        throw "$ScriptPath\Tools\SPOFCfg_BTCS.xml not found or depreciated"
    }

    If(Test-Path -Path "Variable:Global:XMLConfig") { 
        Remove-Variable -Name 'XMLConfig' -Scope Global
        New-Variable -Name 'XMLConfig' -Scope Global -Value $AppConfig
    }else {
        New-Variable -Name 'XMLConfig' -Scope Global -Value $AppConfig
    }

    Write-Host "Config Imported !"
}