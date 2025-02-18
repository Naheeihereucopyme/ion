$TempFolder = "$env:TEMP\GitHubDownloads"
New-Item -ItemType Directory -Path $TempFolder -Force | Out-Null

# ดาวน์โหลดไฟล์ทั้งหมด
$Files = @(
    "Wub_x64.exe",
    "Wub.ini",
    "Wub.exe",
    "ReadMe.txt"
)

$BaseUrl = "https://github.com/Naheeihereucopyme/ion/raw/refs/heads/main/Update%20Blocker/Wub"

foreach ($File in $Files) {
    $Url = "$BaseUrl/$File"
    $OutputFile = "$TempFolder\$File"
    Invoke-WebRequest -Uri $Url -OutFile $OutputFile
}

# รัน Wub_x64.exe
Start-Process -FilePath "$TempFolder\Wub_x64.exe"
