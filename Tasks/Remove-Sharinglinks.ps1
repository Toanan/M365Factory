#Crashing SPO... add delay
Connect-PnPOnline -Url "" -credentials "" 
$Ctx= Get-PnPContext 

$Files= Get-PnPListItem -List "Documents" 
foreach( $File in $Files) 
{        

    $Froles= $File.RoleAssignments 
    $Ctx.load($Froles) 
    $Ctx.ExecuteQuery() 

    If($Froles.Count -gt 0) 
    { 

        for ($i = $Froles.Count -1; $i -ge 0 ; --$i)   
        {    
            $Link=$Froles[$i].Member 
            $Ctx.Load($Link) 
            $Ctx.ExecuteQuery() 
            If($Link.title -like "SharingLinks*") 
            { 
            $Froles[$i].DeleteObject() 
            } 
            $Link = $null 
        }   
        $Ctx.ExecuteQuery()            
        }       
}