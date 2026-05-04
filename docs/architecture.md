# Architecture Notes

## IAM for GitHub OIDC

Create an IAM role trusted by GitHub OIDC and store its ARN in:

- `AWS_ROLE_TO_ASSUME` (Repository Secret)

Recommended permissions for this role:

- ECR push/pull on your repository
- ECS update-service
- ECS describe services/tasks

## Networking

- ALB is placed in public subnets.
- ECS tasks run in private subnets.
- Ensure NAT Gateway or VPC endpoints are available so ECS can pull from ECR.

## Rollout Strategy

Current workflow uses:

- push image tag + latest
- force new deployment on ECS service

For advanced production:

- use immutable image tags in task definition updates
- add canary or blue/green deployment
