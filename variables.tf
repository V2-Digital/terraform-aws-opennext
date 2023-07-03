
/**
 * Common Variables
 **/
variable "prefix" {
  type        = string
  description = "Prefix for created resource IDs"
  default     = "opennext"
}

/**
 * Route53 (DNS) Variables
 **/
variable "create_route53_records" {
  type        = bool
  default     = true
  description = "Create Route53 DNS Records for CloudFront distribution"
}

variable "hosted_zone_id" {
  type        = string
  description = "The Route 53 hosted zone ID of the domain name"
}

variable "evaluate_target_health" {
  type        = bool
  default     = false
  description = "Allow Route53 to determine whether to respond to DNS queries by checking the health of the record set"
}

/**
 * OpenNext Variables
 **/
variable "opennext_build_path" {
  type        = string
  description = "The path to the folder containing the .open-next build output"
}

variable "server_options" {
  description = "Variables passed to the opennext-lambda module for the Next.js server"
  type = object({
    package = optional(object({
      source_dir = optional(string)
      output_dir = optional(string)
    }))

    function = optional(object({
      function_name                  = optional(string)
      description                    = optional(string)
      handler                        = optional(string)
      runtime                        = optional(string)
      architectures                  = optional(list(string))
      memory_size                    = optional(number)
      timeout                        = optional(number)
      publish                        = optional(bool)
      environment_variables          = optional(map(string))
      reserved_concurrent_executions = optional(number)
      dead_letter_config = optional(object({
        target_arn = string
      }))
      code_signing_config = optional(object({
        description                     = optional(string)
        signing_profile_version_arns    = list(string)
        untrusted_artfact_on_deployment = optional(string)
      }))
    }))

    iam_policy = optional(list(object({
      effect    = string
      actions   = list(string)
      resources = list(string)
    })))

    networking = optional(object({
      vpc_id     = optional(string)
      subnet_ids = optional(list(string))
      sg_ingress_rules = optional(list(object({
        description      = string
        from_port        = number
        to_port          = number
        cidr_blocks      = optional(list(string))
        ipv6_cidr_blocks = optional(list(string))
        prefix_list_ids  = optional(list(string))
        protocol         = optional(string)
        security_groups  = optional(list(string))
        self             = optional(bool)
      })))
      sg_egress_rules = optional(list(object({
        description      = string
        from_port        = number
        to_port          = number
        cidr_blocks      = optional(list(string))
        ipv6_cidr_blocks = optional(list(string))
        prefix_list_ids  = optional(list(string))
        protocol         = optional(string)
        security_groups  = optional(list(string))
        self             = optional(bool)
      })))
    }))
  })
  default = {}
}

variable "image_optimization_options" {
  description = "Variables passed to the opennext-lambda module for the Next.js Image Optimization function"
  type = object({
    package = optional(object({
      source_dir = optional(string)
      output_dir = optional(string)
    }))

    function = optional(object({
      function_name                  = optional(string)
      description                    = optional(string)
      handler                        = optional(string)
      runtime                        = optional(string)
      architectures                  = optional(list(string))
      memory_size                    = optional(number)
      timeout                        = optional(number)
      publish                        = optional(bool)
      reserved_concurrent_executions = optional(number)
      dead_letter_config = optional(object({
        target_arn = string
      }))
      code_signing_config = optional(object({
        description                     = optional(string)
        signing_profile_version_arns    = list(string)
        untrusted_artfact_on_deployment = optional(string)
      }))
    }))

    environment_variables = optional(map(string))


    iam_policy = optional(list(object({
      effect    = string
      actions   = list(string)
      resources = list(string)
    })))

    networking = optional(object({
      vpc_id     = optional(string)
      subnet_ids = optional(list(string))
      sg_ingress_rules = optional(list(object({
        description      = string
        from_port        = number
        to_port          = number
        cidr_blocks      = optional(list(string))
        ipv6_cidr_blocks = optional(list(string))
        prefix_list_ids  = optional(list(string))
        protocol         = optional(string)
        security_groups  = optional(list(string))
        self             = optional(bool)
      })))
      sg_egress_rules = optional(list(object({
        description      = string
        from_port        = number
        to_port          = number
        cidr_blocks      = optional(list(string))
        ipv6_cidr_blocks = optional(list(string))
        prefix_list_ids  = optional(list(string))
        protocol         = optional(string)
        security_groups  = optional(list(string))
        self             = optional(bool)
      })))
    }))
  })
  default = {}
}

variable "revalidation_options" {
  description = "Variables passed to the opennext-lambda module for the Next.js ISR Revalidation function"
  type = object({
    package = optional(object({
      source_dir = optional(string)
      output_dir = optional(string)
    }))

    function = optional(object({
      function_name                  = optional(string)
      description                    = optional(string)
      handler                        = optional(string)
      runtime                        = optional(string)
      architectures                  = optional(list(string))
      memory_size                    = optional(number)
      timeout                        = optional(number)
      publish                        = optional(bool)
      reserved_concurrent_executions = optional(number)
      dead_letter_config = optional(object({
        target_arn = string
      }))
      code_signing_config = optional(object({
        description                     = optional(string)
        signing_profile_version_arns    = list(string)
        untrusted_artfact_on_deployment = optional(string)
      }))
    }))

    environment_variables = optional(map(string))


    iam_policy = optional(list(object({
      effect    = string
      actions   = list(string)
      resources = list(string)
    })))

    networking = optional(object({
      vpc_id     = optional(string)
      subnet_ids = optional(list(string))
      sg_ingress_rules = optional(list(object({
        description      = string
        from_port        = number
        to_port          = number
        cidr_blocks      = optional(list(string))
        ipv6_cidr_blocks = optional(list(string))
        prefix_list_ids  = optional(list(string))
        protocol         = optional(string)
        security_groups  = optional(list(string))
        self             = optional(bool)
      })))
      sg_egress_rules = optional(list(object({
        description      = string
        from_port        = number
        to_port          = number
        cidr_blocks      = optional(list(string))
        ipv6_cidr_blocks = optional(list(string))
        prefix_list_ids  = optional(list(string))
        protocol         = optional(string)
        security_groups  = optional(list(string))
        self             = optional(bool)
      })))
    }))
  })
  default = {}
}

variable "warmer_options" {
  description = "Variables passed to the opennext-lambda module for the Next.js Warmer function"
  type = object({
    package = optional(object({
      source_dir = optional(string)
      output_dir = optional(string)
    }))

    function = optional(object({
      function_name                  = optional(string)
      description                    = optional(string)
      handler                        = optional(string)
      runtime                        = optional(string)
      architectures                  = optional(list(string))
      memory_size                    = optional(number)
      timeout                        = optional(number)
      publish                        = optional(bool)
      reserved_concurrent_executions = optional(number)
      dead_letter_config = optional(object({
        target_arn = string
      }))
      code_signing_config = optional(object({
        description                     = optional(string)
        signing_profile_version_arns    = list(string)
        untrusted_artfact_on_deployment = optional(string)
      }))
    }))

    environment_variables = optional(map(string))


    iam_policy = optional(list(object({
      effect    = string
      actions   = list(string)
      resources = list(string)
    })))

    networking = optional(object({
      vpc_id     = optional(string)
      subnet_ids = optional(list(string))
      sg_ingress_rules = optional(list(object({
        description      = string
        from_port        = number
        to_port          = number
        cidr_blocks      = optional(list(string))
        ipv6_cidr_blocks = optional(list(string))
        prefix_list_ids  = optional(list(string))
        protocol         = optional(string)
        security_groups  = optional(list(string))
        self             = optional(bool)
      })))
      sg_egress_rules = optional(list(object({
        description      = string
        from_port        = number
        to_port          = number
        cidr_blocks      = optional(list(string))
        ipv6_cidr_blocks = optional(list(string))
        prefix_list_ids  = optional(list(string))
        protocol         = optional(string)
        security_groups  = optional(list(string))
        self             = optional(bool)
      })))
    }))
  })
  default = {}
}

variable "cloudfront" {
  type = object({
    aliases             = list(string)
    acm_certificate_arn = string
    assets_paths        = optional(list(string))
    custom_headers = optional(list(object({
      header   = string
      override = bool
      value    = string
    })))
    cors = optional(object({
      allow_credentials = bool,
      allow_headers     = list(string)
      allow_methods     = list(string)
      allow_origins     = list(string)
      origin_override   = bool
    }))
    hsts = optional(object({
      access_control_max_age_sec = number
      include_subdomains         = bool
      override                   = bool
      preload                    = bool
    }))
    waf_logging_configuration = optional(object({
      log_destination_configs = list(string)
      logging_filter = optional(object({
        default_behavior = string
        filter = list(object({
          behavior    = string
          requirement = string
          action_condition = optional(list(object({
            action = string
          })))
          label_name_condition = optional(list(object({
            label_name = string
          })))
        }))
      }))
      redacted_fields = optional(list(object({
        method       = optional(bool)
        query_string = optional(bool)
        single_header = optional(object({
          name = string
        }))
        uri_path = optional(bool)
      })))
    }))

  })
}
