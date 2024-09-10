# Find the installed iTunes program and its IdentifyingNumber (Product Code)
$itunesApp = Get-WmiObject -Query "SELECT * FROM Win32_Product WHERE Name = 'iTunes'"

# Check if iTunes is installed
if ($itunesApp) {
    # Uninstall iTunes using MSIExec and the IdentifyingNumber (Product Code)
    $productCode = $itunesApp.IdentifyingNumber
    Start-Process -FilePath "msiexec.exe" -ArgumentList "/x $productCode /quiet /norestart" -Wait
    
} else {
    
}


# Find the iTunes app package from the Microsoft Store
$itunesApp1 = Get-AppxPackage -Name "*AppleInc.iTunes*"

# Check if the iTunes Microsoft Store app is installed
if ($itunesApp1) {
    # Uninstall iTunes
    Remove-AppxPackage -Package $itunesApp.PackageFullName
} else {
}


