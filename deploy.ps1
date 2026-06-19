# Dayana Design — one-command deploy to Vercel
# Usage:  right-click > Run with PowerShell   (or)   ./deploy.ps1
# First run will open a browser to log in & link the project. After that it just deploys.

$ErrorActionPreference = "Stop"
Set-Location -Path $PSScriptRoot

Write-Host "==> Checking Vercel login..." -ForegroundColor Cyan
$who = (& vercel whoami) 2>$null
if (-not $who) {
    Write-Host "Not logged in. Opening Vercel login..." -ForegroundColor Yellow
    & vercel login
}

Write-Host "==> Deploying to production..." -ForegroundColor Cyan
& vercel --prod

Write-Host "`nDone. Your site is live (URL shown above)." -ForegroundColor Green
