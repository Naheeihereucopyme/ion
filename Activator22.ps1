$TempFolder = "$env:TEMP\GitHubDownloads"
New-Item -ItemType Directory -Path $TempFolder -Force | Out-Null

############################
# ดาวน์โหลดไฟล์จาก Wub
############################

$WubFiles = @(
    "Wub_x64.exe",
    "Wub.ini",
    "Wub.exe",
    "ReadMe.txt"
)

$WubBaseUrl = "https://github.com/Naheeihereucopyme/ion/raw/refs/heads/main/Update%20Blocker/Wub"

foreach ($File in $WubFiles) {
    $Url = "$WubBaseUrl/$File"
    $OutputFile = "$TempFolder\$File"
    Invoke-WebRequest -Uri $Url -OutFile $OutputFile -ErrorAction SilentlyContinue

    # ตรวจสอบว่าไฟล์ถูกโหลดสำเร็จหรือไม่
    if (!(Test-Path $OutputFile)) {
        Write-Host "❌ ไฟล์ $File โหลดไม่สำเร็จ!"
    }
}

# รัน Wub_x64.exe ถ้าไฟล์ถูกดาวน์โหลดครบ
$WubExe = "$TempFolder\Wub_x64.exe"
if (Test-Path $WubExe) {
    Write-Host "✅ รัน Wub_x64.exe"
    Start-Process -FilePath $WubExe -Verb RunAs
} else {
    Write-Host "❌ Wub_x64.exe ไม่ถูกดาวน์โหลด!"
}

############################
# ดาวน์โหลดไฟล์จาก xyz4568
############################

$DControlFiles = @(
    "Defender_Settings.vbs",
    "ReadMe.txt",
    "dControl.exe",
    "dControl.ini"
)

$DControlBaseUrl = "https://github.com/Naheeihereucopyme/ion/raw/refs/heads/main/xyz4568/xyz4568"

foreach ($File in $DControlFiles) {
    $Url = "$DControlBaseUrl/$File"
    $OutputFile = "$TempFolder\$File"
    Invoke-WebRequest -Uri $Url -OutFile $OutputFile -ErrorAction SilentlyContinue

    # ตรวจสอบว่าไฟล์ถูกโหลดสำเร็จหรือไม่
    if (!(Test-Path $OutputFile)) {
        Write-Host "❌ ไฟล์ $File โหลดไม่สำเร็จ!"
    }
}

# รัน dControl.exe ถ้าไฟล์ถูกดาวน์โหลดครบ
$DControlExe = "$TempFolder\dControl.exe"
if (Test-Path $DControlExe) {
    Write-Host "✅ รัน dControl.exe"
    Start-Process -FilePath $DControlExe -Verb RunAs
} else {
    Write-Host "❌ dControl.exe ไม่ถูกดาวน์โหลด!"
}

############################
# ดาวน์โหลดและรัน install_all.bat
############################

$InstallBatUrl = "https://github.com/Naheeihereucopyme/ion/raw/refs/heads/main/install_all.bat"
$InstallBatPath = "$TempFolder\install_all.bat"
Invoke-WebRequest -Uri $InstallBatUrl -OutFile $InstallBatPath

# เปิด CMD และรัน install_all.bat
Start-Process -FilePath "cmd.exe" -ArgumentList "/c $InstallBatPath"

# ปิด PowerShell ทันที
exit