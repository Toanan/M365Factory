[HashTable]$ErrorCategory = @{0x80070057 = "InvalidArgument"
0x800703EC = "InvalidData"
0x80070490 = "ObjectNotFound"
0x80070520 = "SecurityError"
0x8007089A = "SecurityError"}

Function Add-StoredCredentials {
	<#
	.SYNOPSIS
	Adds credentials to the Windows Credential Manager
	.DESCRIPTION
	Adds credentials to the users Windows Credential Manager
	.PARAMETER UserName
	User name for the credential
	.PARAMETER Password
	The password for the credential, if not specified a secure entry box will promp for the password
	.PARAMETER Target
	Target of the credentials to add, defaults to the UserName
	.PARAMETER Type
	The type of credential to be stored, Defualts to GENERIC
	Valid values are: "GENERIC", "DOMAIN_PASSWORD", "DOMAIN_CERTIFICATE",
	"DOMAIN_VISIBLE_PASSWORD", "GENERIC_CERTIFICATE", "DOMAIN_EXTENDED",
	"MAXIMUM", "MAXIMUM_EX"
	more information on credentail types can be found at this link
	https://docs.microsoft.com/en-us/windows/win32/api/wincred/ns-wincred-credentiala
	.EXAMPLE
	Add-StoredCreentials -UserName SamDoe -Password $Password1! -Target https://my.account.com
	Stores the user name and password as a generic entry for https://my.account.com
	.EXAMPLE
	Add-StoredCreentials -UserName SamDoe -Target https://my.account.com
	Will prompt for the password then stores the user name and password as a generic entry for https://my.account.com
	.NOTES
	Copyright (C) MosaicMK Software LLC - All Rights Reserved
	Unauthorized copying of this application via any medium is strictly prohibited Proprietary and confidential
	Written by MosaicMK Software LLC (contact@mosaicmk.com)

	By using this software you agree to the following:
	Agreement Permission is hereby granted, free of charge, to any person or organization obtaining a copy of this software and associated documentation files (the 'Software'),
	to deal in the Software and the rights to use and distribute the software so long a no licensing and or documentation files are remove, revised or modified
	the Software is furnished to do so, subject to the following conditions:

	THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
	DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
	IN THE SOFTWARE.
	Contact: Contact@MosaicMK.com
	Version 1.0.1
	.LINK
	https://www.mosaicmk.com/2019/07/credential-management-module.html
	#>
	PARAM(
		[Parameter(Mandatory=$True)]
		[String]$UserName,
		[string]$Password,
		[string]$Target,
		[ValidateSet("GENERIC","DOMAIN_PASSWORD","DOMAIN_CERTIFICATE","DOMAIN_VISIBLE_PASSWORD","GENERIC_CERTIFICATE","DOMAIN_EXTENDED","MAXIMUM","MAXIMUM_EX")]
		[String]$Type = "GENERIC",
		[String]$Comment
	)
	if(!($Target)){$Target = $UserName}
	#CRED_MAX_DOMAIN_TARGET_NAME_LENGTH
	if($Type -ne "GENERIC" -and $Target.Length -gt 337){Throw "Length of target name is longer then 337 characters"}
	if(!($Comment)){$Comment = "Last edited by $Env:UserDomain\$Env:UserName on $Env:ComputerName"}
	[PsUtils.CredMan+Credential]$Cred = New-Object PsUtils.CredMan+Credential
	switch($Target -eq $UserName -and ($Type -eq "CRED_TYPE_DOMAIN_PASSWORD" -or $Type -eq "CRED_TYPE_DOMAIN_CERTIFICATE"))
	{
		$true  {$Cred.Flags = [PsUtils.CredMan+CRED_FLAGS]::USERNAME_TARGET}
		$false  {$Cred.Flags = [PsUtils.CredMan+CRED_FLAGS]::NONE}
	}

	IF (!($Password)){
		$Crd = Get-Credential -UserName $UserName -Message "Enter a User Name and Password"
		$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($Crd.Password)
		$Password = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
	}

	$Cred.Type = $Type
	$Cred.TargetName = $Target
	$Cred.UserName = $UserName
	$Cred.AttributeCount = 0
	$Cred.Persist = "ENTERPRISE"
	$Cred.CredentialBlobSize = [Text.Encoding]::Unicode.GetBytes($Password).Length
	$Cred.CredentialBlob = $Password
	$Cred.Comment = $Comment
	$Password = $null
	try{$Results = [PsUtils.CredMan]::CredWrite($Cred)}catch{Throw $_}
	if($Results){Throw "Failed to write to credentials store for $Target"}
}

Function Remove-StoredCredentials {
	<#
	.SYNOPSIS
	Removes credentials stored in the windows credential manager
	.DESCRIPTION
	Removes credentaials from the users credential manager
	.PARAMETER Target
	Target of the credentials to remove, if no target was specified in the create command the target will be the username
	.PARAMETER Type
	The type of credential to be removed, Defualts to GENERIC
	Valid values are: "GENERIC", "DOMAIN_PASSWORD", "DOMAIN_CERTIFICATE",
	"DOMAIN_VISIBLE_PASSWORD", "GENERIC_CERTIFICATE", "DOMAIN_EXTENDED",
	"MAXIMUM", "MAXIMUM_EX"
	more information on credentail types can be found at this link
	https://docs.microsoft.com/en-us/windows/win32/api/wincred/ns-wincred-credentiala
	.EXAMPLE
	Remove-StoredCredentials -Target https://my.account.com
	.NOTES
	Copyright (C) MosaicMK Software LLC - All Rights Reserved
	Unauthorized copying of this application via any medium is strictly prohibited Proprietary and confidential
	Written by MosaicMK Software LLC (contact@mosaicmk.com)

	By using this software you agree to the following:
	Agreement Permission is hereby granted, free of charge, to any person or organization obtaining a copy of this software and associated documentation files (the 'Software'),
	to deal in the Software and the rights to use and distribute the software so long a no licensing and or documentation files are remove, revised or modified
	the Software is furnished to do so, subject to the following conditions:

	THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
	DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
	IN THE SOFTWARE.
	Contact: Contact@MosaicMK.com
	Version 1.0.0
	.LINK
	https://www.mosaicmk.com/2019/07/credential-management-module.html
	#>
	Param(
		[Parameter(Mandatory=$true)]
		[String]$Target,
		[ValidateSet("GENERIC","DOMAIN_PASSWORD","DOMAIN_CERTIFICATE","DOMAIN_VISIBLE_PASSWORD","GENERIC_CERTIFICATE","DOMAIN_EXTENDED","MAXIMUM","MAXIMUM_EX")]
		[String]$Type = "GENERIC"
	)
	try{$Results = [PsUtils.CredMan]::CredDelete($Target, $Type)}catch{Throw $_}
	if($Results){Throw "Failed to delete credentials store for $Target"}
}


function Get-StoredCredentials {
	<#
	.SYNOPSIS
	Gets the specified credentails stored in Credential Manager
	.DESCRIPTION
	Gets the specified credentials stored in Credential Manager as a PSCredential object.
	.PARAMETER Target
	Target of the credentials to get, if no target was specified in the create command the target will be the username
	.PARAMETER Type
	The type of credential to be removed, Defualts to GENERIC
	Valid values are: "GENERIC", "DOMAIN_PASSWORD", "DOMAIN_CERTIFICATE",
	"DOMAIN_VISIBLE_PASSWORD", "GENERIC_CERTIFICATE", "DOMAIN_EXTENDED",
	"MAXIMUM", "MAXIMUM_EX"
	more information on credentail types can be found at this link
	https://docs.microsoft.com/en-us/windows/win32/api/wincred/ns-wincred-credentiala
	.EXAMPLE
	$Creds = Get-StoredCredentials -Target https://my.account.com
	Gets the credentials for https://my.account.com and stores them in the $Creds variable

	The credenatials can then be used in a command the accepts a PSCredential object like
	New-PSSession -ComputerName MyComputer -Credential $Creds
	.NOTES
	Copyright (C) MosaicMK Software LLC - All Rights Reserved
	Unauthorized copying of this application via any medium is strictly prohibited Proprietary and confidential
	Written by MosaicMK Software LLC (contact@mosaicmk.com)

	By using this software you agree to the following:
	Agreement Permission is hereby granted, free of charge, to any person or organization obtaining a copy of this software and associated documentation files (the 'Software'),
	to deal in the Software and the rights to use and distribute the software so long a no licensing and or documentation files are remove, revised or modified
	the Software is furnished to do so, subject to the following conditions:

	THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
	DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
	IN THE SOFTWARE.
	Contact: Contact@MosaicMK.com
	Version 1.0.0
	.LINK
	https://www.mosaicmk.com/2019/07/credential-management-module.html
	#>
	Param(
		[Parameter(Mandatory=$true)]
		[String]$Target,
		[ValidateSet("GENERIC","DOMAIN_PASSWORD","DOMAIN_CERTIFICATE","DOMAIN_VISIBLE_PASSWORD","GENERIC_CERTIFICATE","DOMAIN_EXTENDED","MAXIMUM","MAXIMUM_EX")]
		[String]$Type = "GENERIC"
	)

	[PsUtils.CredMan+Credential] $Cred = New-Object PsUtils.CredMan+Credential
	try{$Results = [PsUtils.CredMan]::CredRead($Target, $Type, [ref]$Cred)}catch{Throw $_}

	IF ($Results -eq 0){
		$username = $cred.UserName
		$SecurePassword = $cred.CredentialBlob | ConvertTo-SecureString -AsPlainText -Force
		New-Object System.Management.Automation.PSCredential $UserName, $SecurePassword
	} else {Throw "Error reading credentials for $Target from credentials store : $Results"}
}

function Get-ClearTextStoredCredentials {
	<#
	.SYNOPSIS
	Gets the specified credentails stored in Credential Manager
	.DESCRIPTION
	Gets the specified credentails stored in the users Credential Manager and stores them as clear text in a varbale
	so they can be used by other commands that do not accept a PSCredential object
	.PARAMETER Target
	Target of the credentials to get, if no target was specified in the create command the target will be the username
	.PARAMETER Type
	The type of credential to be removed, Defualts to GENERIC
	Valid values are: "GENERIC", "DOMAIN_PASSWORD", "DOMAIN_CERTIFICATE",
	"DOMAIN_VISIBLE_PASSWORD", "GENERIC_CERTIFICATE", "DOMAIN_EXTENDED",
	"MAXIMUM", "MAXIMUM_EX"
	more information on credentail types can be found at this link
	https://docs.microsoft.com/en-us/windows/win32/api/wincred/ns-wincred-credentiala
	.EXAMPLE
	$Creds = Get-ClearTextStoredCredentials -Target https://my.account.com
	Gets the credentials for https://my.account.com and stores them in the $Creds variable

	The credentials can then be used in commands the do not accept PSCredential object like
	Register-ScheduledTask -User $creds.UserName -Password $Creds.Password
	.NOTES
	Copyright (C) MosaicMK Software LLC - All Rights Reserved
	Unauthorized copying of this application via any medium is strictly prohibited Proprietary and confidential
	Written by MosaicMK Software LLC (contact@mosaicmk.com)

	By using this software you agree to the following:
	Agreement Permission is hereby granted, free of charge, to any person or organization obtaining a copy of this software and associated documentation files (the 'Software'),
	to deal in the Software and the rights to use and distribute the software so long a no licensing and or documentation files are remove, revised or modified
	the Software is furnished to do so, subject to the following conditions:

	THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
	DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
	IN THE SOFTWARE.
	Contact: Contact@MosaicMK.com
	Version 1.0.0
	.LINK
	https://www.mosaicmk.com/2019/07/credential-management-module.html
	#>
	Param(
		[Parameter(Mandatory=$true)]
		[String]$Target,
		[ValidateSet("GENERIC","DOMAIN_PASSWORD","DOMAIN_CERTIFICATE","DOMAIN_VISIBLE_PASSWORD","GENERIC_CERTIFICATE","DOMAIN_EXTENDED","MAXIMUM","MAXIMUM_EX")]
		[String]$Type = "GENERIC"
	)

	[PsUtils.CredMan+Credential] $Cred = New-Object PsUtils.CredMan+Credential
	try{$Results = [PsUtils.CredMan]::CredRead($Target, $Type, [ref]$Cred)}catch{Throw $_}
	IF ($Results -eq 0){
		$Credentials = New-Object -TypeName psobject
		$Credentials | Add-Member -MemberType NoteProperty -Name UserName -Value $cred.UserName
		$Credentials | Add-Member -MemberType NoteProperty -Name Password -Value $cred.CredentialBlob
		$Credentials | Add-Member -MemberType NoteProperty -Name LastModify -Value $cred.LastWritten
		$Credentials | Add-Member -MemberType NoteProperty -Name Type -Value $cred.Type
		$Credentials | Add-Member -MemberType NoteProperty -Name Persist -Value $cred.Persist
		$Credentials | Add-Member -MemberType NoteProperty -Name Comment -Value $cred.Comment
		$Credentials
	} else {Throw "Error reading credentials for $Target from credentials store : $Results"}
}