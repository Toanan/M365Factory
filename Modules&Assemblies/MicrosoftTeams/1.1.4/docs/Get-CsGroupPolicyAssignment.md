---
external help file:
Module Name: Microsoft.Teams.Config
online version: https://docs.microsoft.com/en-us/powershell/module/microsoft.teams.config/get-csgrouppolicyassignment
schema: 2.0.0
---

# Get-CsGroupPolicyAssignment

## SYNOPSIS
Get a specific group policy assignment

## SYNTAX

### Get2 (Default)
```
Get-CsGroupPolicyAssignment [-PolicyType <String>] [<CommonParameters>]
```

### Get
```
Get-CsGroupPolicyAssignment -GroupId <String> -PolicyType <String> [<CommonParameters>]
```

### Get1
```
Get-CsGroupPolicyAssignment -GroupId <String> [<CommonParameters>]
```

### GetViaIdentity
```
Get-CsGroupPolicyAssignment -InputObject <IIc3AdminConfigRpPolicyIdentity> [<CommonParameters>]
```

### GetViaIdentity1
```
Get-CsGroupPolicyAssignment -InputObject <IIc3AdminConfigRpPolicyIdentity> [<CommonParameters>]
```

## DESCRIPTION
Get a specific group policy assignment

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
Parameter Sets: Get, Get1
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
Parameter Sets: GetViaIdentity, GetViaIdentity1
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -PolicyType
.

```yaml
Type: System.String
Parameter Sets: Get, Get2
Aliases:

Required: True
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

### Microsoft.Teams.Config.Cmdlets.Models.IGroupAssignment

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

