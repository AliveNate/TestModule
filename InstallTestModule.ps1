# For a new module, you made need to tell any PowerShell terminal about set-execution policy.
# Run this command, you only need it once, but need to run it in any powershell terminal that first time.
# Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
<#
We run:   .\ InstallModule.ps1 to install this module, and import all associated functions.
The default location for PowerShell 5.1 modules is:
C:\Program Files\WindowsPowerShell\Modules
#>


#  gl = get location, which the psscriptroot grabs the directory where this file is being run from.
# The user downloads this module to the downloads, executes the intall file.
# This whole module will be imported to the module directory, and the associated function will be imported into PowerShell
$gl = $PSScriptRoot
$functionPath = $gl


# Create a test file in the PowerShell module location to test for needed Admin privileges.
$modulePath = "C:\Program Files\WindowsPowerShell\Modules\"
$trialPath = "C:\Program Files\WindowsPowerShell\Modules\admintest\"
$trialFile = "C:\Program Files\WindowsPowerShell\Modules\admintest\testfile.txt"
New-Item -ItemType directory $trialPath

# Continue test, and add to file if it was created.
If (Test-Path -Path $trialPath) {
    New-Item -ItemType File $trialFile
    Add-Content -Path $trialFile -Value "Test text added to file"

    # If here, it was successful, remove the test file.
    Remove-Item -Path $trialPath -Recurse -Force 
} Else {
    Write-Warning ("User does not have admin privileges to adjust the WindowsPowerShell modules.")
    Pause 
}#End If/Else


# Copy the entire module folder into the WindowsPowerShell module location
Copy-Item $functionPath -Destination $modulePath -Recurse -Force

# we just copied the folder into the default modules location.
# Since it is here, we can now import the module into the cache
Import-Module TestModule -Force -Verbose 


# Now open an explorer window to the module so the user can see where it is
explorer.exe "C:\Program Files\WindowsPowerShell\Modules\TestModule"

