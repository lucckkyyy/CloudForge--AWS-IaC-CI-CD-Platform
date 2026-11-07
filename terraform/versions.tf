terraform {
  required_version = ">= 1.10.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Replace the bucket name with the one created by bootstrap/.
  backend "s3" {
    bucket       = "REPLACE-WITH-YOUR-STATE-BUCKET"
    key          = "cloudforge/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project   = "cloudforge"
      ManagedBy = "terraform"
    }
  }
}
