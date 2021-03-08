﻿# Set Script Path
$ScriptPath = Split-Path $MyInvocation.MyCommand.Path
Set-Variable -Name ModulePath -Scope Global -Value $ScriptPath

# Load Functions
Try
{
    Get-ChildItem "$ScriptPath\Scripts\*.ps1" | Select-Object -ExpandProperty FullName | ForEach-Object {
        $Function = Split-Path $_ -Leaf
        . $_
    }
}
Catch
{
    Write-Warning ("{0}: {1}" -f $Function,$_.Exception.Message)
    Continue
}

# Load Tools
Try
{
    Get-ChildItem "$ScriptPath\Tools\*.ps1" | Select-Object -ExpandProperty FullName | ForEach-Object {
        $Function = Split-Path $_ -Leaf
        . $_
    }
}
Catch
{
    Write-Warning ("{0}: {1}" -f $Function,$_.Exception.Message)
    Continue
}

# XML Config file
Try
{
    [XML]$AppConfig = Get-Content "$ScriptPath\Tools\SPOFCFG_BTCS.xml" -ErrorAction Stop
}
Catch
{
    throw "$ScriptPath\Tools\SPOFCfg_BTCS.xml not found or depreciated"
}

#Import XML Setting file
Import-M365FSetting -XMLConfig $AppConfig

Write-Host "$($XmlConfig.Config.AppName) Version $($XMLConfig.Config.Version) loaded" -ForegroundColor DarkGreen