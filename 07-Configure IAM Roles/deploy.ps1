New-CFNStack -TemplateBody (Get-Content -Raw -Path $PSScriptRoot/cloudformation.yml) -StackName vpctest -Capability CAPABILITY_NAMED_IAM
# Update-CFNStack -TemplateBody (Get-Content -Raw -Path $PSScriptRoot/cloudformation.yml) -StackName vpctest -Capability CAPABILITY_NAMED_IAM 

# Get-CFNStackResourceList -StackName vpctest | ? { $PSItem.ResourceStatus -notmatch 'DELETE_COMPLETE'} | % { Remove-S3Bucket -BucketName $PSItem.PhysicalResourceId -DeleteBucketContent -Force }
# Remove-CFNStack -Force -StackName vpctest -Region us-west-1