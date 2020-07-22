# Entry point for video conversion


Write-Host $env:S3Key
$env:S3Key

$DestinationBucket = ''
Read-S3Object -BucketName $env:S3Bucket -S3Object $env:S3Key -File video.mp4

# Perform video conversion
ffmpeg -i input.mp4 output.mp4

Write-S3Object -BucketName $env:DestinationBucket
