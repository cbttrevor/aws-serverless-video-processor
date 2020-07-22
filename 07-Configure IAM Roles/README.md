## Objective

As with most AWS solutions, you'll need to configure AWS Identity & Access Management (IAM) roles, to grant access to your resources.
We'll add these IAM role definitions to our AWS CloudFormation template in this section.

In this serverless video processor solution, we have several AWS resources that need IAM roles associated with them, in order to function properly:

* **AWS Step Functions state machine [execution role](https://docs.aws.amazon.com/step-functions/latest/dg/procedure-create-iam-role.html)** - the permissions on the state machine's execution role determine which tasks it is able to invoke.
* **Amazon EventBridge rule** - in order to invoke an AWS Step Functions state machine as the event rule's target, the IAM role associated with the rule must have permission to invoke that resource.
* **Amazon ECS [Task Execution Role](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_execution_IAM_role.html)** - this IAM role, not to be confused with the ECS Task Role, is what allows ECS to pull private Docker container images, and write logs directly to Amazon CloudWatch, using the `awslogs` driver.
* **Amazon ECS [Task Role](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html)** - this role is delegated to the ECS Task and grants it permissions to other AWS resources, such as writing to an S3 Bucket with the `PutObject` API.

## Learning Points

* In Amazon ECS, the **Task Execution Role** and **Task Role** serve two separate purposes, despite the similarity in their name
* 