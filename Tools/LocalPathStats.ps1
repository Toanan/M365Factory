<#
.SYNOPSIS
    Retrieve statistics from a selected path (recursive)
.DESCRIPTION
    Retrieve statistics from a selected path (recursive):
        Path = Selected Path
        ItemCount = Amount of Folders and files
        FolderCount = Amount of Folders
        FileCount = Amount of files
        MBLength = Total disk space in MB

.EXAMPLE
    Get-LocalPathStatistics -Path "c:/MyPath"
.EXAMPLE
    Get-LocalPathStatistics -Path "c:/MyPath/SubFolder"
#>
function Get-LocalPathStatistics {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]
        $Path
    )
    
    begin {

        if (-not (Test-Path -LiteralPath $path)) {
            Write-Error "Path does not exists, please double check" -ErrorAction Stop
        }

        $pathFolders = Get-ChildItem -Path $Path -Directory -Recurse
        $pathFiles = Get-ChildItem -Path $Path -File -Recurse
    }
    
    process {
        $cacheFiles = $pathFiles | Where-Object {$_.Name -like "~*"} 

        $LocalPathStats = New-Object -TypeName psobject -Property @{
            Path = $Path
            ItemCount = $pathFolders.Count + $pathFiles.Count
            FolderCount = $pathFolders.Count
            FileCount = $pathFiles.Count
            MBLength = ($pathFiles | Measure-Object Length -Sum).Sum/1MB
            CacheFiles = $cacheFiles
        }
    }
    
    
    end {
        Write-Output $LocalPathStats | Select-Object Path, ItemCount, FolderCount, FileCount, MBLength, CacheFiles
    }
}