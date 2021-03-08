---
external help file:
Module Name: Microsoft.Teams.Config
online version: https://docs.microsoft.com/en-us/powershell/module/microsoft.teams.config/new-csgrouppolicyassignment
schema: 2.0.0
---

# New-CsGroupPolicyAssignment

## SYNOPSIS
Assign a policy to a group

## SYNTAX

### NewExpanded (Default)
```
New-CsGroupPolicyAssignment -GroupId <String> -PolicyType <String> -PolicyName <String> [-Rank <Int32>]
 [-PassThru] [-Confirm] [-WhatIf] [<CommonParameters>]
```

### New
```
New-CsGroupPolicyAssignment -GroupId <String> -PolicyType <String> -AssignmentDefinition <IGroupAssignPayload>
 [-PassThru] [-Confirm] [-WhatIf] [<CommonParameters>]
```

### NewViaIdentity
```
New-CsGroupPolicyAssignment -InputObject <IIc3AdminConfigRpPolicyIdentity>
 -AssignmentDefinition <IGroupAssignPayload> [-PassThru] [-Confirm] [-WhatIf] [<CommonParameters>]
```

### NewViaIdentityExpanded
```
New-CsGroupPolicyAssignment -InputObject <IIc3AdminConfigRpPolicyIdentity> -PolicyName <String>
 [-Rank <Int32>] [-PassThru] [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Assign a policy to a group

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

### -AssignmentDefinition
.
To construct, see NOTES section for ASSIGNMENTDEFINITION properties and create a hash table.

```yaml
Type: Microsoft.Teams.Config.Cmdlets.Models.IGroupAssignPayload
Parameter Sets: New, NewViaIdentity
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -GroupId
.

```yaml
Type: System.String
Parameter Sets: New, NewExpanded
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
Parameter Sets: NewViaIdentity, NewViaIdentityExpanded
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
Parameter Sets: NewExpanded, NewViaIdentityExpanded
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PolicyType
.

```yaml
Type: System.String
Parameter Sets: New, NewExpanded
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
Parameter Sets: NewExpanded, NewViaIdentityExpanded
Aliases:

Required: False
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

### Microsoft.Teams.Config.Cmdlets.Models.IGroupAssignPayload

### Microsoft.Teams.Config.Cmdlets.Models.IIc3AdminConfigRpPolicyIdentity

## OUTPUTS

### System.String

## NOTES

ALIASES

COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.


ASSIGNMENTDEFINITION <IGroupAssignPayload>: .
  - `PolicyName <String>`: 
  - `[Priority <Int32?>]`: 

INPUTOBJECT <IIc3AdminConfigRpPolicyIdentity>: Identity Parameter
  - `[GroupId <String>]`: 
  - `[Identity <String>]`: 
  - `[OperationId <String>]`: OperationId received from submitting a batch
  - `[PolicyType <String>]`: 

## RELATED LINKS

