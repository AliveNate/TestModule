# .\Get-TestFunction

Function Get-TestFunction {
<#
    .SYNOPSIS
    This is the synopsis when a user uses get-help

    .DESCRIPTION
    This is the description when a user uses get-help

    .EXAMPLE
    This is an example when a user uses get-help
#>
[CmdletBinding()]
Param(
    [Parameter (Mandatory = $true)]
    [String] $param1,
    [Parameter (Mandatory = $false)]
    [bool] $param2
)#End Param

    Write-Host ("This is the function for Get-TestFunction")
    

}