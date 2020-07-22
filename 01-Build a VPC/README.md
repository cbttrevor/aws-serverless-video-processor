## Objective

In order to deploy containers on Amazon Elastic Container Service (ECS), including AWS Fargate, you will need to deploy an Amazon Virtual Private Cloud (VPC), which is just a Software-Defined Network (SDN).
You will need to ensure that the VPC provides Internet access through an Internet Gateway or NAT Gateway, so that the underlying infrastructure is able to pull Docker images from an image registry, such as Amazon Elastic Container Registry (ECR) or [Docker Hub](https://hub.docker.com).

If you don't want your VPC to have Internet access, you can optionally configure [VPC Endpoints](https://docs.aws.amazon.com/AmazonECR/latest/userguide/vpc-endpoints.html) for ECR, and any other required AWS services. However, this configuration is beyond the scope of this CBT Nuggets skill. We will be using the publicly accessible service endpoints for Amazon ECR.

## Learning Points

* An Amazon VPC is required for AWS Fargate tasks
* AWS CloudFormation provides an easy mechanism to define and update a VPC
* NAT Gateways provide outbound internet access, but do not allow inbound network traffic to public IPv4 addresses
