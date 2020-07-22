## Objective

In this skill, we will start from scratch and build a serverless video processor solution on Amazon Web Services (AWS). We will use AWS CloudFormation to control the deployment of most of the resources, in a declarative fashion.
Additionally, we will leverage the AWS Tools for PowerShell to perform automation tasks against the AWS service APIs, such as Amazon Elastic Container Registry (ECR) and AWS CloudFormation.

## Prerequisites

* Install [Microsoft Visual Studio Code](https://code.visualstudio.com/)
* Install [PowerShell](https://github.com/PowerShell/PowerShell/)
* Install [Python](https://python.org)
* Learn about [setting up AWS credentials](https://docs.aws.amazon.com/powershell/latest/userguide/specifying-your-aws-credentials.html)
* Learn to install and utilize the [AWS Tools for PowerShell](https://www.cbtnuggets.com/it-training/automate-aws-powershell-linux-mac-windows?utm_source=trainer&utm_medium=trainer&utm_campaign=trevor-sullivan)

## Examples of Video Processing

* Home security with automated object detection pipelines
* Online video training, similar to [CBT Nuggets](https://cbtnuggets.com)
* Recording surgical procedures for auditing or training
* Inspect sewer lines
* Automated mining safety systems
* Remote quality assurance in manufacturing

## Solution Architecture

Writing an S3 object into a "source bucket" will trigger an Amazon EventBridge event rule, which obtains data events from AWS CloudTrail audit logs.
The EventBridge rule will trigger an AWS Step Function, which kicks off an AWS Fargate task that contains the S3 bucket and S3 object key. 
The AWS Fargate task will be a PowerShell application that kicks off `ffmpeg` to perform a video conversion task.
Once the video conversion process is completed, the Fargate task will upload the converted file into a destination bucket.

## Learning Points

* There are multiple ways to build a video processor. This is just one method.
* You can use AWS Lambda as a target, to trigger AWS Fargate directly. However, this requires more code, packaging, and dependencies.
* Lambda isn't suitable for video processing, as it has limited vCPUs and a 15-minute execution time limit.
* `cfn-lint` is a useful AWS tool, built on Python, to perform static analysis over your CloudFormation templates
* Any time we talk about ECS, we're including AWS Fargate. They both use common object models, such as "Task Definitions" and "clusters"

