## Objective

Let's build a Docker container image locally, using Docker Desktop, and push the container image into an Amazon Elastic Container Registry (ECR) repository.
The contents of this image will include PowerShell, an open source, object-oriented programming language, and we'll also install the well-known FFmpeg tool for video processing.
Once the container image is staged into ECR, the AWS Fargate service can pull the container image from there.

We'll also learn how to construct a simple container image build script that is idempotent, also using PowerShell, so we can make incremental changes and test them quickly.
If the AWS Tools for PowerShell seem a bit foreign to you, then check out our CBT Nuggets skill that covers 

## Learning Points

* [Docker Desktop](https://www.docker.com/products/docker-desktop) is an easy-to-use tool for spinning up containers and developing locally, in isolation
* [PowerShell](https://github.com/powershell/powershell) is a powerful, cross-platform programming language that makes prototyping easy
* The `$PSScriptRoot` variable refers to the directory where the PowerShell script resides
* The [AWS Tools for PowerShell](https://aws.amazon.com/powershell/) is an SDK to access all AWS APIs from PowerShell