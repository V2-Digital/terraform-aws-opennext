/**
 * Common Variables
 **/
variable "prefix" {
  type        = string
  description = "Prefix for created resource IDs"
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags to apply to all created resources"
  default     = {}
}

variable "region" {
  type        = string
  description = "The deployment region to be used by the AWS provider."
}

variable "table_options" {
  type = object({
    kms_key_arn = optional(string)
    provisioned_throughput = optional(object({
      read_capacity_units  = number
      write_capacity_units = number
    }))
    point_in_time_recovery = optional(bool)
  })
  default = {
    kms_key_arn            = null
    provisioned_throughput = null
    point_in_time_recovery = true
  }
}
