terraform {
  required_version = ">= 1.10.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  # Bootstrap note in README — the state bucket is created once, out of band.
  backend "s3" {
    bucket       = "hsg-tfstate-poc" # created manually before first init
    key          = "s3-cloudfront/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      project    = "terraform-poc"
      owner      = "haseeb"
      managed_by = "terraform"
      expires    = "2026-08-12"
    }
  }
}
# ACM certs for CloudFront must live in us-east-1, regardless of aws_region
provider "aws" {
  alias  = "use1"
  region = "us-east-1"
}
