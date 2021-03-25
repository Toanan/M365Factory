#Requires -version 4.0
    <#
      .SYNOPSIS
      Starts a filesystemwatcher on the config file to re import it
  
      .DESCRIPTION
      Starts a filesystemwatcher on the config file to re import it
  
    #>
Function Start-M365FConfigWatcher {

    [CmdletBinding()]
        Param( 
            [parameter(Mandatory=$True)]
            $ConfigPath
        )

    #Creating the FileSystemWatcher
    $param = @{
        Path = Split-Path -Parent $ConfigPath;
        Filter = "*.xml";
        IncludeSubDirectories = $False;
        NotifyFilter = [System.IO.NotifyFilters]::FileName,[System.IO.NotifyFilters]::LastWrite
    }
    [IO.FileSystemWatcher]$scriptAccessWatcher = New-Object IO.FileSystemWatcher -property $param

    #Start watching
    Register-ObjectEvent $scriptAccessWatcher Changed -Action {
        Import-M365FSetting -ConfigPath $ConfigPath
    }
}