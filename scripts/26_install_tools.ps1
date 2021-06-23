# ---------------------------------------------------------------------------
# Trivadis AG, Infrastructure Managed Services
# Saegereistrasse 29, 8152 Glattbrugg, Switzerland
# ---------------------------------------------------------------------------
# Name.......: 26_install_tools.ps1
# Author.....: Stefan Oehrli (oes) stefan.oehrli@trivadis.com
# Editor.....: Stefan Oehrli
# Date.......: 2019.05.13
# Revision...: 
# Purpose....: Script to install tools via chocolatey package
# Notes......: ...
# Reference..: 
# License....: Licensed under the Universal Permissive License v 1.0 as 
#              shown at http://oss.oracle.com/licenses/upl.
# ---------------------------------------------------------------------------
# Modified...:
# see git revision history for more information on changes/updates
# ---------------------------------------------------------------------------

# - Main --------------------------------------------------------------------
Write-Host '= Start setup part 6 ======================================='
# - Install tools --------------------------------------------------
Write-Host '- Installing putty, winscp and other tools -----------------'
choco install --yes --no-progress --limitoutput winscp putty putty.install
choco install --yes --no-progress --limitoutput totalcommander
#choco install -y wsl

# development
Write-Host '- Installing DEV tools -------------------------------------'
choco install --yes --no-progress --limitoutput git github-desktop vscode

# Google chrome
Write-Host '- Installing Google Chrome ----------------------------------'
choco install --yes --no-progress --limitoutput googlechrome

# LDAP Utilities
Write-Host '- Installing LDAP utilities --------------------------------'
choco install --yes --no-progress --limitoutput softerraldapbrowser ldapadmin ldapexplorer

# Oracle stuff
#choco install -y oracle-sql-developer
Write-Host '= Finish part 6 ============================================'
# --- EOF --------------------------------------------------------------------