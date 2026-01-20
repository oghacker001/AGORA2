# Restart Frontend with Clean Cache
Write-Host "🔄 Restarting Frontend with Clean Cache..." -ForegroundColor Cyan
Write-Host ""

# Check if we're in the right directory
if (-not (Test-Path "client")) {
    Write-Host "❌ Error: Run this from AGORA root directory" -ForegroundColor Red
    exit 1
}

# Navigate to client
cd client

# Check if .next exists and remove it
if (Test-Path ".next") {
    Write-Host "🗑️  Removing .next cache folder..." -ForegroundColor Yellow
    Remove-Item -Path ".next" -Recurse -Force
    Write-Host "✅ Cache cleared!" -ForegroundColor Green
} else {
    Write-Host "ℹ️  No cache found (this is fine)" -ForegroundColor Gray
}

Write-Host ""
Write-Host "🚀 Starting frontend server..." -ForegroundColor Cyan
Write-Host ""
Write-Host "⚠️  After server starts:" -ForegroundColor Yellow
Write-Host "   1. Go to browser and press Ctrl+Shift+R to hard refresh" -ForegroundColor White
Write-Host "   2. Or clear browser cache in DevTools" -ForegroundColor White
Write-Host "   3. Login again with ADMIN-AGR-001" -ForegroundColor White
Write-Host ""

# Start the dev server
npm run dev
