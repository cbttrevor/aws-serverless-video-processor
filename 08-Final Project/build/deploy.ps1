# NOTE: This PowerShell script is responsible for building a Docker container image
#   for the video processor.

Set-DefaultAWSRegion -Region us-west-2

# Login to Amazon Elastic Container Registry
Invoke-Expression -Command (Get-ECRloginCommand).Command

$ECRRepository = 'videoprocessor'

# Delete all images in the ECR repository
Get-ECRImage -RepositoryName $ECRRepository | Remove-ECRImageBatch -Force -RepositoryName $ECRRepository

# Delete the ECR repository
$null = Remove-ECRRepository -RepositoryName $ECRRepository -Force

# Re-create the ECR repository
$Repository = New-ECRRepository -RepositoryName $ECRRepository

docker build --tag $Repository.RepositoryUri $PSScriptRoot/../processor

docker push $Repository.RepositoryUri

