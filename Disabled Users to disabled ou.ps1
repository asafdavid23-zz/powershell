Get-Module ActiveDirectory
Get-ADUser -Filter {(Enabled -eq $false)} | ? { ($_.distinguishedname -notlike '*Disabled_Users*') } | Move-ADObject -TargetPath “OU=Disabled_Users, DC=clicksoftware,DC=com”