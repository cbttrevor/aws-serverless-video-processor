## Objective

Perform video conversions using AWS Fargate, triggered by uploads to an Amazon S3 Bucket.

## Dependencies

* [PowerShell](https://github.com/powershell/powershell)
* [AWS PowerShell Module](https://aws.amazon.com/powershell/)
* Valid AWS IAM credentials, with `AdministratorAccess` permissions

## Usage

1. Clone repository
2. Modify `./08-Final Project/cloudformation.yml` to use unique S3 Bucket names
2. Run `./08-Final Project/build/deploy.ps1`
3. Upload an MP4 video file into the "source bucket"

## Learning Points

* AWS CloudTrail must be enabled, with S3 data events, in order to trigger Amazon EventBridge rules
* ECS Task Definitions must be marked as Fargate compatible, else invocation will fail
* AWS Python `cfn-lint` is a helpful tool for validating CloudFormation templates
* The `$.input` is the root object in AWS Step Functions. Use `$.detail.requestParameters.key` NOT `$.input.detail....`
* Both `PutObject` and `CompleteMultipartUpload` API calls are used in S3 to trigger EventBridge rules

## Customization Ideas

* Build a drag-and-drop web front-end to perform conversions
* Modify the [`ffmpeg` parameters](https://ffmpeg.org/ffmpeg.html) to support different encoding parameters
* Use the [Choice state](https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-choice-state.html) in AWS Step Functions to branch logic based on parameters, such as file size or type
* Add a step to the AWS Step Functions state machine to send a completion e-mail