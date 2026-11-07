# Architecture

## Layout

| Component | Count | Notes |
|---|---|---|
| VPC | 1 | 10.0.0.0/16 |
| Availability Zones | 2 | us-east-1a, us-east-1b (variable) |
| Public subnets | 2 | 10.0.0.0/24, 10.0.1.0/24. Hold the ALB and the NAT gateway |
| Private subnets | 2 | 10.0.10.0/24, 10.0.11.0/24. Hold the EC2 instances |
| NAT gateway | 1 | One for the lab to save cost. One per AZ for real high availability |
| Load balancer | 1 | Application Load Balancer, HTTP, or HTTPS when DNS is enabled |
| Auto Scaling group | 1 | min 2, max 4, target tracking at 60% average CPU |

## Terraform modules

| Module | Creates | Inputs | Outputs |
|---|---|---|---|
| `network` | VPC, subnets, IGW, NAT, route tables | name, vpc_cidr, azs | vpc_id, public_subnet_ids, private_subnet_ids |
| `compute` | Security groups, ALB, target group, listeners, launch template, ASG, instance role | network outputs, sizing, enable_https, certificate_arn | alb_dns_name, alb_zone_id, asg_name |
| `dns` | ACM certificate, DNS validation records, Route 53 alias record | enable, domain_name, hosted_zone_id, ALB name and zone | certificate_arn |

The `dns` module does nothing unless `enable_dns = true`, so the lab works without a domain.

## Security choices

- Instances sit in private subnets and accept traffic only from the ALB security group.
- No SSH keys. Instances have the SSM managed policy, so shell access is through Session Manager.
- IMDSv2 is required on instances.
- Terraform state is in S3 with versioning, encryption, and a lock file.
- GitHub Actions assumes an IAM role through OIDC. The trust policy is limited to this repository.

## Deliberate lab shortcuts

- The deploy role has `AdministratorAccess`. A real setup would scope it to the services this stack uses.
- One NAT gateway, so an AZ outage would cut off outbound access for the other AZ's instances.
- HTTP only unless a domain is supplied.
- Every Checkov skip is listed with a reason in `.checkov.yaml`.

## Request flow

1. A user hits the Route 53 record or the ALB DNS name.
2. The ALB forwards to healthy targets in either private subnet.
3. Each instance runs an nginx container showing its instance ID and AZ, so refreshing shows both AZs responding.
