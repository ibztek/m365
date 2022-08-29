# Admin Center Windows PowerShell

# Admin Center PowerShell Core

# Admin Center - MS Graph
1. Install-Module Microsoft.Graph (hvis en må oppgradere, legg til -forec på slutten)
2. Sjekk at installasjonen gikk igjennom: Get-InstalledModule Microsoft.Grap
3. 
4. List ut hvilke rettigheter en kan koble seg til med: Find-MgGraphCommand -command Get-MgUser | Select-Object -First 1 -ExpandProperty Permissions
5. Koble seg til: Connect-MgGraph -Scopes "User.ReadWrite.All","Group.ReadWrite.All","Directory.ReadWrite.All"
    - Merk at en kan velge å koble seg til med flere rettigheter ved å kjøre sammen kommando med annen scope.
6. Get-MgUser lister ut alle brukere i tenanten


# Exchange Online module
1. Install-Module -Name PowerShellGet -Force (mest trolig allerede installert)
2. Install-Module -Name ExchangeOnlineManagement
3. Sjekk om den er installert korrekt: (Get-Module -ListAvailable -Name ExchangeOnlineManagement) -ne $null 
4. Koble til Exchange Online: Connect-ExchangeOnline -UserPrincipalName brukernavn@domenenavn.onmicrosoft.com - Ved bruk av multifaktor autentisering vil dette gjøres gjennom nettleseren. MERK at det er lurt å ha nettleseren med samme bruker pålogget og åpent i bakgrunnen siden PowerShell velger å benytte sist aktive nettleservindu.
    - Merk: Om en før feilmeldingen: Exception: This parameter set requires WSMan, and no supported WSMan client
    library was found. WSMan is either not installed or unavailable for
    this system. Installer: Install-Module -Name PSWSMan
5. Sjekk at du har nødvendig tilgang: Get-EXOMailbox | ft UserPrincipalName,DisplayName



