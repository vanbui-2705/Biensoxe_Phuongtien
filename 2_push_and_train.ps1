# 2_push_and_train.ps1
# Script đẩy Notebook lên Kaggle và kích hoạt GPU training
Write-Host "=== 2. ĐẨY NOTEBOOK VÀ CHẠY TRAIN TRÊN KAGGLE GPU ===" -ForegroundColor Cyan

$kernelDir = "kaggle_kernel"
if (!(Test-Path $kernelDir)) {
    Write-Host "Lỗi: Không tìm thấy thư mục $kernelDir" -ForegroundColor Red
    exit 1
}

Write-Host "Đang đẩy kernel lên Kaggle..." -ForegroundColor Yellow
kaggle kernels push -p $kernelDir

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n🚀 Đã đẩy code và bắt đầu train trên Kaggle GPU thành công!" -ForegroundColor Green
    Write-Host "Trực tiếp xem tiến độ trên web tại:" -ForegroundColor Cyan
    Write-Host "  👉 https://www.kaggle.com/code/vnbivn/vn-parking-yolo-train" -ForegroundColor White
    Write-Host "`nHoặc kiểm tra trạng thái bằng lệnh:" -ForegroundColor Yellow
    Write-Host "  .\3_check_status.ps1" -ForegroundColor White
} else {
    Write-Host "`n❌ Có lỗi khi push kernel. Vui lòng kiểm tra lại log." -ForegroundColor Red
}
