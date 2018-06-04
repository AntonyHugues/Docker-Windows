# Ex�cuter Windows Update
# TODO - vous devrez le faire manuellement avec `sconfig`, si la mise � jour n�cessite un red�marrage

Install-Module -Name PSWindowsUpdate -Force
Import-Module PSWindowsUpdate
Get-WUInstall -AcceptAll -IgnoreReboot | Out-File C:\PSWindowsUpdate.log


# Installer Chocolatey 

Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))


# Installer des outils

choco install -y poshgit
choco install -y firefox
choco install -y visualstudiocode

# Installation de Docker

Install-Module DockerProvider -Force
Install-Package Docker -ProviderName DockerProvider -Force


# Installation de Docker Compose

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest "https://github.com/docker/compose/releases/download/1.19.0/docker-compose-Windows-x86_64.exe" -UseBasicParsing -OutFile $Env:ProgramFiles\docker\docker-compose.exe 


# D�sactiver le pare-feu et Defender 

Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
Set-MpPreference -DisableRealtimeMonitoring $true


# Clone laboratoire repo

cd C:\
git clone https://github.com/Treeptik/docker-windows-exercice.git


# tirer des images de laboratoire

docker image pull microsoft/windowsservercore
docker image pull microsoft/nanoserver