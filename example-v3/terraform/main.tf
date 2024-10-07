terraform {
  required_version = "~> 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "v2-opennext-terraform-state-store"
    key            = "terraform-aws-opennext/example-v3.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "oppennext-tf-lock"
  }
}

locals {
  domain_name = "opennext.v2.engineer"
  default_tags = {
    Project     = "terraform-aws-opennext"
    Environment = "example"
  }
}

provider "aws" {
  region = "ap-southeast-2"

  default_tags {
    tags = local.default_tags
  }
}

provider "aws" {
  alias  = "global"
  region = "us-east-1"

  default_tags {
    tags = local.default_tags
  }
}

module "opennext" {
  source = "../../"

  prefix              = "terraform-aws-opennext-example-v3"
  default_tags        = local.default_tags
  opennext_build_path = "../.open-next"
  hosted_zone_id      = data.aws_route53_zone.zone.zone_id

  server_options = {
    function = {
      streaming_enabled = true
    }
  }

  cloudfront = {
    aliases             = [local.domain_name]
    acm_certificate_arn = aws_acm_certificate_validation.ssl_certificate.certificate_arn
    assets_paths        = ["/images/*", "/static/*"]
  }
}

output "cloudfront_distribution_id" {
  value = module.opennext.cloudfront.cloudfront_distribution.id
}
