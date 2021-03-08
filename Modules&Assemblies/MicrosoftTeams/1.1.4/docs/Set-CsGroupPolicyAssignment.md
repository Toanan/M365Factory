---
external help file:
Module Name: Microsoft.Teams.Config
online version: https://docs.microsoft.com/en-us/powershell/module/microsoft.teams.config/set-csgrouppolicyassignment
schema: 2.0.0
---

# Set-CsGroupPolicyAssignment

## SYNOPSIS
Update specific group's priority

## SYNTAX

### SetExpanded (Default)
```
Set-CsGroupPolicyAssignment -GroupId <String> -PolicyType <String> [-PolicyName <String>] [-Rank <Int32>]
 [-PassThru] [-Confirm] [-WhatIf] [<CommonParameters>]
```

### Set
```
Set-CsGroupPolicyAssignment -GroupId <String> -PolicyType <String> -UpdateParameter <IGroupUpdatePayload>
 [-PassThru] [-Confirm] [-WhatIf] [<CommonParameters>]
```

### SetViaIdentity
```
Set-CsGroupPolicyAssignment -InputObject <IIc3AdminConfigRpPolicyIdentity>
 -UpdateParameter <IGroupUpdatePayload> [-PassThru] [-Confirm] [-WhatIf] [<CommonParameters>]
```

### SetViaIdentityExpanded
```
Set-CsGroupPolicyAssignment -InputObject <IIc3AdminConfigRpPolicyIdentity> [-PolicyName <String>]
 [-Rank <Int32>] [-PassThru] [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Update specific group's priority

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
Parameter Sets: Set, SetExpanded
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
Parameter Sets: SetViaIdentity, SetViaIdentityExpanded
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

### -PolicyName
.

```yaml
Type: System.String
Parameter Sets: SetExpanded, SetViaIdentityExpanded
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
Parameter Sets: Set, SetExpanded
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Rank
.

```yaml
Type: System.Int32
Parameter Sets: SetExpanded, SetViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UpdateParameter
.
To construct, see NOTES section for UPDATEPARAMETER properties and create a hash table.

```yaml
Type: Microsoft.Teams.Config.Cmdlets.Models.IGroupUpdatePayload
Parameter Sets: Set, SetViaIdentity
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
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

### Microsoft.Teams.Config.Cmdlets.Models.IGroupUpdatePayload

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

UPDATEPARAMETER <IGroupUpdatePayload>: .
  - `[PolicyName <String>]`: 
  - `[Priority <Int32?>]`: 

## RELATED LINKS

