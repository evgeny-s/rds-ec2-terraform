# RDS + EC2 configuration via Terraform.

# Configuration
1. Create user with AdministrationAccess in the IAM AWS

2. Create `secrets/rds.json` and add `master_password` parameter.

3. Create `secrets/credentials.json` and add `access_key` and `secret_key` parameters.

4. Run `terraform apply`
