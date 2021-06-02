$currentPath = "$(Get-Location)\"
$url = ((curl https://aka.ms/downloadazcopy-v10-windows -MaximumRedirection 0 -ErrorAction silentlycontinue).headers.location)
$ZipFile = $currentPath + $(Split-Path -Path $Url -Leaf) 
$Destination = $currentPath
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest $url -OutFile $ZipFile 

$ExtractShell = New-Object -ComObject Shell.Application 
$Files = $ExtractShell.Namespace($ZipFile).Items() 
$ExtractShell.NameSpace($Destination).CopyHere($Files) 
Start-Process $Destination

$UnzipPath = $currentPath + "$($(Get-Item $ZipFile).BaseName)"
$UnzipDestination = "$($Destination)\azcopy.exe"

if (Test-Path $UnzipDestination) {
    Remove-Item $UnzipDestination
}

Move-Item -Path "$($UnzipPath)\azcopy.exe" -Destination $UnzipDestination

Remove-Item $ZipFile -Force
Remove-Item $UnzipPath -Recurse -Force