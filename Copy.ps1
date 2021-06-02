$config = (Get-Content "C:/BackupToStorage/config.json" -Raw) | ConvertFrom-Json

$config | foreach {
    $source = $_.source
    $container = $_.container
    $identity = $_.identity

    $version = Get-Date -Format 'yyyyMMddhhmmss'
    $destiny = "$($container)$($version).txt"

    C:/BackupToStorage/azcopy login -identity $identity
    C:/BackupToStorage/azcopy copy $source $destiny
}
