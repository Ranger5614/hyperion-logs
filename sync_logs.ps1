# Hyperion Logs Auto-Sync Script
while ($true) {
    Write-Host "$(Get-Date) - Syncing logs..." -ForegroundColor Green
    
    # Copy fresh logs
    Copy-Item -Path "..\hyperion_futures_logs\*" -Destination "hyperion_futures_logs\" -Recurse -Force
    
    # Git operations
    git add .
    git commit -m "Auto-sync: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    git push origin main
    
    Write-Host "$(Get-Date) - Sync complete! Waiting 5 minutes..." -ForegroundColor Cyan
    Start-Sleep -Seconds 300  # 5 minutes
}