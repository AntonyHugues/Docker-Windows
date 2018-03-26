$ProgressPreference = 'SilentlyContinue'
$dockerComposeVersion = "1.19.0"

Write-Output "-Installation de Docker Compose version $dockerComposeVersion"
Write-Output "--Téléchargement: https://github.com/docker/compose/releases/download/$dockerComposeVersion/docker-compose-Windows-x86_64.exe"

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest "https://github.com/docker/compose/releases/download/$dockerComposeVersion/docker-compose-Windows-x86_64.exe" -UseBasicParsing -OutFile $Env:ProgramFiles\docker\docker-compose.exe 

Write-Output "-Terminé"

docker-compose --version