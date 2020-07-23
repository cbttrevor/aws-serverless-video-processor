## Objective

Our serverless video processor needs a custom container image, with our application code embedded, to run the video processing task.
In this section, we'll be defining the Task Definition that is used to launch tasks on the AWS Fargate service to perform video processing tasks. 

The Task Definition includes many parameters, such as the amount of CPU and memory to allocate to the task, and an array of containers that will be deployed inside the task (one or more). Additionally, there is a logging configuration section that allows you to specify where container logs should be emitted to.

## Learning Points

* Task Definitions provide the parameters for launching tasks on Amazon ECS / AWS Fargate
* You can define task definitions as YAML objects in AWS CloudFormation templates
* The logging configuration can push logs directly to Amazon CloudWatch Logs