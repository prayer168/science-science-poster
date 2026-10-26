[CmdletBinding(SupportsShouldProcess=$true)]
param(
    [switch]$SkipSoftware,
    [switch]$SkipProjects,
    [switch]$SkipSkillCopy
)

$ErrorActionPreference = 'Stop'
$script:InstallerCmdlet = $PSCmdlet
$skillName = 'science-fair-poster'
$skillSource = Split-Path -Parent $PSScriptRoot
$skillTarget = Join-Path $env:USERPROFILE ".codex\skills\$skillName"
$projectRoot = Join-Path $env:USERPROFILE '.codex\poster-tools'

function Install-WingetPackage([string]$Id) {
    if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
        throw 'winget is required. Install or update App Installer, then rerun this script.'
    }
    if ($script:InstallerCmdlet.ShouldProcess($Id, 'Install package with winget')) {
        & winget install --exact --id $Id --accept-package-agreements --accept-source-agreements --disable-interactivity
        if ($LASTEXITCODE -ne 0) { throw "winget failed to install $Id (exit $LASTEXITCODE)." }
    }
}

function Clone-Project([string]$Url, [string]$Destination) {
    if (Test-Path -LiteralPath $Destination) {
        Write-Host "Keeping existing project folder: $Destination"
        return
    }
    if ($script:InstallerCmdlet.ShouldProcess($Destination, "Clone $Url")) {
        $gitExe = (Get-Command git -ErrorAction SilentlyContinue).Source
        if (-not $gitExe -and (Test-Path "$env:ProgramFiles\Git\cmd\git.exe")) { $gitExe = "$env:ProgramFiles\Git\cmd\git.exe" }
        if (-not $gitExe) { throw 'Git is not available in this shell. Restart PowerShell after installation and rerun this script.' }
        & $gitExe clone --depth 1 $Url $Destination
        if ($LASTEXITCODE -ne 0) { throw "git clone failed: $Url" }
    }
}

if (-not $SkipSkillCopy) {
    if ($script:InstallerCmdlet.ShouldProcess($skillTarget, 'Install/update Codex skill files')) {
        New-Item -ItemType Directory -Force -Path $skillTarget, (Join-Path $skillTarget 'agents'), (Join-Path $skillTarget 'references') | Out-Null
        Copy-Item -LiteralPath (Join-Path $skillSource 'SKILL.md') -Destination $skillTarget -Force
        Copy-Item -LiteralPath (Join-Path $skillSource 'agents\openai.yaml') -Destination (Join-Path $skillTarget 'agents') -Force
        Copy-Item -LiteralPath (Join-Path $skillSource 'references\CHANGELOG.md') -Destination (Join-Path $skillTarget 'references') -Force
    }
}

if (-not $SkipSoftware) {
    foreach ($package in @(
        'Git.Git',
        'Python.Python.3.12',
        'GoLang.Go',
        'Inkscape.Inkscape',
        'Scribus.Scribus',
        'Jamovi.Desktop.Solid'
    )) { Install-WingetPackage $package }
}

if (-not $SkipProjects) {
    if ($script:InstallerCmdlet.ShouldProcess($projectRoot, 'Create poster project tools folder')) {
        New-Item -ItemType Directory -Force -Path $projectRoot | Out-Null
    }
    Clone-Project 'https://github.com/shaongitbd/doory.git' (Join-Path $projectRoot 'doory')
    $ghostPoster = Join-Path $projectRoot 'GhostPoster'
    Clone-Project 'https://github.com/nftomczain/GhostPoster.git' $ghostPoster
    $tileProject = Join-Path $projectRoot 'tile'
    Clone-Project 'https://github.com/cvsouth/tile.git' $tileProject

    if (Test-Path -LiteralPath $tileProject) {
        $goExe = (Get-Command go -ErrorAction SilentlyContinue).Source
        if (-not $goExe -and (Test-Path "$env:ProgramFiles\Go\bin\go.exe")) { $goExe = "$env:ProgramFiles\Go\bin\go.exe" }
        if ($goExe -and $script:InstallerCmdlet.ShouldProcess($tileProject, 'Build Tile poster splitter')) {
            Push-Location $tileProject
            try {
                & $goExe build -o tile.exe .
                if ($LASTEXITCODE -ne 0) { throw 'Tile build failed.' }
            } finally { Pop-Location }
        } else {
            Write-Warning 'Go is installed or pending, but this shell cannot locate it yet. Restart PowerShell and rerun the installer to build Tile.'
        }
    }

    if (Test-Path -LiteralPath $ghostPoster) {
        $pythonCommand = Get-Command py -ErrorAction SilentlyContinue
        if ($pythonCommand) {
            $pythonExe = (& py -3.12 -c 'import sys; print(sys.executable)' 2>$null | Select-Object -Last 1)
        }
        if (-not $pythonExe) {
            $pythonCommand = Get-Command python3.12 -ErrorAction SilentlyContinue
            if ($pythonCommand) { $pythonExe = $pythonCommand.Source }
        }
        if (-not $pythonExe) {
            $pythonCandidate = Join-Path $env:LOCALAPPDATA 'Programs\Python\Python312\python.exe'
            if (Test-Path -LiteralPath $pythonCandidate) { $pythonExe = $pythonCandidate }
        }
        if ($pythonExe -and (Test-Path -LiteralPath $pythonExe)) {
            $venvPython = Join-Path $ghostPoster '.venv\Scripts\python.exe'
            if (-not (Test-Path -LiteralPath $venvPython) -and $script:InstallerCmdlet.ShouldProcess($venvPython, 'Create GhostPoster virtual environment')) {
                & $pythonExe -m venv (Join-Path $ghostPoster '.venv')
                if ($LASTEXITCODE -ne 0) { throw 'Could not create GhostPoster virtual environment.' }
            }
            if ((Test-Path -LiteralPath $venvPython) -and $script:InstallerCmdlet.ShouldProcess($ghostPoster, 'Install GhostPoster CLI and GUI dependencies')) {
                Push-Location $ghostPoster
                try {
                    & $venvPython -m pip install --upgrade pip
                    if ($LASTEXITCODE -ne 0) { throw 'Could not upgrade pip in the GhostPoster environment.' }
                    & $venvPython -m pip install -e '.[gui]'
                    if ($LASTEXITCODE -ne 0) { throw 'GhostPoster installation failed.' }
                } finally { Pop-Location }
            }
        } else {
            Write-Warning 'Python 3.12 is installed or pending, but this shell cannot locate it yet. Restart PowerShell and rerun the installer to finish GhostPoster setup.'
        }
    }
}

Write-Host ''
Write-Host 'Science Fair Poster setup finished.'
Write-Host "Skill folder: $skillTarget"
Write-Host "Poster projects: $projectRoot"
Write-Host 'The Doory source is cloned only; it is not launched. Follow its README to configure secrets, install Docker if desired, and start services.'
Write-Host 'Tile is an archived upstream project. It remains available as-is in the poster-tools folder and may not receive fixes.'
Write-Host 'Generated hero artwork uses Codex built-in image generation when available; it is not a separately installed desktop app.'
Write-Host 'Restart Codex after installing the skill so it refreshes the skill catalog.'
