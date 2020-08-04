# This file is the container entry point for video conversion
$DestinationBucket = 'cbt-video-processed'

Write-Host $env:S3Key
$env:S3Key

Read-S3Object -BucketName $env:S3Bucket -Key $env:S3Key -File video.mp4

# Perform video conversion
ffmpeg -i video.mp4 output.webm

Write-S3Object -BucketName $DestinationBucket -File output.webm
