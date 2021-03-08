function Get-M365FListItem {
    [CmdletBinding()]
    param (
        $SiteUrl,
        $LibraryName
    )
    
    begin {
        Connect-M365F -PNP -PNPUrl $SiteUrl
        $reportFolderPath = "<Report Folder>"
        $resultFileName = Convert-M365FDynamicText -Text "%functionName%(%year%-%month%-%day%-%hours%-%minutes%-%seconds%).csv"
        $resultFilePath = $reportFolderPath + $resultFileName
        "FileName,FilePath,Folder,Level" | Out-File $resultFilePath
    }
    
    process {
        $list = Get-PnPList -Identity $LibraryName
        $listItems = Get-PnPListItem -List $list
        foreach ($item in $listItems){
            $Level = $item.FieldValues['_Level']
            $ParentFolder = $item.FieldValues['FileDirRef']
            $Name = $item.FieldValues['FileLeafRef']
            $Path = $item.FieldValues['FileRef']

            "$Name,$Path,$ParentFolder,$Level" | Out-File $resultFilePath -Append
            

        }

        
    }
    
    end {
        
    }
}