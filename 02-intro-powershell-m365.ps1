# Find og installere moduler #
Find-Module -Name AzureAD | Install-Module
Import-Module AzureAD
Connect-AzureAD

Find-Module -Name MSOnline | Install-Module
Import-Module MSOnline
Connect-MsolService


# Sjekk hvilke kommandoner en har tilgjengelig samt list ut brukere (demobrukere)
Get-Command -Module MSOnline
Get-Command -Module AzureAD
Get-MsolUser
Get-Help New-MsolUser -Examples

New-MsolUser `
    -UserPrincipalName "" `
    -DisplayName "" `
    -FirstName "" `
    -LastName ""

# Opprett gruppe for testing med selv-service reset passord med MSol-modulen
Get-Help New-MsolGroup -Examples
New-MsolGroup -DisplayName "" -Description ""
Get-MsolGroup

Get-MsolUser 
Get-MsolUser | Select-Object ObjectID, UserPrincipalName
Get-Help Add-MsolGroupMember -Examples

Add-MsolGroupMember -groupObjectid "" `
    -groupmemberType "User" `
    -groupMemberObjectId ""

Get-Help Get-MsolGroupMember -Examples
Get-MsolGroupMember -groupObjectid ""

# Legg til flere brukere i en gruppe ved bruk av en ForEach løkke
Get-MsolUser | Select-Object ObjectID, UserPrincipalName
$users = Get-MsolUser | Select-Object ObjectID, UserPrincipalName
foreach ($user in $users) {
Add-MsolGroupMember -GroupObjectId "" `
    -groupmemberType "User" `
    -GroupMemberObjectId $user.ObjectID
}


Remove-MsolGroup -ObjectId ""


# Opprett gruppe for testing med selv-service reset passord med AzureAD-modulen
Get-Help New-AzureADGroup -Examples
New-AzureADGroup -DisplayName "" -MailEnabled $false -SecurityEnabled $true -MailNickName "NotSet"
Get-AzureAdGroup

Get-AzureADUser -SearchString ""
Get-Help Add-AzureADGroupMember -Examples
Add-AzureADGroupMember -ObjectID "" -RefObjectId ""
Get-AzureADGroupMember -ObjectID ""

$users = Get-AzureADUser | Select-Object ObjectID, UserPrincipalName
foreach ($user in $users) {
Add-AzureADGroupMember -ObjectID "" -RefObjectId $user.ObjectID
}

Get-AzureADGroupMember -ObjectID ""


# Opprette ny bruker
Get-Help New-AzureADUser -Examples


Get-AzureADUser -SearchString ""


# Legg til flere brukere via .csv fil
$myusers=Import-Csv ./M365-script/my-users.csv -Delimiter ";"
write-host $myusers

foreach ($user in $myusers) {
    $PasswordProfile=New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
    $PasswordProfile.Password=$user.Password
    New-AzureADUser `
        -GivenName $user.GivenName `
        -SurName $user.SurName `
        -DisplayName $user.DisplayName `
        -UserPrincipalName $user.UserPrincipalName `
        -MailNickName $user.MailNickName `
        -OtherMails $user.Altmailaddr `
        -PasswordProfile $PasswordProfile `
        -AccountEnabled $true
}

# Rydde opp etter testing
Get-AzureADUser -SearchString ""
Remove-AzureADUser -ObjectId ""
Get-AzureAdGroup
Remove-AzureADGroup -ObjectID ""



