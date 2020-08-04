Set-DefaultAWSRegion -Region us-west-1 

$StackName = 'serverless-video-processor'
$TemplateBody = Get-Content -Raw -Path $PSScriptRoot/../cloudformation.yml

try {
    Update-CFNStack -StackName $StackName -TemplateBody $TemplateBody -Capability CAPABILITY_NAMED_IAM -ErrorAction Stop
}    
catch {

    if ($PSItem.Exception.Message -match 'ROLLBACK_COMPLETE') {
        Write-Host -Object 'Removing CloudFormation stack' -ForegroundColor Red

        Remove-S3Bucket -BucketName cbt-trevor-cloudtrail-usw2  -DeleteBucketContent -Force
        Remove-S3Bucket -BucketName cbt-video-processed  -DeleteBucketContent -Force
        Remove-S3Bucket -BucketName cbt-video-sink  -DeleteBucketContent -Force
        
        Remove-CFNStack -StackName $StackName -Force
        Wait-CFNStack -StackName $StackName -Status DELETE_COMPLETE
        $CreateStack = $true
    }
    if ($PSItem.Exception.Message -match 'does not exist') {
        $CreateStack = $true
    }
    else {
        throw $PSItem
    }

    if ($CreateStack) {
        New-CFNStack -StackName $StackName -TemplateBody $TemplateBody -Capability CAPABILITY_NAMED_IAM
    }
    # Remove-CFNStack -StackName $StackName -Force -ErrorAction Ignore
    # Remove-S3Bucket -DeleteBucketContent -Force -BucketName cbt-trevor-cloudtrail-usw2
    # Remove-S3Bucket -DeleteBucketContent -Force -BucketName cbt-video-sink
    # Wait-CFNStack -StackName $StackName -Status DELETE_COMPLETE
}

return

Get-CFNStackEvent -StackName $StackName
Write-S3Object -BucketName cbt-video-sink -File "$HOME/Downloads/Annotation 2020-07-16 123826.png"

