# ManpWIN Release Packager
# This script creates a versioned zip file of the release build

# Configuration
$projectRoot = $PSScriptRoot
$publishDir = Join-Path $projectRoot "x64\Release\publish"
$releasesDir = Join-Path $projectRoot "releases"
$baseVersion = "1"
$startingMinorVersion = 3

# Files to include in the release
$filesToZip = @(
    "ManpWIN64.exe",
    "gmp-10.dll",
    "mpfr-6.dll",
    "libpng16.dll",
    "zlib1.dll"
)

# Create releases directory if it doesn't exist
if (-not (Test-Path $releasesDir)) {
    New-Item -ItemType Directory -Path $releasesDir | Out-Null
    Write-Host "Created releases directory: $releasesDir"
}

# Find the highest existing version number
$existingZips = Get-ChildItem -Path $releasesDir -Filter "manpwin-v$baseVersion.*.zip" -ErrorAction SilentlyContinue
$highestVersion = $startingMinorVersion - 1

if ($existingZips) {
    foreach ($zip in $existingZips) {
        if ($zip.Name -match "manpwin-v$baseVersion\.(\d+)\.zip") {
            $minorVersion = [int]$matches[1]
            if ($minorVersion -gt $highestVersion) {
                $highestVersion = $minorVersion
            }
        }
    }
}

# Increment version
$newMinorVersion = $highestVersion + 1
$newVersion = "$baseVersion.$newMinorVersion"
$zipFileName = "manpwin-v$newVersion.zip"
$zipFilePath = Join-Path $releasesDir $zipFileName

# Verify publish directory exists
if (-not (Test-Path $publishDir)) {
    Write-Error "Publish directory not found: $publishDir"
    Write-Error "Please build the project in Release mode first."
    exit 1
}

# Verify all required files exist
$missingFiles = @()
foreach ($file in $filesToZip) {
    $filePath = Join-Path $publishDir $file
    if (-not (Test-Path $filePath)) {
        $missingFiles += $file
    }
}

if ($missingFiles.Count -gt 0) {
    Write-Error "Missing required files in publish directory:"
    $missingFiles | ForEach-Object { Write-Error "  - $_" }
    exit 1
}

# Create the zip file
Write-Host "Creating release package: $zipFileName"
Write-Host "Version: v$newVersion"
Write-Host ""

# Remove existing zip if it exists (shouldn't happen, but just in case)
if (Test-Path $zipFilePath) {
    Remove-Item $zipFilePath -Force
}

# Create temporary staging directory
$tempDir = Join-Path $env:TEMP "manpwin-release-temp"
if (Test-Path $tempDir) {
    Remove-Item $tempDir -Recurse -Force
}
New-Item -ItemType Directory -Path $tempDir | Out-Null

# Copy files to temp directory
Write-Host "Copying files:"
foreach ($file in $filesToZip) {
    $sourcePath = Join-Path $publishDir $file
    $destPath = Join-Path $tempDir $file
    Copy-Item $sourcePath $destPath
    Write-Host "  + $file"
}

# Create the zip archive
Write-Host ""
Write-Host "Creating archive..."
Compress-Archive -Path "$tempDir\*" -DestinationPath $zipFilePath -CompressionLevel Optimal

# Clean up temp directory
Remove-Item $tempDir -Recurse -Force

# Display results
if (Test-Path $zipFilePath) {
    $zipSize = (Get-Item $zipFilePath).Length
    $zipSizeMB = [math]::Round($zipSize / 1MB, 2)
    
    Write-Host ""
    Write-Host "SUCCESS!" -ForegroundColor Green
    Write-Host "Release package created: $zipFileName"
    Write-Host "Location: $zipFilePath"
    Write-Host "Size: $zipSizeMB MB"
    Write-Host ""
    Write-Host "Files included:"
    foreach ($file in $filesToZip) {
        Write-Host "  - $file"
    }
} else {
    Write-Error "Failed to create zip file."
    exit 1
}
