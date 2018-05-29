Import-Module ActiveDirectory

$users = Import-Csv -Path C:\Users\assafd\Desktop\usersil3.csv

foreach ($user in $users) {
    Get-ADUser -Identity $user.samaccountname -Properties * | Set-ADUser -Company $user.company -OfficePhone $user.telephoneNumber -MobilePhone $user.mobile -HomePhone $user.homephone
    Get-ADUser -Identity $user.samaccountname -Properties * | select SAMACCOUNTNAME, company, telephonenumber, mobile, homephone
    }


    
   
