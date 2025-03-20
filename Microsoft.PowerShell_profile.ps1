Set-Alias n notepad
Set-Alias c code
Set-Alias d docker
Set-Alias m minikube
Set-Alias k kubectl
Set-Alias h helm
Set-Alias activate .\venv\Scripts\activate


function take {
 param(
     [string]$directory
 )

 if (-not (Test-Path $directory)) {
     New-Item -ItemType Directory -Path $directory | Out-Null
 }

 Set-Location -Path $directory
}

function clone {
 param(
     [string]$url
 )

 git clone $url

 $folderName = $url -replace '.*/(.*).git', '$1'

 if (Test-Path $folderName) {
     cd $folderName
 } else {
     Write-Host "Clone failed, cannot cd to a non-existing folder"
 }
}