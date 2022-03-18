# This is not a module, but a simple menu-based program to run through powershell and use the module/functions indirectly.
# For a new module, you made need to tell any PowerShell terminal about set-execution policy.
# Run this command, you only need it once, but need to run it in any powershell terminal that first time.
# Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

Import-Module TestModule -Force -Verbose

Function Set-MainMenu {
    Write-Host -ForegroundColor Yellow ("This is the menu")
    Write-Host -ForegroundColor Yellow ("`nSelections:")
    Write-Host -ForegroundColor Yellow (" 1) System Info        Enter: 1")
    Write-Host -ForegroundColor Yellow (" 2) Domain Info        Enter: 2")
    Write-Host -ForegroundColor Yellow (" 3) Others Info        Enter: 3")
    Write-Host -ForegroundColor Yellow (" 0) Quit               Enter: 0")
}#End function Set-MainMenu

# Global variable to allow user to quit the whole program from anywhere
$Global:quit = ""

do {

    Set-MainMenu #Show the user the menu

    $Global:quit = $Global:quit -Replace '\s', ''   # Remove spaces from variable
    $Global:quit = $Global:quit.ToLower()           # Make variable lowercase
    If ($Global:quit -eq "quit") {break}

    Write-Host ("In the main menu")
    Clear-Host  # Clear the terminal
    $choice = Read-Host ("Enter Choice: ")  # This will pause and wait for user input
    $choice = $choice -Replace '\s', ''   # Remove spaces from variable
    $choice = $choice.ToLower()           # Make variable lowercase

    switch($choice) {

        '1' {
            Write-Host ("You chose section 1")
            Get-TestFunction -param1 "testparam"

        }
        '2' {
            Write-Host ("You chose section 2")
            Get-TestFunction -param1 "testparam2"

        }
        '3' {
            Write-Host ("You chose section 3")
            Get-TestFunction -param1 "testparam3"

        }#End choices
    }#End Switch
    Set-MainMenu #Show the user the menu
} until ($choice -eq 0) #End do