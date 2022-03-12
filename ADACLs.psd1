@{
    RootModule = 'ADAcls.psm1'

    ModuleVersion = '0.0.1'

    Author = 'blue'

    GUID = 'c0d1ba51-f75b-4ea6-8309-fa7a25a4f167'

    Copyright = '(c) blue'

    Description = 'Tools to make working with Active Directory ACLs easier'

    RequiredModules = @('ActiveDirectory')

    TypesToProcess = 'ADAcls.Types.ps1xml','ADObject.Types.ps1xml'

    FunctionsToExport = 'ConvertFrom-ADObjectTypeGuid', 'ConvertFrom-ADRightsGuid'

    CmdletsToExport = @()

    VariablesToExport = @()

    AliasesToExport = @()

    # PowerShell Gallery: Define your module's metadata
    PrivateData = @{
            PSData = @{
                Tags = @('ActiveDirectory','AD')

                # LicenseUri = ''

                ProjectUri = 'https://github.com/theaquamarine/ADAcls'

                ExternalModuleDependencies = @('ActiveDirectory')
        }
    }
}
