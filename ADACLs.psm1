#Requires -Module ActiveDirectory

#region look up guids
# https://devblogs.microsoft.com/powershell-community/understanding-get-acl-and-ad-drive-output/
$dse = Get-ADRootDSE

$Script:ObjectTypeGUID = @{[guid]'00000000-0000-0000-0000-000000000000' = '(any)'}

$GetADObjectParameter = @{
    SearchBase = $dse.SchemaNamingContext
    LDAPFilter = '(|(objectClass=attributeSchema)(objectClass=classSchema))' # indexed >=2008
    # LDAPFilter='(SchemaIDGUID=*)' # not indexed
    Properties = @("Name", "SchemaIDGUID")
}

Get-ADObject @GetADObjectParameter | ForEach-Object {$ObjectTypeGUID.Add([GUID]$_.SchemaIDGUID, $_.Name)}

$Script:RightsGUID = @{}

$ADObjExtPar = @{
    SearchBase = "CN=Extended-Rights,$($dse.ConfigurationNamingContext)"
    LDAPFilter = '(objectClass=ControlAccessRight)' # indexed >=2008
    # LDAPFilter='(rightsGuid=*)' # not indexed
    Properties = @("Name", "RightsGUID")
}

Get-ADObject @ADObjExtPar | ForEach-Object {$RightsGUID.Add([GUID]$_.RightsGUID, $_.Name)}
# '72e39547-7b18-11d1-adef-00c04fd8d5cd' exists twice, Validated-DNS-Host-Name and DNS-Host-Name-Attributes
#endregion look up guids

function ConvertFrom-ADObjectTypeGuid {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [guid]$guid
    )
    
    process {
        $ObjectTypeGUID[$guid]
    }
}

function ConvertFrom-ADRightsGuid {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [guid]$guid
    )
    
    process {
        $RightsGuid[$guid]
    }
}
