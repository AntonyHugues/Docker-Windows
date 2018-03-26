$ProgressPreference = 'SilentlyContinue'
$response = Invoke-WebRequest -UseBasicParsing https://api.github.com/repos/docker/compose/releases/latest
$content = $response.Content
$latest = ConvertFrom-Json $content
$dockerComposeVersion = $latest.tag_name

Write-Output "-Installation de Docker Compose version $dockerComposeVersion"
Write-Output "--Téléchargement: https://github.com/docker/compose/releases/download/$dockerComposeVersion/docker-compose-Windows-x86_64.exe"

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest "https://github.com/docker/compose/releases/download/$dockerComposeVersion/docker-compose-Windows-x86_64.exe" -UseBasicParsing -OutFile $Env:ProgramFiles\docker\docker-compose.exe

Write-Output "-Terminé"

docker-compose --version
