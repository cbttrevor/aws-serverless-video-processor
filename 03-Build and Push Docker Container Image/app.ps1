# Entrypoint for the container

$env:S3Bucket
$env:S3Key

$InputFile = 'input.mp4'
$OutputFile = 'output.webm'

# Download the file from S3
Read-S3Object -BucketName $env:S3Bucket -Key $env:S3Key -File $InputFile 

# Perform processing 
ffmpeg -i $InputFile $OutputFile

# Upload the resulting file to destination S3 Bucket
$DestinationBucket = 'cbtvideo-destination'
Write-S3Object -BucketName $DestinationBucket -File $OutputFile
