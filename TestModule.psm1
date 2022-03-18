
# TestModule.psm1
# This file is called from InstallTestModule.ps1
# This file IS NOT executed by the user - ever.

<#
.AUTHOR
    Nate Terry

.SYNOPSIS
    This is a module to be used as a template for future modules.
.DESCRIPTION
    Test module template
#>

# These imports are needed to operate this particular module
# This assumes that Remote Server Administration Tools powershell module has been installed in your system.
# Import-Module ActiveDirectory

# The psscriptroot directs powershell to this directory
# This module should have copied over the entire direction including the Functions folder
$functionPath = $PSScriptRoot + "\Functions\"

# Get list of all function names
$functionList = Get-ChildItem -Path $functionPath -Name 

# Loop over all files an ddot source them into the powershell system memory
# The dot  (.) is key here. LEAVE IT
Foreach ($function in $functionList) {
    .  ($functionPath + $function)
}#End Foreach 


