# Default values
$filenameOption = "title"
$urlFile = "urls.txt"
$outputSpecified = $false
$inputSpecified = $false

# Parse parameters
foreach ($arg in $args) {
    if ($arg -match 'output=(.+)') {
        $filenameOption = $matches[1]
        $outputSpecified = $true
    } elseif ($arg -match 'input=(.+)') {
        $urlFile = $matches[1]
        $inputSpecified = $true
    }
}

# Get script name without preceding ".\"
$scriptName = [System.IO.Path]::GetFileNameWithoutExtension($MyInvocation.MyCommand.Path)

# Print instructions
if (-not $inputSpecified) {
    Write-Host "`nNote: You can optionally specify a file containing URLs as an input option when running this script."
    Write-Host "Example: $scriptName input=your_urls.txt`n"
}

if (-not $outputSpecified) {
    Write-Host "`nNote: You can optionally specify 'url' as an output option when running this script to save the filenames with the URL instead of the title."
    Write-Host "Example: $scriptName output=url`n"
}

# Print parameters
Write-Host "Parameter: input=$urlFile"
Write-Host "Parameter: output=$filenameOption"
Write-Host "Saving all screenshots in $(Get-Location)`n"
Write-Host "Running the script now...`n"

# Main loop
$x = 1
Get-Content $urlFile | ForEach-Object {
    $prefix = "{0:D4}" -f $x
    $filename = Get-ChildItem *_"$prefix"_* -ErrorAction SilentlyContinue

    if ($filename) {
        Write-Host "Skipping index $x because file exists: $($filename.FullName)"
    } else {
        Write-Host "$_ $x"
        node grab_url.js "$x" "$_" "$filenameOption"  # pass the filename option to the Node.js script
    }

    $x++
}
