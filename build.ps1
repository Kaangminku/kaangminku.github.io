# build.ps1 — Render the Quarto site OUTSIDE Dropbox, then sync docs/ back into the repo.
# Why: Dropbox locks the .quarto cache during render (os error 32). Building in a temp
# folder avoids that. Run this instead of `quarto render`.
#
#   powershell -ExecutionPolicy Bypass -File .\build.ps1
#
$ErrorActionPreference = 'Stop'
$proj   = $PSScriptRoot
$quarto = 'C:\Users\mk7ma\AppData\Local\Programs\quarto\bin\quarto.exe'
if (-not (Test-Path $quarto)) { $quarto = 'quarto' }

$build = Join-Path $env:TEMP 'minku_build'
if (Test-Path $build) { [System.IO.Directory]::Delete($build, $true) }
New-Item -ItemType Directory -Force $build | Out-Null

# copy source only (exclude git/cache/output)
robocopy $proj $build /E /XD "$proj\.git" "$proj\.quarto" "$proj\docs" /NFL /NDL /NJH /NJS /NP | Out-Null

# render in temp (no Dropbox lock)
& $quarto render $build

# sync rendered output back into the repo's docs/
robocopy "$build\docs" "$proj\docs" /MIR /R:3 /W:1 /NFL /NDL /NJH /NJS /NP | Out-Null
New-Item -ItemType File -Force (Join-Path $proj 'docs\.nojekyll') | Out-Null

Write-Host ''
Write-Host 'Site rendered into docs/. To publish:  git add -A; git commit -m "update site"; git push'
$global:LASTEXITCODE = 0
