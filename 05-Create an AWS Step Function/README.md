## Objective

AWS Step Functions enables you to build powerful worklflows that run inside a managed service.
Check out our [video skill on AWS Step Functions](https://bit.ly/cbt_awsstep) if you're interested in learning more about this topic!

In this section, we will create an AWS Step Function that will invoke an AWS Fargate task in response to an S3 `PutObject` event. 
Step Functions can be very complex, if you need them to be.
In this project, we'll keep it simple and easy to understand; our Step Function will only have one task in it.

When the AWS Step Function receives an input event from Amazon EventBridge, it will pass the S3 bucket and S3 key into an AWS Fargate task as container environment variables.
You might recall, when we created our ECS Task Definition, we didn't specify any container environment variables.
However, we can override this behavior and add in environment variables at task run time.

AWS Step Functions are constructed using a simple JSON syntax called [Amazon States Language (ASL)](https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html).

Here's an example of a simple Step Function:

```json
{
    "StartAt": "Task1",
    "States": {
        "Task1": {
            "Type": "Task",
            "Resource": ".........",
            "End": true
        }
    }
}
```

## Learning Points

* Step Functions are constructed using a constrained JSON syntax called Amazon States Language (ASL)
* When invoking an AWS Fargate task from AWS Step Functions, you can "override" certain container settings in an ECS Task Definition
* AWS Step Functions can [invoke an AWS Fargate](https://docs.aws.amazon.com/step-functions/latest/dg/connect-ecs.html) Task directly
* The capitalization of certain properties in state machines is very important. You may receive an error during deployment of a state machine such as `Invalid State Machine Definition: 'SCHEMA_VALIDATION_FAILED: The field "awsVpcConfiguration" is not supported by Step Functions`
* State Machine definitions can be embedded as JSON into YAML-based AWS CloudFormation templates
* There is an [AWS Toolkit extension](https://aws.amazon.com/visualstudiocode/) for Microsoft [Visual Studio Code](https://code.visualstudio.com) that performs linting against Step Functions state machines