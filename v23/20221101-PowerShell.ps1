Find-Module -Name AzureAD | Install-Module # deprecated
Find-Module -Name MSOnline | Install-Module # deprecated

Find-Module -Name Microsoft.Graph | Install-Module 



# Spesifiserer rettighetene tilkoblingen skal ha, alltid gi kun nødvendig rettighet.
Connect-MgGraph -Scopes "User.ReadWrite.All","Group.ReadWrite.All","Directory.ReadWrite.All"
Get-MgUser  | Format-List  ID, DisplayName, Mail, UserPrincipalName
Get-MgUser  | Select-Object  ID, DisplayName, Mail, UserPrincipalName | ft
Get-MgUser -UserID fec9ff51-f8f0-43ab-9493-5f52dbbe484f
Get-MgUser -UserID fec9ff51-f8f0-43ab-9493-5f52dbbe484f | Format-List 
Get-MgUser -UserID fec9ff51-f8f0-43ab-9493-5f52dbbe484f | format-list givenname, surname, UserPrincipalName
$testvariable = Get-MgUser -UserID fec9ff51-f8f0-43ab-9493-5f52dbbe484f | format-list givenname, surname, UserPrincipalName


<# kodesnutter brukt i videoen for New-MgUser #>

$PasswordProfile = @{
    Password = 'xWwvJ]6NMw+bWH-d'
    }  

New-MgUser -DisplayName "Mons Monsen" `
    -UserPrincipalName "Mons.Monsen@minundervisning.onmicrosoft.com" `
    -PasswordProfile $PasswordProfile `
    -AccountEnabled `
    -MailNickname "Mons.Monsen"


<# kodesnutter brukt i videoen for Update-MgUser #>

Update-MgUser -UserID ..... `
    -Department "IT" `
    -Company "Learn IT"
