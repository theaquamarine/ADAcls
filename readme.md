# ADAcls

Tools to make working with Active Directory ACLs easier

- Adds human-readable versions of the `ObjectType` and `InheritedObjectType` property on audit and access rules (`ActiveDirectoryAccessRule` and `ActiveDirectoryAuditRule` types)
- Adds `Path` property to output from ActiveDirectory cmdlets (`ADObject` type) to allow piping them to cmdlets expecting item paths, such as `Get-Acl`

## Usage

Import the module, then use the ActiveDirectory module as normal. The extra properties will be added automatically.

```powershell
C:\Windows\system32> ipmo ADAcls

C:\Windows\system32> Get-ADComputer DC01 | Get-Acl -Audit | select -ExpandProperty Audit

ActiveDirectoryRights   : ExtendedRight
InheritanceType         : All
ObjectType              : 73add077-b3bb-4f3b-84df-95fa37722949
InheritedObjectType     : bf967a86-0de6-11d0-a285-00aa003049e2
ObjectFlags             : ObjectAceTypePresent, InheritedObjectAceTypePresent
AuditFlags              : Success
IdentityReference       : Everyone
IsInherited             : True
InheritanceFlags        : ContainerInherit
PropagationFlags        : None
ObjectTypeName          : ms-Mcs-AdmPwd
InheritedObjectTypeName : Computer
```
