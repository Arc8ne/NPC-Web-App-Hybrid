# Generates Base64 encoded versions of the Tesseract training data files.
Write-Host "Encoding Tesseract training data...";
$tesseractTrainingDataFolderPath = "$PSScriptRoot\tesseract-training-data";
$tesseractTrainingDataBase64FolderPath = "$tesseractTrainingDataFolderPath\base64";
Get-ChildItem -File -Path "$tesseractTrainingDataFolderPath" | ForEach-Object {
  [Convert]::ToBase64String(
    [System.IO.File]::ReadAllBytes("$($_.FullName)")
  ) | Out-File -FilePath "$tesseractTrainingDataBase64FolderPath\$($_.Name)";
}
Write-Host "Done.";
