# Deploy log

Fill this in as you run the project in a real AWS account. Leave a row blank until it has actually been done.

| Step | Date | Result |
|---|---|---|
| `terraform validate` | | |
| Checkov scan, number of findings before and after fixes | | |
| Bootstrap applied (state bucket, OIDC role) | | |
| `AWS_ROLE_ARN` secret added to the GitHub repo | | |
| First `terraform apply` from my laptop | | |
| ALB URL loads, refresh shows both AZs | | |
| Pull request triggers fmt, validate, Checkov, plan | | |
| Merge to `main` triggers apply | | |
| A deliberately insecure change is blocked by Checkov | | |
| `terraform destroy` | | |
| Full rebuild from nothing (minutes) | | |

## Measurements to record (use these on your resume)

- Time for a full `terraform apply` from an empty account:
- Time for `terraform destroy`:
- Number of Checkov findings fixed or skipped (with reasons):
- Number of reusable modules: 3
- Number of Availability Zones: 2

## Cost note

The NAT gateway and ALB bill by the hour. Destroy the stack when you finish a session.
