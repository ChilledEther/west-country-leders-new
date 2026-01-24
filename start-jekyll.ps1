# Jekyll Local Development Startup Script

Write-Host "--- West Country Leders Jekyll Starter ---" -ForegroundColor Cyan

# Ensure we are in the project root (where Gemfile is)
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location $scriptPath

if (!(Test-Path "Gemfile")) {
    Write-Error "Gemfile not found in $scriptPath. Please run this script from the project root."
    exit 1
}

# Check for Ruby
if (!(Get-Command ruby -ErrorAction SilentlyContinue)) {
    Write-Host "Error: Ruby is not installed or not in your PATH." -ForegroundColor Red
    Write-Host "Please install Ruby from https://rubyinstaller.org/"
    Pause
    exit 1
}

# Check for Bundler
if (!(Get-Command bundle -ErrorAction SilentlyContinue)) {
    Write-Host "Bundler not found. Attempting to install..." -ForegroundColor Yellow
    gem install bundler
}

# Install/Update dependencies
Write-Host "Checking dependencies..." -ForegroundColor Gray
bundle install

# Start the server
Write-Host "Starting Jekyll server..." -ForegroundColor Green
Write-Host "Local site will be available at: http://localhost:4000" -ForegroundColor Gray
bundle exec jekyll serve --livereload --incremental
