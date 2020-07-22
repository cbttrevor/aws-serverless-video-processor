## Objective

Up to this point, we haven't linked S3 `PutObject` events to trigger AWS Step Functions.
The Amazon EventBridge service allows us to define an "event pattern" that we want to match, which we'll do using the AWS Management Console.
Once we've defined the event pattern, to capture `PutObject` API calls against a specific Amazon S3 Bucket, we'll adapt that to our AWS CloudFormation template, using YAML syntax.

After defining the event pattern, we also need to define one or more "targets" that will be triggered whenever a matching event occurs.
The target of our EventBridge rule will be the AWS Step Function that we created earlier.

## Learning Points

* You can use the AWS Management Console to construct an event pattern, using the builder interface. This is easier than constructing it from scratch in a text editor.
* Amazon EventBridge rules must have an associated IAM role, so that they have permission to invoke targets
* Each target in an event rule must have an `Id` property, which you can set to any desired value