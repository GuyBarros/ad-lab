# ------------------------------------------------------------------------------
# OraDBA - Oracle Database Infrastructure and Security, 5630 Muri, Switzerland
# ------------------------------------------------------------------------------
# Name.......: 40_reset_ad_users.ps1
# Author.....: Stefan Oehrli (oes) stefan.oehrli@trivadis.com
# Editor.....: Stefan Oehrli
# Date.......: 2021.06.23
# Revision...: 
# Purpose....: Script to reset the active directory users
# Notes......: ...
# Reference..: 
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ------------------------------------------------------------------------------

# - Default Values -------------------------------------------------------------
$ScriptName     = $MyInvocation.MyCommand.Name
$Hostname       = (Hostname)
$ConfigScript   = (Split-Path $MyInvocation.MyCommand.Path -Parent) + "\00_init_environment.ps1"
# - EOF Variables --------------------------------------------------------------

# - Initialisation -------------------------------------------------------------
Write-Host
Write-Host "INFO: ==============================================================" 
Write-Host "INFO: Start $ScriptName on host $Hostname at" (Get-Date -UFormat "%d %B %Y %T")

# call Config Script
if ((Test-Path $ConfigScript)) {
    Write-Host "INFO: load default values from $DefaultPWDFile"
    . $ConfigScript
} else {
    Write-Error "ERROR: could not load default values"
    exit 1
}
# - EOF Initialisation ---------------------------------------------------------

# - Main -----------------------------------------------------------------------
Import-Module ActiveDirectory

# Update group membership of Trivadis LAB Users
Write-Host "INFO: Add grup $Company LAB Users to ORA_VFR_11G and ORA_VFR_12C..."
Add-ADPrincipalGroupMembership -Identity "$Company LAB Users" -MemberOf ORA_VFR_11G
# ORA_VFR_12C should yet not been used for EUS. Make sure you clarify the SHA512 issues on the DB first.
#Add-ADPrincipalGroupMembership -Identity "Trivadis LAB Users" -MemberOf ORA_VFR_12C

# reset passwords
Write-Host "INFO: Reset all User Passwords..."
Set-ADAccountPassword -Reset -NewPassword $SecurePassword -Identity guybarros
Set-ADAccountPassword -Reset -NewPassword $SecurePassword -Identity vaultadmin
Set-ADAccountPassword -Reset -NewPassword $SecurePassword -Identity readonly


Write-Host "INFO: Finish $ScriptName" (Get-Date -UFormat "%d %B %Y %T")
Write-Host "INFO: ==============================================================" 
# --- EOF ----------------------------------------------------------------------