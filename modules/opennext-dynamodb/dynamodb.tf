

resource "aws_dynamodb_table" "example" {
  name      = "${var.prefix}-cache"
  hash_key  = "tag"
  range_key = "path"

  billing_mode   = var.table_options.provisioned_throughput != null ? "PROVISIONED" : "PAY_PER_REQUEST"
  read_capacity  = try(var.table_options.provisioned_throughput.read_capacity_units, null)
  write_capacity = try(var.table_options.provisioned_throughput.write_capacity_units, null)
  point_in_time_recovery {
    enabled = var.table_options.point_in_time_recovery
  }

  server_side_encryption {
    enabled     = true
    kms_key_arn = var.table_options.kms_key_arn
  }

  global_secondary_index {
    name            = "revalidate"
    hash_key        = "path"
    range_key       = "revalidatedAt"
    write_capacity  = try(var.table_options.provisioned_throughput.write_capacity_units, null)
    read_capacity   = try(var.table_options.provisioned_throughput.read_capacity_units, null)
    projection_type = "ALL"
  }

  attribute {
    name = "tag"
    type = "S"
  }
  attribute {
    name = "path"
    type = "S"
  }
  attribute {
    name = "revalidatedAt"
    type = "N"
  }

  tags = var.default_tags
}
