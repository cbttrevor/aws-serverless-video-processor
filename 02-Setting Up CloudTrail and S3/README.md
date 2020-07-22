## Objective

This solution requires us to configure Amazon Simple Storage Service (S3) to trigger an AWS Fargate task, whenever a new S3 object is uploaded using the [`PutObject` API](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html).
In order for S3 triggers to work with Amazon EventBridge, we first need to enable AWS CloudTrail, a simple managed service that writes AWS audit logs into an Amazon S3 Bucket of your choice.
By default, newly-created S3 buckets do not grant access to the AWS CloudTrail service, to write logs into it.
We will need to define an S3 bucket policy that grants this access, as part of our AWS CloudFormation template.
The AWS documentation for CloudTrail provides the [required bucket policy configuration](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/create-s3-bucket-policy-for-cloudtrail.html), which you can adapt to CloudFormation YAML.

In addition to the S3 Bucket we create for AWS CloudTrail logs, we also need to create a "source" and "destination" S3 bucket for video files.
The "source" bucket is where files will be placed into for processing, and the "destination" bucket is where the video processor container will store its results.

## Learning Points

* An S3 Bucket policy is required when deploying CloudTrail via AWS CloudFormation. The AWS Management console hides some of this configuration from you.
* S3 Bucket triggers can target an AWS Lambda function, an SQS queue, or Amazon EventBridge