## Objective

Perform video conversions using AWS Fargate, triggered by uploads to an Amazon S3 Bucket.

## Dependencies

* [PowerShell](https://github.com/powershell/powershell)
* [AWS PowerShell Module](https://aws.amazon.com/powershell/)
* Valid AWS IAM credentials, with `AdministratorAccess` permissions

## Usage

1. Clone repository
2. Run `./build/deploy.ps1`


## Notes

* AWS CloudTrail must be enabled, with S3 object-level logging

## Learning Points

* Task Definition must be Fargate compatible, else invocation will fail
* AWS Python `cfn-lint` is a helpful tool for validating CloudFormation templates
* The $.input is the root object in AWS Step Functions. Use `$.detail.requestParameters.key` NOT `$.input.detail....`