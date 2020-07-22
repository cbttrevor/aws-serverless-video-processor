$StackName = 'serverless-video-processor'
$TemplateBody = Get-Content -Raw -Path $PSScriptRoot/../cloudformation.yml

try {
    Update-CFNStack -StackName $StackName -TemplateBody $TemplateBody -Capability CAPABILITY_NAMED_IAM -ErrorAction Stop
}    
catch {
    throw $PSItem
    # Remove-CFNStack -StackName $StackName -Force -ErrorAction Ignore
    # Remove-S3Bucket -DeleteBucketContent -Force -BucketName cbt-trevor-cloudtrail-usw2
    # Remove-S3Bucket -DeleteBucketContent -Force -BucketName cbt-video-sink
    # Wait-CFNStack -StackName $StackName -Status DELETE_COMPLETE

    # New-CFNStack -StackName $StackName -TemplateBody $TemplateBody -Capability CAPABILITY_NAMED_IAM
}

return

Get-CFNStackEvent -StackName $StackName
Write-S3Object -BucketName cbt-video-sink -File "$HOME/Downloads/Annotation 2020-07-16 123826.png"

