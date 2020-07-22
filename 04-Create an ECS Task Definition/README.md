## Objective

Our serverless video processor needs a custom container image, with our application code embedded, to run the video processing task.
In this section, we'll 

For this solution, we'll be using a simple Step Function that only has a single task in it, which launches a Fargate task and waits for it to complete.
The event data will come from S3, and will be routed directly into the Step Function.

## Learning Points

* AWS Step Functions provides a powerful workflow framework
* You can define AWS Step Functions as embedded JSON inside of an AWS CloudFormation template built using YAML
