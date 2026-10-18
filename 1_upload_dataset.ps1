# 1_upload_dataset.ps1
# Script đóng gói và đẩy Dataset lên Kaggle
Write-Host "=== 1. KIỂM TRA VÀ TẢI DATASET LÊN KAGGLE ===" -ForegroundColor Cyan

$datasetPath = "parking_yolo26_artifacts\dataset"

if (!(Test-Path $datasetPath)) {
    Write-Host "Lỗi: Không tìm thấy thư mục $datasetPath" -ForegroundColor Red
    exit 1
}

Write-Host "Kiểm tra xem dataset 'vnbivn/vietnam-license-plate-yolo' đã tồn tại trên Kaggle chưa..."
$existing = kaggle datasets list --mine | Select-String "vietnam-license-plate-yolo"

if ($existing) {
    Write-Host "Dataset đã tồn tại, đang tạo version mới..." -ForegroundColor Yellow
    kaggle datasets version -p $datasetPath -m "Update dataset version" -r zip
} else {
    Write-Host "Đang tạo mới dataset trên Kaggle (dung lượng ~92MB, vui lòng đợi 1-2 phút)..." -ForegroundColor Green
    kaggle datasets create -p $datasetPath -r zip
}

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n✅ Dataset đã được tải lên thành công!" -ForegroundColor Green
    Write-Host "Link dataset: https://www.kaggle.com/datasets/vnbivn/vietnam-license-plate-yolo" -ForegroundColor Cyan
} else {
    Write-Host "`n❌ Quá trình upload gặp lỗi. Vui lòng kiểm tra lại log bên trên." -ForegroundColor Red
}
