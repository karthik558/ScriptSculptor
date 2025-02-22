$desktopPath = [System.Environment]::GetFolderPath('Desktop')
$filePath = "$desktopPath\amal.csv"

if (Test-Path $filePath) {
    Write-Host "The file exists at $filePath"

    $userData = Import-Csv -Path $filePath
    Write-Host "CSV Data Imported sucessfully"

} else {
    Write-Host "file not found at $filePath, Please check the file location."
    }