Find-Module -Name AzureAD | Install-Module # deprecated
Find-Module -Name MSOnline | Install-Module # deprecated

Find-Module -Name Microsoft.Graph | Install-Module 



# Spesifiserer rettighetene tilkoblingen skal ha, alltid gi kun nødvendig rettighet.
Connect-MgGraph -Scopes "User.ReadWrite.All","Group.ReadWrite.All","Directory.ReadWrite.All"
Get-MgUser  | Format-List  ID, DisplayName, Mail, UserPrincipalName
Get-MgUser  | Select-Object  ID, DisplayName, Mail, UserPrincipalName | ft
Get-MgUser -UserID SKRIVID
Get-MgUser -UserID SKRIVID | Format-List 
# Vis Azure AD GUI
Get-MgUser -UserID SKRIVID | format-list givenname, surname, UserPrincipalName
$testvariable = Get-MgUser -UserID SKRIVID | format-list givenname, surname, UserPrincipalName


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



Get-MgUser -Filter "department eq 'IT'"  
$hrusers = Get-MGUser -Filter "department eq 'IT'"     
Get-MgGroup -Filter "DisplayName eq 'IT'"  
$hrgroup = Get-MgGroup -Filter "DisplayName eq 'IT'" 
New-MgGroupMember -GroupId $hrgroup.id -DirectoryObjectId $hrusers.id

foreach ($user in $hrusers) { New-MgGroupMember -GroupId $hrgroup.id -DirectoryObjectId $user.id }
