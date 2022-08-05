


# Exchange Online module
1. Install-Module -Name PowerShellGet -Force (mest trolig allerede installert)
2. Install-Module -Name ExchangeOnlineManagement
3. Sjekk om den er installert korrekt: (Get-Module -ListAvailable -Name ExchangeOnlineManagement) -ne $null 
4. Koble til Exchange Online: Connect-ExchangeOnline -UserPrincipalName brukernavn@domenenavn.onmicrosoft.com - Ved bruk av multifaktor autentisering vil dette gjøres gjennom nettleseren. MERK at det er lurt å ha nettleseren med samme bruker pålogget og åpent i bakgrunnen siden PowerShell velger å benytte sist aktive nettleservindu.
    - Merk: Kan gi følgende feilmelding på andre operativsystemer enn Windows: Exception: This parameter set requires WSMan, and no supported WSMan client
    library was found. WSMan is either not installed or unavailable for
    this system.
5. Sjekk at du har nødvendig tilgang: Get-EXOMailbox | ft UserPrincipalName,DisplayName



