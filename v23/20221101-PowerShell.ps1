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


Get-MgGroup
Get-MgUser


$Group = New-MgGroup -DisplayName "Test" -Description "Test  group" -MailEnabled:$True -SecurityEnabled:$False -MailNickname Test -GroupTypes Unified



Get-MgUser -Filter "department eq 'IT'"  
$userid = Get-MGUser -Filter "department eq 'IT'"     
Get-MgGroup -Filter "DisplayName eq 'IT'"  
$groupid = Get-MgGroup -Filter "DisplayName eq 'IT'" 
New-MgGroupMember -GroupId $groupid.id -DirectoryObjectId $userid.id

foreach ($user in $userid) { New-MgGroupMember -GroupId $groupid.id -DirectoryObjectId $user.id }
Get-MgGroupMember -GroupId $GroupId -All | ForEach {Get-MgUser -UserId $_.Id}

