# 4_download_models.ps1
# Script tải mô hình (best.pt, best.onnx) và kết quả huấn luyện về máy tính
Write-Host "=== TẢI MODEL VÀ KẾT QUẢ VỀ MÁY LOCAL ===" -ForegroundColor Cyan

$outputDir = "trained_models"
if (!(Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir | Out-Null
}

Write-Host "Đang tải output từ Kaggle về thư mục $outputDir..." -ForegroundColor Yellow
kaggle kernels output vnbivn/train-yolo-parking-colab7b8f15a972 -p $outputDir

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n✅ Đã tải xong! Danh sách files:" -ForegroundColor Green
    Get-ChildItem -Path $outputDir
} else {
    Write-Host "`n❌ Chưa tải được. Có thể notebook vẫn đang chạy hoặc chưa xong." -ForegroundColor Red
}
