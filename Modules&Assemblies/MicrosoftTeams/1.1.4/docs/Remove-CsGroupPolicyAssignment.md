---
external help file:
Module Name: Microsoft.Teams.Config
online version: https://docs.microsoft.com/en-us/powershell/module/microsoft.teams.config/remove-csgrouppolicyassignment
schema: 2.0.0
---

# Remove-CsGroupPolicyAssignment

## SYNOPSIS
Remove policy assignment from a group

## SYNTAX

### Remove (Default)
```
Remove-CsGroupPolicyAssignment -GroupId <String> -PolicyType <String> [-PassThru] [-Confirm] [-WhatIf]
 [<CommonParameters>]
```

### RemoveViaIdentity
```
Remove-CsGroupPolicyAssignment -InputObject <IIc3AdminConfigRpPolicyIdentity> [-PassThru] [-Confirm] [-WhatIf]
 [<CommonParameters>]
```

## DESCRIPTION
Remove policy assignment from a group

## EXAMPLES

### Example 1: {{ Add title here }}
```powershell
PS C:\> {{ Add code here }}

{{ Add output here }}
```

{{ Add description here }}

### Example 2: {{ Add title here }}
```powershell
PS C:\> {{ Add code here }}

{{ Add output here }}
```

{{ Add description here }}

## PARAMETERS

### -GroupId
.

```yaml
Type: System.String
Parameter Sets: Remove
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
Identity Parameter
To construct, see NOTES section for INPUTOBJECT properties and create a hash table.

```yaml
Type: Microsoft.Teams.Config.Cmdlets.Models.IIc3AdminConfigRpPolicyIdentity
Parameter Sets: RemoveViaIdentity
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -PassThru
Returns true when the command succeeds

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PolicyType
.

```yaml
Type: System.String
Parameter Sets: Remove
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Microsoft.Teams.Config.Cmdlets.Models.IIc3AdminConfigRpPolicyIdentity

## OUTPUTS

### System.String

## NOTES

ALIASES

COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.


INPUTOBJECT <IIc3AdminConfigRpPolicyIdentity>: Identity Parameter
  - `[GroupId <String>]`: 
  - `[Identity <String>]`: 
  - `[OperationId <String>]`: OperationId received from submitting a batch
  - `[PolicyType <String>]`: 

## RELATED LINKS

