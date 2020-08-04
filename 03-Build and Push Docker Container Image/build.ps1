# Build and push Docker image to ECR

$RepositoryName = 'cbtvideoprocessor'

# if (Get-ECRRepository -RepositoryName $RepositoryName) {
#     Remove-ECRRepository -RepositoryName $RepositoryName -Force
# }


$CurrentRepository = Get-ECRRepository -RepositoryName $RepositoryName
$Repository = $CurrentRepository ? $CurrentRepository : (New-ECRRepository -Force -RepositoryName $RepositoryName)

Invoke-Expression -Command (Get-ECRLoginCommand).Command

docker build --tag $Repository.RepositoryUri $PSScriptRoot

docker push $Repository.RepositoryUri

# Install-Module -Name AWS.Tools.ECR -Scope CurrentUser -Force

# Get-Command -Module AWS.Tools.ECR