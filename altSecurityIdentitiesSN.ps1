<#
.SYNOPSIS
Returns the certificate serial number in format for altSecurityIdentities.

.DESCRIPTION
This script accepts a certPath parameter for file location to the certificate.
Script prompt for file path if not supplied.  The debug parameter can be set
to $true to show original serial number and converted serial number.

.PARAMETER certPath
Specifies the file path to the certificate

.PARAMETER debug
If set to $true, script will show original serial number and converted serial number

.INPUTS
None
You cannot pipe objects to this script.

.OUTPUTS
String
Script shows what was updated.

.NOTES
This script requires the following:
    Exported certificate file

Description of examples below:
    Example 1: Have script prompt for certificate file path
    Example 2: Have script prompt for certificate file path and show both original and converted serial numbers
    Example 3: Supply certificate file path in parameter

.EXAMPLE
PS> & '.\altSecurityIdentitiesSN.ps1'

.EXAMPLE
PS> & '.\altSecurityIdentitiesSN.ps1' -debug $true

.EXAMPLE
PS> & '.\altSecurityIdentitiesSN.ps1' -certPath "C:\certs\cert.crt" 
#>

param ([System.String]$certPath,[System.Boolean]$debug)

if ($certPath -eq ""){
    $certPath = Read-Host "Enter File Path"
}

$sn = (Get-PfxCertificate -FilePath $certPath).SerialNumber
$altSecurityIdentitiesSerial = ""

if($debug){
    Write-Host "Original SN=$sn"
}

while ($sn.Length -gt 0){
    $lastTwoChars = $sn.Substring($sn.Length - 2)
    $sn = ($sn -split ".{2}$")[0]
    $altSecurityIdentitiesSerial += $lastTwoChars
}

if($debug){
    Write-Host "altSecurityIdentitiesSerial SN=$altSecurityIdentitiesSerial"
}

Return $altSecurityIdentitiesSerial