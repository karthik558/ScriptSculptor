$desktopPath = [System.Environment]::GetFolderPath('Desktop')
# Check the working of these assigned location
$fileName = "amal.csv"
$filePath = "$desktopPath\"
# Assigned till here
$filePath = "$desktopPath\amal.csv"

$users = Import-Csv -Path "$filePath"

# Create users defined on the CSV file
foreach ($user in $users) {
    New-LocalUser -Name $user.Username -FullName $user.FullName -Description $user.Description -Password (ConvertTo-SecureString "TemporaryPassword123" -AsPlainText -Force)
    Add-LocalGroupMember -Group "Users" -Member $user.Username
}
