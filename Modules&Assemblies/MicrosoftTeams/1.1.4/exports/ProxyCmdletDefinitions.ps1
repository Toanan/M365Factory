
# ----------------------------------------------------------------------------------
#
# Copyright Microsoft Corporation
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ----------------------------------------------------------------------------------

<#
.Synopsis
Get all batch operations for OAuth tenant
.Description
Get all batch operations for OAuth tenant
.Example
PS C:\> {{ Add code here }}

{{ Add output here }}
.Example
PS C:\> {{ Add code here }}

{{ Add output here }}

.Inputs
Microsoft.Teams.Config.Cmdlets.Models.IIc3AdminConfigRpPolicyIdentity
.Outputs
Microsoft.Teams.Config.Cmdlets.Models.IBatchJobStatus
.Outputs
Microsoft.Teams.Config.Cmdlets.Models.ISimpleBatchJobStatus
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

INPUTOBJECT <IIc3AdminConfigRpPolicyIdentity>: Identity Parameter
  [GroupId <String>]: 
  [Identity <String>]: 
  [OperationId <String>]: OperationId received from submitting a batch
  [PolicyType <String>]: 
.Link
https://docs.microsoft.com/en-us/powershell/module/microsoft.teams.config/get-csbatchpolicyassignmentoperation
#>
function Get-CsBatchPolicyAssignmentOperation {
[OutputType([Microsoft.Teams.Config.Cmdlets.Models.ISimpleBatchJobStatus], [Microsoft.Teams.Config.Cmdlets.Models.IBatchJobStatus])]
[CmdletBinding(DefaultParameterSetName='Get', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='Get1', Mandatory)]
    [Alias('OperationId')]
    [Microsoft.Teams.Config.Cmdlets.Category('Path')]
    [System.String]
    # OperationId received from submitting a batch
    ${Identity},

    [Parameter(ParameterSetName='GetViaIdentity', Mandatory, ValueFromPipeline)]
    [Microsoft.Teams.Config.Cmdlets.Category('Path')]
    [Microsoft.Teams.Config.Cmdlets.Models.IIc3AdminConfigRpPolicyIdentity]
    # Identity Parameter
    # To construct, see NOTES section for INPUTOBJECT properties and create a hash table.
    ${InputObject},

    [Parameter(ParameterSetName='Get')]
    [Microsoft.Teams.Config.Cmdlets.Category('Query')]
    [System.String]
    # Option filter
    ${Status},

    [Parameter(DontShow)]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Wait for .NET debugger to attach
    ${Break},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [Microsoft.Teams.Config.Cmdlets.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be appended to the front of the pipeline
    ${HttpPipelineAppend},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [Microsoft.Teams.Config.Cmdlets.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be prepended to the front of the pipeline
    ${HttpPipelinePrepend},

    [Parameter(DontShow)]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Uri]
    # The URI for the proxy server to use
    ${Proxy},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Management.Automation.PSCredential]
    # Credentials for a proxy server to use for the remote call
    ${ProxyCredential},

    [Parameter(DontShow)]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Use the default credentials for the proxy
    ${ProxyUseDefaultCredentials}
)

begin {
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $parameterSet = $PSCmdlet.ParameterSetName
        $mapping = @{
            Get = 'Microsoft.Teams.Config.private\Get-CsBatchPolicyAssignmentOperation_Get';
            Get1 = 'Microsoft.Teams.Config.private\Get-CsBatchPolicyAssignmentOperation_Get1';
            GetViaIdentity = 'Microsoft.Teams.Config.private\Get-CsBatchPolicyAssignmentOperation_GetViaIdentity';
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand(($mapping[$parameterSet]), [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters}
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($MyInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process {
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end {
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
}

# ----------------------------------------------------------------------------------
#
# Copyright Microsoft Corporation
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ----------------------------------------------------------------------------------

<#
.Synopsis
Get a specific group policy assignment
.Description
Get a specific group policy assignment
.Example
PS C:\> {{ Add code here }}

{{ Add output here }}
.Example
PS C:\> {{ Add code here }}

{{ Add output here }}

.Inputs
Microsoft.Teams.Config.Cmdlets.Models.IIc3AdminConfigRpPolicyIdentity
.Outputs
Microsoft.Teams.Config.Cmdlets.Models.IGroupAssignment
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

INPUTOBJECT <IIc3AdminConfigRpPolicyIdentity>: Identity Parameter
  [GroupId <String>]: 
  [Identity <String>]: 
  [OperationId <String>]: OperationId received from submitting a batch
  [PolicyType <String>]: 
.Link
https://docs.microsoft.com/en-us/powershell/module/microsoft.teams.config/get-csgrouppolicyassignment
#>
function Get-CsGroupPolicyAssignment {
[OutputType([Microsoft.Teams.Config.Cmdlets.Models.IGroupAssignment])]
[CmdletBinding(DefaultParameterSetName='Get2', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='Get', Mandatory)]
    [Parameter(ParameterSetName='Get1', Mandatory)]
    [Microsoft.Teams.Config.Cmdlets.Category('Path')]
    [System.String]
    # .
    ${GroupId},

    [Parameter(ParameterSetName='Get', Mandatory)]
    [Parameter(ParameterSetName='Get2')]
    [Microsoft.Teams.Config.Cmdlets.Category('Path')]
    [System.String]
    # .
    ${PolicyType},

    [Parameter(ParameterSetName='GetViaIdentity', Mandatory, ValueFromPipeline)]
    [Parameter(ParameterSetName='GetViaIdentity1', Mandatory, ValueFromPipeline)]
    [Microsoft.Teams.Config.Cmdlets.Category('Path')]
    [Microsoft.Teams.Config.Cmdlets.Models.IIc3AdminConfigRpPolicyIdentity]
    # Identity Parameter
    # To construct, see NOTES section for INPUTOBJECT properties and create a hash table.
    ${InputObject},

    [Parameter(DontShow)]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Wait for .NET debugger to attach
    ${Break},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [Microsoft.Teams.Config.Cmdlets.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be appended to the front of the pipeline
    ${HttpPipelineAppend},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [Microsoft.Teams.Config.Cmdlets.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be prepended to the front of the pipeline
    ${HttpPipelinePrepend},

    [Parameter(DontShow)]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Uri]
    # The URI for the proxy server to use
    ${Proxy},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Management.Automation.PSCredential]
    # Credentials for a proxy server to use for the remote call
    ${ProxyCredential},

    [Parameter(DontShow)]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Use the default credentials for the proxy
    ${ProxyUseDefaultCredentials}
)

begin {
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $parameterSet = $PSCmdlet.ParameterSetName
        $mapping = @{
            Get = 'Microsoft.Teams.Config.private\Get-CsGroupPolicyAssignment_Get';
            Get1 = 'Microsoft.Teams.Config.private\Get-CsGroupPolicyAssignment_Get1';
            Get2 = 'Microsoft.Teams.Config.private\Get-CsGroupPolicyAssignment_Get2';
            GetViaIdentity = 'Microsoft.Teams.Config.private\Get-CsGroupPolicyAssignment_GetViaIdentity';
            GetViaIdentity1 = 'Microsoft.Teams.Config.private\Get-CsGroupPolicyAssignment_GetViaIdentity1';
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand(($mapping[$parameterSet]), [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters}
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($MyInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process {
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end {
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
}

# ----------------------------------------------------------------------------------
#
# Copyright Microsoft Corporation
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ----------------------------------------------------------------------------------

<#
.Synopsis
Get a list of effective policies for User.
Taking direct assignments and group assignments into consideration
.Description
Get a list of effective policies for User.
Taking direct assignments and group assignments into consideration
.Example
PS C:\> {{ Add code here }}

{{ Add output here }}
.Example
PS C:\> {{ Add code here }}

{{ Add output here }}

.Inputs
Microsoft.Teams.Config.Cmdlets.Models.IIc3AdminConfigRpPolicyIdentity
.Outputs
Microsoft.Teams.Config.Cmdlets.Models.IEffectivePolicy
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

INPUTOBJECT <IIc3AdminConfigRpPolicyIdentity>: Identity Parameter
  [GroupId <String>]: 
  [Identity <String>]: 
  [OperationId <String>]: OperationId received from submitting a batch
  [PolicyType <String>]: 
.Link
https://docs.microsoft.com/en-us/powershell/module/microsoft.teams.config/get-csuserpolicyassignment
#>
function Get-CsUserPolicyAssignment {
[OutputType([Microsoft.Teams.Config.Cmdlets.Models.IEffectivePolicy])]
[CmdletBinding(DefaultParameterSetName='Get', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='Get', Mandatory)]
    [Alias('User')]
    [Microsoft.Teams.Config.Cmdlets.Category('Path')]
    [System.String]
    # .
    ${Identity},

    [Parameter(ParameterSetName='GetViaIdentity', Mandatory, ValueFromPipeline)]
    [Microsoft.Teams.Config.Cmdlets.Category('Path')]
    [Microsoft.Teams.Config.Cmdlets.Models.IIc3AdminConfigRpPolicyIdentity]
    # Identity Parameter
    # To construct, see NOTES section for INPUTOBJECT properties and create a hash table.
    ${InputObject},

    [Parameter()]
    [Microsoft.Teams.Config.Cmdlets.Category('Query')]
    [System.String]
    # .
    ${PolicyType},

    [Parameter(DontShow)]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Wait for .NET debugger to attach
    ${Break},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [Microsoft.Teams.Config.Cmdlets.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be appended to the front of the pipeline
    ${HttpPipelineAppend},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [Microsoft.Teams.Config.Cmdlets.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be prepended to the front of the pipeline
    ${HttpPipelinePrepend},

    [Parameter(DontShow)]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Uri]
    # The URI for the proxy server to use
    ${Proxy},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Management.Automation.PSCredential]
    # Credentials for a proxy server to use for the remote call
    ${ProxyCredential},

    [Parameter(DontShow)]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Use the default credentials for the proxy
    ${ProxyUseDefaultCredentials}
)

begin {
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $parameterSet = $PSCmdlet.ParameterSetName
        $mapping = @{
            Get = 'Microsoft.Teams.Config.private\Get-CsUserPolicyAssignment_Get';
            GetViaIdentity = 'Microsoft.Teams.Config.private\Get-CsUserPolicyAssignment_GetViaIdentity';
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand(($mapping[$parameterSet]), [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters}
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($MyInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process {
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end {
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
}

# ----------------------------------------------------------------------------------
#
# Copyright Microsoft Corporation
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ----------------------------------------------------------------------------------

<#
.Synopsis
Submit a new batch of policy assignments
.Description
Submit a new batch of policy assignments
.Example
PS C:\> {{ Add code here }}

{{ Add output here }}
.Example
PS C:\> {{ Add code here }}

{{ Add output here }}

.Inputs
Microsoft.Teams.Config.Cmdlets.Models.IBatchAssignBody
.Outputs
System.String
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

PAYLOAD <IBatchAssignBody>: .
  Identity <String[]>: 
  PolicyType <String>: 
  [AdditionalParameter <IBatchAssignBodyAdditionalParameters>]: 
    [(Any) <Object>]: This indicates any property can be added to this object.
  [PolicyName <String>]: 
.Link
https://docs.microsoft.com/en-us/powershell/module/microsoft.teams.config/new-csbatchpolicyassignmentoperation
#>
function New-CsBatchPolicyAssignmentOperation {
[OutputType([System.String])]
[CmdletBinding(DefaultParameterSetName='NewExpanded', PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
param(
    [Parameter()]
    [Microsoft.Teams.Config.Cmdlets.Category('Query')]
    [System.String]
    # string
    ${OperationName},

    [Parameter(ParameterSetName='New', Mandatory, ValueFromPipeline)]
    [Microsoft.Teams.Config.Cmdlets.Category('Body')]
    [Microsoft.Teams.Config.Cmdlets.Models.IBatchAssignBody]
    # .
    # To construct, see NOTES section for PAYLOAD properties and create a hash table.
    ${Payload},

    [Parameter(ParameterSetName='NewExpanded', Mandatory)]
    [Alias('User')]
    [Microsoft.Teams.Config.Cmdlets.Category('Body')]
    [System.String[]]
    # .
    ${Identity},

    [Parameter(ParameterSetName='NewExpanded', Mandatory)]
    [Microsoft.Teams.Config.Cmdlets.Category('Body')]
    [System.String]
    # .
    ${PolicyType},

    [Parameter(ParameterSetName='NewExpanded')]
    [Microsoft.Teams.Config.Cmdlets.Category('Body')]
    [Microsoft.Teams.Config.Cmdlets.Runtime.Info(PossibleTypes=([Microsoft.Teams.Config.Cmdlets.Models.IBatchAssignBodyAdditionalParameters]))]
    [System.Collections.Hashtable]
    # .
    ${AdditionalParameters},

    [Parameter(ParameterSetName='NewExpanded')]
    [Microsoft.Teams.Config.Cmdlets.Category('Body')]
    [System.String]
    # .
    ${PolicyName},

    [Parameter(DontShow)]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Wait for .NET debugger to attach
    ${Break},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [Microsoft.Teams.Config.Cmdlets.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be appended to the front of the pipeline
    ${HttpPipelineAppend},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [Microsoft.Teams.Config.Cmdlets.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be prepended to the front of the pipeline
    ${HttpPipelinePrepend},

    [Parameter(DontShow)]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Uri]
    # The URI for the proxy server to use
    ${Proxy},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Management.Automation.PSCredential]
    # Credentials for a proxy server to use for the remote call
    ${ProxyCredential},

    [Parameter(DontShow)]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Use the default credentials for the proxy
    ${ProxyUseDefaultCredentials}
)

begin {
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $parameterSet = $PSCmdlet.ParameterSetName
        $mapping = @{
            New = 'Microsoft.Teams.Config.private\New-CsBatchPolicyAssignmentOperation_New';
            NewExpanded = 'Microsoft.Teams.Config.private\New-CsBatchPolicyAssignmentOperation_NewExpanded';
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand(($mapping[$parameterSet]), [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters}
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($MyInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process {
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end {
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
}

# ----------------------------------------------------------------------------------
#
# Copyright Microsoft Corporation
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ----------------------------------------------------------------------------------

<#
.Synopsis
Assign a policy to a group
.Description
Assign a policy to a group
.Example
PS C:\> {{ Add code here }}

{{ Add output here }}
.Example
PS C:\> {{ Add code here }}

{{ Add output here }}

.Inputs
Microsoft.Teams.Config.Cmdlets.Models.IGroupAssignPayload
.Inputs
Microsoft.Teams.Config.Cmdlets.Models.IIc3AdminConfigRpPolicyIdentity
.Outputs
System.String
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

ASSIGNMENTDEFINITION <IGroupAssignPayload>: .
  PolicyName <String>: 
  [Priority <Int32?>]: 

INPUTOBJECT <IIc3AdminConfigRpPolicyIdentity>: Identity Parameter
  [GroupId <String>]: 
  [Identity <String>]: 
  [OperationId <String>]: OperationId received from submitting a batch
  [PolicyType <String>]: 
.Link
https://docs.microsoft.com/en-us/powershell/module/microsoft.teams.config/new-csgrouppolicyassignment
#>
function New-CsGroupPolicyAssignment {
[OutputType([System.String])]
[CmdletBinding(DefaultParameterSetName='NewExpanded', PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='New', Mandatory)]
    [Parameter(ParameterSetName='NewExpanded', Mandatory)]
    [Microsoft.Teams.Config.Cmdlets.Category('Path')]
    [System.String]
    # .
    ${GroupId},

    [Parameter(ParameterSetName='New', Mandatory)]
    [Parameter(ParameterSetName='NewExpanded', Mandatory)]
    [Microsoft.Teams.Config.Cmdlets.Category('Path')]
    [System.String]
    # .
    ${PolicyType},

    [Parameter(ParameterSetName='NewViaIdentity', Mandatory, ValueFromPipeline)]
    [Parameter(ParameterSetName='NewViaIdentityExpanded', Mandatory, ValueFromPipeline)]
    [Microsoft.Teams.Config.Cmdlets.Category('Path')]
    [Microsoft.Teams.Config.Cmdlets.Models.IIc3AdminConfigRpPolicyIdentity]
    # Identity Parameter
    # To construct, see NOTES section for INPUTOBJECT properties and create a hash table.
    ${InputObject},

    [Parameter(ParameterSetName='New', Mandatory, ValueFromPipeline)]
    [Parameter(ParameterSetName='NewViaIdentity', Mandatory, ValueFromPipeline)]
    [Microsoft.Teams.Config.Cmdlets.Category('Body')]
    [Microsoft.Teams.Config.Cmdlets.Models.IGroupAssignPayload]
    # .
    # To construct, see NOTES section for ASSIGNMENTDEFINITION properties and create a hash table.
    ${AssignmentDefinition},

    [Parameter(ParameterSetName='NewExpanded', Mandatory)]
    [Parameter(ParameterSetName='NewViaIdentityExpanded', Mandatory)]
    [Microsoft.Teams.Config.Cmdlets.Category('Body')]
    [System.String]
    # .
    ${PolicyName},

    [Parameter(ParameterSetName='NewExpanded')]
    [Parameter(ParameterSetName='NewViaIdentityExpanded')]
    [Microsoft.Teams.Config.Cmdlets.Category('Body')]
    [System.Int32]
    # .
    ${Rank},

    [Parameter(DontShow)]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Wait for .NET debugger to attach
    ${Break},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [Microsoft.Teams.Config.Cmdlets.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be appended to the front of the pipeline
    ${HttpPipelineAppend},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [Microsoft.Teams.Config.Cmdlets.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be prepended to the front of the pipeline
    ${HttpPipelinePrepend},

    [Parameter()]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Returns true when the command succeeds
    ${PassThru},

    [Parameter(DontShow)]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Uri]
    # The URI for the proxy server to use
    ${Proxy},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Management.Automation.PSCredential]
    # Credentials for a proxy server to use for the remote call
    ${ProxyCredential},

    [Parameter(DontShow)]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Use the default credentials for the proxy
    ${ProxyUseDefaultCredentials}
)

begin {
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $parameterSet = $PSCmdlet.ParameterSetName
        $mapping = @{
            New = 'Microsoft.Teams.Config.private\New-CsGroupPolicyAssignment_New';
            NewExpanded = 'Microsoft.Teams.Config.private\New-CsGroupPolicyAssignment_NewExpanded';
            NewViaIdentity = 'Microsoft.Teams.Config.private\New-CsGroupPolicyAssignment_NewViaIdentity';
            NewViaIdentityExpanded = 'Microsoft.Teams.Config.private\New-CsGroupPolicyAssignment_NewViaIdentityExpanded';
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand(($mapping[$parameterSet]), [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters}
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($MyInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process {
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end {
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
}

# ----------------------------------------------------------------------------------
#
# Copyright Microsoft Corporation
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ----------------------------------------------------------------------------------

<#
.Synopsis
Remove policy assignment from a group
.Description
Remove policy assignment from a group
.Example
PS C:\> {{ Add code here }}

{{ Add output here }}
.Example
PS C:\> {{ Add code here }}

{{ Add output here }}

.Inputs
Microsoft.Teams.Config.Cmdlets.Models.IIc3AdminConfigRpPolicyIdentity
.Outputs
System.String
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

INPUTOBJECT <IIc3AdminConfigRpPolicyIdentity>: Identity Parameter
  [GroupId <String>]: 
  [Identity <String>]: 
  [OperationId <String>]: OperationId received from submitting a batch
  [PolicyType <String>]: 
.Link
https://docs.microsoft.com/en-us/powershell/module/microsoft.teams.config/remove-csgrouppolicyassignment
#>
function Remove-CsGroupPolicyAssignment {
[OutputType([System.String])]
[CmdletBinding(DefaultParameterSetName='Remove', PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='Remove', Mandatory)]
    [Microsoft.Teams.Config.Cmdlets.Category('Path')]
    [System.String]
    # .
    ${GroupId},

    [Parameter(ParameterSetName='Remove', Mandatory)]
    [Microsoft.Teams.Config.Cmdlets.Category('Path')]
    [System.String]
    # .
    ${PolicyType},

    [Parameter(ParameterSetName='RemoveViaIdentity', Mandatory, ValueFromPipeline)]
    [Microsoft.Teams.Config.Cmdlets.Category('Path')]
    [Microsoft.Teams.Config.Cmdlets.Models.IIc3AdminConfigRpPolicyIdentity]
    # Identity Parameter
    # To construct, see NOTES section for INPUTOBJECT properties and create a hash table.
    ${InputObject},

    [Parameter(DontShow)]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Wait for .NET debugger to attach
    ${Break},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [Microsoft.Teams.Config.Cmdlets.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be appended to the front of the pipeline
    ${HttpPipelineAppend},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [Microsoft.Teams.Config.Cmdlets.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be prepended to the front of the pipeline
    ${HttpPipelinePrepend},

    [Parameter()]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Returns true when the command succeeds
    ${PassThru},

    [Parameter(DontShow)]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Uri]
    # The URI for the proxy server to use
    ${Proxy},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Management.Automation.PSCredential]
    # Credentials for a proxy server to use for the remote call
    ${ProxyCredential},

    [Parameter(DontShow)]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Use the default credentials for the proxy
    ${ProxyUseDefaultCredentials}
)

begin {
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $parameterSet = $PSCmdlet.ParameterSetName
        $mapping = @{
            Remove = 'Microsoft.Teams.Config.private\Remove-CsGroupPolicyAssignment_Remove';
            RemoveViaIdentity = 'Microsoft.Teams.Config.private\Remove-CsGroupPolicyAssignment_RemoveViaIdentity';
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand(($mapping[$parameterSet]), [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters}
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($MyInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process {
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end {
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
}

# ----------------------------------------------------------------------------------
#
# Copyright Microsoft Corporation
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ----------------------------------------------------------------------------------

<#
.Synopsis
Update specific group's priority
.Description
Update specific group's priority
.Example
PS C:\> {{ Add code here }}

{{ Add output here }}
.Example
PS C:\> {{ Add code here }}

{{ Add output here }}

.Inputs
Microsoft.Teams.Config.Cmdlets.Models.IGroupUpdatePayload
.Inputs
Microsoft.Teams.Config.Cmdlets.Models.IIc3AdminConfigRpPolicyIdentity
.Outputs
System.String
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

INPUTOBJECT <IIc3AdminConfigRpPolicyIdentity>: Identity Parameter
  [GroupId <String>]: 
  [Identity <String>]: 
  [OperationId <String>]: OperationId received from submitting a batch
  [PolicyType <String>]: 

UPDATEPARAMETER <IGroupUpdatePayload>: .
  [PolicyName <String>]: 
  [Priority <Int32?>]: 
.Link
https://docs.microsoft.com/en-us/powershell/module/microsoft.teams.config/set-csgrouppolicyassignment
#>
function Set-CsGroupPolicyAssignment {
[OutputType([System.String])]
[CmdletBinding(DefaultParameterSetName='SetExpanded', PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='Set', Mandatory)]
    [Parameter(ParameterSetName='SetExpanded', Mandatory)]
    [Microsoft.Teams.Config.Cmdlets.Category('Path')]
    [System.String]
    # .
    ${GroupId},

    [Parameter(ParameterSetName='Set', Mandatory)]
    [Parameter(ParameterSetName='SetExpanded', Mandatory)]
    [Microsoft.Teams.Config.Cmdlets.Category('Path')]
    [System.String]
    # .
    ${PolicyType},

    [Parameter(ParameterSetName='SetViaIdentity', Mandatory, ValueFromPipeline)]
    [Parameter(ParameterSetName='SetViaIdentityExpanded', Mandatory, ValueFromPipeline)]
    [Microsoft.Teams.Config.Cmdlets.Category('Path')]
    [Microsoft.Teams.Config.Cmdlets.Models.IIc3AdminConfigRpPolicyIdentity]
    # Identity Parameter
    # To construct, see NOTES section for INPUTOBJECT properties and create a hash table.
    ${InputObject},

    [Parameter(ParameterSetName='Set', Mandatory, ValueFromPipeline)]
    [Parameter(ParameterSetName='SetViaIdentity', Mandatory, ValueFromPipeline)]
    [Microsoft.Teams.Config.Cmdlets.Category('Body')]
    [Microsoft.Teams.Config.Cmdlets.Models.IGroupUpdatePayload]
    # .
    # To construct, see NOTES section for UPDATEPARAMETER properties and create a hash table.
    ${UpdateParameter},

    [Parameter(ParameterSetName='SetExpanded')]
    [Parameter(ParameterSetName='SetViaIdentityExpanded')]
    [Microsoft.Teams.Config.Cmdlets.Category('Body')]
    [System.String]
    # .
    ${PolicyName},

    [Parameter(ParameterSetName='SetExpanded')]
    [Parameter(ParameterSetName='SetViaIdentityExpanded')]
    [Microsoft.Teams.Config.Cmdlets.Category('Body')]
    [System.Int32]
    # .
    ${Rank},

    [Parameter(DontShow)]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Wait for .NET debugger to attach
    ${Break},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [Microsoft.Teams.Config.Cmdlets.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be appended to the front of the pipeline
    ${HttpPipelineAppend},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [Microsoft.Teams.Config.Cmdlets.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be prepended to the front of the pipeline
    ${HttpPipelinePrepend},

    [Parameter()]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Returns true when the command succeeds
    ${PassThru},

    [Parameter(DontShow)]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Uri]
    # The URI for the proxy server to use
    ${Proxy},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Management.Automation.PSCredential]
    # Credentials for a proxy server to use for the remote call
    ${ProxyCredential},

    [Parameter(DontShow)]
    [Microsoft.Teams.Config.Cmdlets.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Use the default credentials for the proxy
    ${ProxyUseDefaultCredentials}
)

begin {
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $parameterSet = $PSCmdlet.ParameterSetName
        $mapping = @{
            Set = 'Microsoft.Teams.Config.private\Set-CsGroupPolicyAssignment_Set';
            SetExpanded = 'Microsoft.Teams.Config.private\Set-CsGroupPolicyAssignment_SetExpanded';
            SetViaIdentity = 'Microsoft.Teams.Config.private\Set-CsGroupPolicyAssignment_SetViaIdentity';
            SetViaIdentityExpanded = 'Microsoft.Teams.Config.private\Set-CsGroupPolicyAssignment_SetViaIdentityExpanded';
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand(($mapping[$parameterSet]), [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters}
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($MyInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process {
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end {
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
}

# SIG # Begin signature block
# MIIjhgYJKoZIhvcNAQcCoIIjdzCCI3MCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDioc1K9lnvY1Ov
# NUEMySA0ehOvaPNi7rbEnjhpG+fiDaCCDYEwggX/MIID56ADAgECAhMzAAABh3IX
# chVZQMcJAAAAAAGHMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMjAwMzA0MTgzOTQ3WhcNMjEwMzAzMTgzOTQ3WjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQDOt8kLc7P3T7MKIhouYHewMFmnq8Ayu7FOhZCQabVwBp2VS4WyB2Qe4TQBT8aB
# znANDEPjHKNdPT8Xz5cNali6XHefS8i/WXtF0vSsP8NEv6mBHuA2p1fw2wB/F0dH
# sJ3GfZ5c0sPJjklsiYqPw59xJ54kM91IOgiO2OUzjNAljPibjCWfH7UzQ1TPHc4d
# weils8GEIrbBRb7IWwiObL12jWT4Yh71NQgvJ9Fn6+UhD9x2uk3dLj84vwt1NuFQ
# itKJxIV0fVsRNR3abQVOLqpDugbr0SzNL6o8xzOHL5OXiGGwg6ekiXA1/2XXY7yV
# Fc39tledDtZjSjNbex1zzwSXAgMBAAGjggF+MIIBejAfBgNVHSUEGDAWBgorBgEE
# AYI3TAgBBggrBgEFBQcDAzAdBgNVHQ4EFgQUhov4ZyO96axkJdMjpzu2zVXOJcsw
# UAYDVR0RBEkwR6RFMEMxKTAnBgNVBAsTIE1pY3Jvc29mdCBPcGVyYXRpb25zIFB1
# ZXJ0byBSaWNvMRYwFAYDVQQFEw0yMzAwMTIrNDU4Mzg1MB8GA1UdIwQYMBaAFEhu
# ZOVQBdOCqhc3NyK1bajKdQKVMFQGA1UdHwRNMEswSaBHoEWGQ2h0dHA6Ly93d3cu
# bWljcm9zb2Z0LmNvbS9wa2lvcHMvY3JsL01pY0NvZFNpZ1BDQTIwMTFfMjAxMS0w
# Ny0wOC5jcmwwYQYIKwYBBQUHAQEEVTBTMFEGCCsGAQUFBzAChkVodHRwOi8vd3d3
# Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY0NvZFNpZ1BDQTIwMTFfMjAx
# MS0wNy0wOC5jcnQwDAYDVR0TAQH/BAIwADANBgkqhkiG9w0BAQsFAAOCAgEAixmy
# S6E6vprWD9KFNIB9G5zyMuIjZAOuUJ1EK/Vlg6Fb3ZHXjjUwATKIcXbFuFC6Wr4K
# NrU4DY/sBVqmab5AC/je3bpUpjtxpEyqUqtPc30wEg/rO9vmKmqKoLPT37svc2NV
# BmGNl+85qO4fV/w7Cx7J0Bbqk19KcRNdjt6eKoTnTPHBHlVHQIHZpMxacbFOAkJr
# qAVkYZdz7ikNXTxV+GRb36tC4ByMNxE2DF7vFdvaiZP0CVZ5ByJ2gAhXMdK9+usx
# zVk913qKde1OAuWdv+rndqkAIm8fUlRnr4saSCg7cIbUwCCf116wUJ7EuJDg0vHe
# yhnCeHnBbyH3RZkHEi2ofmfgnFISJZDdMAeVZGVOh20Jp50XBzqokpPzeZ6zc1/g
# yILNyiVgE+RPkjnUQshd1f1PMgn3tns2Cz7bJiVUaqEO3n9qRFgy5JuLae6UweGf
# AeOo3dgLZxikKzYs3hDMaEtJq8IP71cX7QXe6lnMmXU/Hdfz2p897Zd+kU+vZvKI
# 3cwLfuVQgK2RZ2z+Kc3K3dRPz2rXycK5XCuRZmvGab/WbrZiC7wJQapgBodltMI5
# GMdFrBg9IeF7/rP4EqVQXeKtevTlZXjpuNhhjuR+2DMt/dWufjXpiW91bo3aH6Ea
# jOALXmoxgltCp1K7hrS6gmsvj94cLRf50QQ4U8Qwggd6MIIFYqADAgECAgphDpDS
# AAAAAAADMA0GCSqGSIb3DQEBCwUAMIGIMQswCQYDVQQGEwJVUzETMBEGA1UECBMK
# V2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
# IENvcnBvcmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUm9vdCBDZXJ0aWZpY2F0
# ZSBBdXRob3JpdHkgMjAxMTAeFw0xMTA3MDgyMDU5MDlaFw0yNjA3MDgyMTA5MDla
# MH4xCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMT
# H01pY3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTEwggIiMA0GCSqGSIb3DQEB
# AQUAA4ICDwAwggIKAoICAQCr8PpyEBwurdhuqoIQTTS68rZYIZ9CGypr6VpQqrgG
# OBoESbp/wwwe3TdrxhLYC/A4wpkGsMg51QEUMULTiQ15ZId+lGAkbK+eSZzpaF7S
# 35tTsgosw6/ZqSuuegmv15ZZymAaBelmdugyUiYSL+erCFDPs0S3XdjELgN1q2jz
# y23zOlyhFvRGuuA4ZKxuZDV4pqBjDy3TQJP4494HDdVceaVJKecNvqATd76UPe/7
# 4ytaEB9NViiienLgEjq3SV7Y7e1DkYPZe7J7hhvZPrGMXeiJT4Qa8qEvWeSQOy2u
# M1jFtz7+MtOzAz2xsq+SOH7SnYAs9U5WkSE1JcM5bmR/U7qcD60ZI4TL9LoDho33
# X/DQUr+MlIe8wCF0JV8YKLbMJyg4JZg5SjbPfLGSrhwjp6lm7GEfauEoSZ1fiOIl
# XdMhSz5SxLVXPyQD8NF6Wy/VI+NwXQ9RRnez+ADhvKwCgl/bwBWzvRvUVUvnOaEP
# 6SNJvBi4RHxF5MHDcnrgcuck379GmcXvwhxX24ON7E1JMKerjt/sW5+v/N2wZuLB
# l4F77dbtS+dJKacTKKanfWeA5opieF+yL4TXV5xcv3coKPHtbcMojyyPQDdPweGF
# RInECUzF1KVDL3SV9274eCBYLBNdYJWaPk8zhNqwiBfenk70lrC8RqBsmNLg1oiM
# CwIDAQABo4IB7TCCAekwEAYJKwYBBAGCNxUBBAMCAQAwHQYDVR0OBBYEFEhuZOVQ
# BdOCqhc3NyK1bajKdQKVMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMAsGA1Ud
# DwQEAwIBhjAPBgNVHRMBAf8EBTADAQH/MB8GA1UdIwQYMBaAFHItOgIxkEO5FAVO
# 4eqnxzHRI4k0MFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwubWljcm9zb2Z0
# LmNvbS9wa2kvY3JsL3Byb2R1Y3RzL01pY1Jvb0NlckF1dDIwMTFfMjAxMV8wM18y
# Mi5jcmwwXgYIKwYBBQUHAQEEUjBQME4GCCsGAQUFBzAChkJodHRwOi8vd3d3Lm1p
# Y3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY1Jvb0NlckF1dDIwMTFfMjAxMV8wM18y
# Mi5jcnQwgZ8GA1UdIASBlzCBlDCBkQYJKwYBBAGCNy4DMIGDMD8GCCsGAQUFBwIB
# FjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2RvY3MvcHJpbWFyeWNw
# cy5odG0wQAYIKwYBBQUHAgIwNB4yIB0ATABlAGcAYQBsAF8AcABvAGwAaQBjAHkA
# XwBzAHQAYQB0AGUAbQBlAG4AdAAuIB0wDQYJKoZIhvcNAQELBQADggIBAGfyhqWY
# 4FR5Gi7T2HRnIpsLlhHhY5KZQpZ90nkMkMFlXy4sPvjDctFtg/6+P+gKyju/R6mj
# 82nbY78iNaWXXWWEkH2LRlBV2AySfNIaSxzzPEKLUtCw/WvjPgcuKZvmPRul1LUd
# d5Q54ulkyUQ9eHoj8xN9ppB0g430yyYCRirCihC7pKkFDJvtaPpoLpWgKj8qa1hJ
# Yx8JaW5amJbkg/TAj/NGK978O9C9Ne9uJa7lryft0N3zDq+ZKJeYTQ49C/IIidYf
# wzIY4vDFLc5bnrRJOQrGCsLGra7lstnbFYhRRVg4MnEnGn+x9Cf43iw6IGmYslmJ
# aG5vp7d0w0AFBqYBKig+gj8TTWYLwLNN9eGPfxxvFX1Fp3blQCplo8NdUmKGwx1j
# NpeG39rz+PIWoZon4c2ll9DuXWNB41sHnIc+BncG0QaxdR8UvmFhtfDcxhsEvt9B
# xw4o7t5lL+yX9qFcltgA1qFGvVnzl6UJS0gQmYAf0AApxbGbpT9Fdx41xtKiop96
# eiL6SJUfq/tHI4D1nvi/a7dLl+LrdXga7Oo3mXkYS//WsyNodeav+vyL6wuA6mk7
# r/ww7QRMjt/fdW1jkT3RnVZOT7+AVyKheBEyIXrvQQqxP/uozKRdwaGIm1dxVk5I
# RcBCyZt2WwqASGv9eZ/BvW1taslScxMNelDNMYIVWzCCFVcCAQEwgZUwfjELMAkG
# A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQx
# HjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEoMCYGA1UEAxMfTWljcm9z
# b2Z0IENvZGUgU2lnbmluZyBQQ0EgMjAxMQITMwAAAYdyF3IVWUDHCQAAAAABhzAN
# BglghkgBZQMEAgEFAKCBrjAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgor
# BgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAvBgkqhkiG9w0BCQQxIgQgUuXz86+X
# WICGmVlWpap+MZbYJ/Tgfp2n1vQ66CJClWowQgYKKwYBBAGCNwIBDDE0MDKgFIAS
# AE0AaQBjAHIAbwBzAG8AZgB0oRqAGGh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbTAN
# BgkqhkiG9w0BAQEFAASCAQBeB7E7jYEGx8ZYrXX4JhdaGtMRHheSc2gy5EfgSd15
# 44SGLIK1eKmhimH1pOpgM5GqBX5IEE6FtchpoyTuIMZ1pkD6joPQYKwlTKO0ltQF
# a5Yu6qCb6KXAd1a9y5SE5B4yxyl+YfOKANZubh4PI2sOhN6pWsGGSdfLH8ECTes7
# jnpjgBgxoiQG0MIPBcDSeTNJaGKZASEyepg1/HcAWW2oMCGSKHxOpyP47VD6PDEZ
# wvy6groM+yiCezTHPCri68DzmMCxZhCGlSfH/vJXxY/ZNKAGzzXtJgW8g7fcTeIa
# 0Dlrjfu8FBToUXHyLaXSWDL6cKBU5aS9saVROuAtd3X9oYIS5TCCEuEGCisGAQQB
# gjcDAwExghLRMIISzQYJKoZIhvcNAQcCoIISvjCCEroCAQMxDzANBglghkgBZQME
# AgEFADCCAVEGCyqGSIb3DQEJEAEEoIIBQASCATwwggE4AgEBBgorBgEEAYRZCgMB
# MDEwDQYJYIZIAWUDBAIBBQAEIPUjSuzfGaNMM3eBbxK8VMVgy8Tdl4tXeekw+QAf
# KeNgAgZe8L1c5+8YEzIwMjAwNzA2MTg1NjA2Ljg5OFowBIACAfSggdCkgc0wgcox
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJTAjBgNVBAsTHE1p
# Y3Jvc29mdCBBbWVyaWNhIE9wZXJhdGlvbnMxJjAkBgNVBAsTHVRoYWxlcyBUU1Mg
# RVNOOjIyNjQtRTMzRS03ODBDMSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFt
# cCBTZXJ2aWNloIIOPDCCBPEwggPZoAMCAQICEzMAAAEY/jr32RvUsTMAAAAAARgw
# DQYJKoZIhvcNAQELBQAwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0
# b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3Jh
# dGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwHhcN
# MTkxMTEzMjE0MDM1WhcNMjEwMjExMjE0MDM1WjCByjELMAkGA1UEBhMCVVMxEzAR
# BgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1p
# Y3Jvc29mdCBDb3Jwb3JhdGlvbjElMCMGA1UECxMcTWljcm9zb2Z0IEFtZXJpY2Eg
# T3BlcmF0aW9uczEmMCQGA1UECxMdVGhhbGVzIFRTUyBFU046MjI2NC1FMzNFLTc4
# MEMxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2UwggEiMA0G
# CSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDC+ANcEX8/NRj1t5YkXYB1ZHPxQSwr
# hOOfXX1c5aes0t2gTI6OeH4ntcwpyTvSk7+9BBVoqTvHwfbDZmb15nQ94q+UPfBq
# a/8m1tes/6Fbt1AeVHy4By1AVFi6Yi1vWd3bVRyY2SAeVonIzEFGGtQveRv2Yj6j
# bCHE2+xP3Q+AcgxweE8l6/nAN5S/mTDKV2flHNQg+d5X9SSN7MdLC5OAJgSy374I
# i/AnYEKyIgnOFJVkIxkLDxOyrnV/gORloaxyVGlDemnLBNahwsxnmkrpChcwvDie
# Ax4g/Z1fJ0+C+wdA+EtA7rrgnRkjhKHfWkZj40bmx4GpQdJmF1zAZ0FxAgMBAAGj
# ggEbMIIBFzAdBgNVHQ4EFgQU8VvlsC4PYAnYOU/05iPr+LTHKD4wHwYDVR0jBBgw
# FoAU1WM6XIoxkPNDe3xGG8UzaFqFbVUwVgYDVR0fBE8wTTBLoEmgR4ZFaHR0cDov
# L2NybC5taWNyb3NvZnQuY29tL3BraS9jcmwvcHJvZHVjdHMvTWljVGltU3RhUENB
# XzIwMTAtMDctMDEuY3JsMFoGCCsGAQUFBwEBBE4wTDBKBggrBgEFBQcwAoY+aHR0
# cDovL3d3dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9NaWNUaW1TdGFQQ0FfMjAx
# MC0wNy0wMS5jcnQwDAYDVR0TAQH/BAIwADATBgNVHSUEDDAKBggrBgEFBQcDCDAN
# BgkqhkiG9w0BAQsFAAOCAQEAcyWdvg6cgs//AmxoQZm+WASpJzUXEPhMp30bWc5H
# yCwQB+Ma6YPncSoFdct/5V1K4p/rMcMLBn5LzELVH+uztg6ERK48YtbJb9A7Jp+f
# JZj7loXaP9mVP7tJs2tGuubcXpGbgo5HGCjn7gzMBHY45Q8LScfa1JFQEAiS2gCK
# KRlrKMsGaIbi+UuBtsbQ8JknvmiEwCCwSmRTX0viAZusm4mJVqKBe3Bmj+yBDJVW
# cv0MyrEYQ74oa0VSW3JBc+xSrqT2Jgm2Cc6IlSbm8AsiVE/Vc4yahfmLeeFHfTcr
# K0flu6VGzjf1GNA1SDXR4bUinrBli3lfhwtKhx6x5eRsSjCCBnEwggRZoAMCAQIC
# CmEJgSoAAAAAAAIwDQYJKoZIhvcNAQELBQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBSb290IENlcnRp
# ZmljYXRlIEF1dGhvcml0eSAyMDEwMB4XDTEwMDcwMTIxMzY1NVoXDTI1MDcwMTIx
# NDY1NVowfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNV
# BAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQG
# A1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwggEiMA0GCSqGSIb3
# DQEBAQUAA4IBDwAwggEKAoIBAQCpHQ28dxGKOiDs/BOX9fp/aZRrdFQQ1aUKAIKF
# ++18aEssX8XD5WHCdrc+Zitb8BVTJwQxH0EbGpUdzgkTjnxhMFmxMEQP8WCIhFRD
# DNdNuDgIs0Ldk6zWczBXJoKjRQ3Q6vVHgc2/JGAyWGBG8lhHhjKEHnRhZ5FfgVSx
# z5NMksHEpl3RYRNuKMYa+YaAu99h/EbBJx0kZxJyGiGKr0tkiVBisV39dx898Fd1
# rL2KQk1AUdEPnAY+Z3/1ZsADlkR+79BL/W7lmsqxqPJ6Kgox8NpOBpG2iAg16Hgc
# sOmZzTznL0S6p/TcZL2kAcEgCZN4zfy8wMlEXV4WnAEFTyJNAgMBAAGjggHmMIIB
# 4jAQBgkrBgEEAYI3FQEEAwIBADAdBgNVHQ4EFgQU1WM6XIoxkPNDe3xGG8UzaFqF
# bVUwGQYJKwYBBAGCNxQCBAweCgBTAHUAYgBDAEEwCwYDVR0PBAQDAgGGMA8GA1Ud
# EwEB/wQFMAMBAf8wHwYDVR0jBBgwFoAU1fZWy4/oolxiaNE9lJBb186aGMQwVgYD
# VR0fBE8wTTBLoEmgR4ZFaHR0cDovL2NybC5taWNyb3NvZnQuY29tL3BraS9jcmwv
# cHJvZHVjdHMvTWljUm9vQ2VyQXV0XzIwMTAtMDYtMjMuY3JsMFoGCCsGAQUFBwEB
# BE4wTDBKBggrBgEFBQcwAoY+aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraS9j
# ZXJ0cy9NaWNSb29DZXJBdXRfMjAxMC0wNi0yMy5jcnQwgaAGA1UdIAEB/wSBlTCB
# kjCBjwYJKwYBBAGCNy4DMIGBMD0GCCsGAQUFBwIBFjFodHRwOi8vd3d3Lm1pY3Jv
# c29mdC5jb20vUEtJL2RvY3MvQ1BTL2RlZmF1bHQuaHRtMEAGCCsGAQUFBwICMDQe
# MiAdAEwAZQBnAGEAbABfAFAAbwBsAGkAYwB5AF8AUwB0AGEAdABlAG0AZQBuAHQA
# LiAdMA0GCSqGSIb3DQEBCwUAA4ICAQAH5ohRDeLG4Jg/gXEDPZ2joSFvs+umzPUx
# vs8F4qn++ldtGTCzwsVmyWrf9efweL3HqJ4l4/m87WtUVwgrUYJEEvu5U4zM9GAS
# inbMQEBBm9xcF/9c+V4XNZgkVkt070IQyK+/f8Z/8jd9Wj8c8pl5SpFSAK84Dxf1
# L3mBZdmptWvkx872ynoAb0swRCQiPM/tA6WWj1kpvLb9BOFwnzJKJ/1Vry/+tuWO
# M7tiX5rbV0Dp8c6ZZpCM/2pif93FSguRJuI57BlKcWOdeyFtw5yjojz6f32WapB4
# pm3S4Zz5Hfw42JT0xqUKloakvZ4argRCg7i1gJsiOCC1JeVk7Pf0v35jWSUPei45
# V3aicaoGig+JFrphpxHLmtgOR5qAxdDNp9DvfYPw4TtxCd9ddJgiCGHasFAeb73x
# 4QDf5zEHpJM692VHeOj4qEir995yfmFrb3epgcunCaw5u+zGy9iCtHLNHfS4hQEe
# gPsbiSpUObJb2sgNVZl6h3M7COaYLeqN4DMuEin1wC9UJyH3yKxO2ii4sanblrKn
# QqLJzxlBTeCG+SqaoxFmMNO7dDJL32N79ZmKLxvHIa9Zta7cRDyXUHHXodLFVeNp
# 3lfB0d4wwP3M5k37Db9dT+mdHhk4L7zPWAUu7w2gUDXa7wknHNWzfjUeCLraNtvT
# X4/edIhJEqGCAs4wggI3AgEBMIH4oYHQpIHNMIHKMQswCQYDVQQGEwJVUzETMBEG
# A1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWlj
# cm9zb2Z0IENvcnBvcmF0aW9uMSUwIwYDVQQLExxNaWNyb3NvZnQgQW1lcmljYSBP
# cGVyYXRpb25zMSYwJAYDVQQLEx1UaGFsZXMgVFNTIEVTTjoyMjY0LUUzM0UtNzgw
# QzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaIjCgEBMAcG
# BSsOAwIaAxUAzdeb1yAva2kJJ2mFfDdeSfFJMdyggYMwgYCkfjB8MQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQg
# VGltZS1TdGFtcCBQQ0EgMjAxMDANBgkqhkiG9w0BAQUFAAIFAOKtsH8wIhgPMjAy
# MDA3MDYyMjE1MjdaGA8yMDIwMDcwNzIyMTUyN1owdzA9BgorBgEEAYRZCgQBMS8w
# LTAKAgUA4q2wfwIBADAKAgEAAgIgHwIB/zAHAgEAAgIRrTAKAgUA4q8B/wIBADA2
# BgorBgEEAYRZCgQCMSgwJjAMBgorBgEEAYRZCgMCoAowCAIBAAIDB6EgoQowCAIB
# AAIDAYagMA0GCSqGSIb3DQEBBQUAA4GBAGmStWZiyEzk9jByYseHf3yNZPpqY2EA
# lfCrL/WGmNdqL4hZmNDV7qNAyrEpCQdDVXPc13oFkk8HP3OcYmpsNGYO37D/K9T+
# 1NhDqtLwgVGpvAVYA8JkaSe13VU7GwGLD+/YLnGM8fGncoekJVyB0xlKaF0YWs/H
# eD8WtRLTMSjXMYIDDTCCAwkCAQEwgZMwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgT
# Cldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29m
# dCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENB
# IDIwMTACEzMAAAEY/jr32RvUsTMAAAAAARgwDQYJYIZIAWUDBAIBBQCgggFKMBoG
# CSqGSIb3DQEJAzENBgsqhkiG9w0BCRABBDAvBgkqhkiG9w0BCQQxIgQg1vq6ieT1
# egwirahYy6iGGdM57ThOh3LRgH4IJUDDZkEwgfoGCyqGSIb3DQEJEAIvMYHqMIHn
# MIHkMIG9BCCgzwcUm6pSA48AVS+9m5Z+k6cHH7WyNjvPil0oMg0H9zCBmDCBgKR+
# MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMT
# HU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwAhMzAAABGP4699kb1LEzAAAA
# AAEYMCIEIJ41iKri/xLkNyJLQ/c+HcGAxaELi+PekHor40OuQbATMA0GCSqGSIb3
# DQEBCwUABIIBAGfIWOW59rR/cxXwEbqrtLrQ609jL0GEwV3PLQDVb/EBTmF8MNGn
# JWwJsDfvPWTjKDYt27gCLBbC/OoLY7byuYMIVhEWxift9fl5eEg3tsLF0uGboFg1
# NV1TSLDDZpdNgA6fdxAYuasEX01vbL5c5yE/6yOgax+lDbXGPDmzoXQREdIXXmXu
# ujAqcyrwwDD3V8EqlWFDOJuOAaq5YhAYo+As6loAu7vPtrhI7+ZN3IblVXal8Gw6
# ad57cKbQrt+l1fQvZEb1k7TxMjutSBpB874Uo63pjkCJSS0AfKAhHW1IMGUbFvpG
# HJuZ7QEu9D0toQwol9oyLtnBMjE633/AVWM=
# SIG # End signature block
