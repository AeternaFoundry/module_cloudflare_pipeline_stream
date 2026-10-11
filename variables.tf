variable "pipeline_streams" {
  description = <<EOT
Map of pipeline_streams, attributes below
Required:
    - account_id
    - name
Optional:
    - format
    - http
    - schema
    - worker_binding
EOT

  type = map(object({
    account_id = string
    name       = string
    format = optional(object({
      compression      = optional(string)
      decimal_encoding = optional(string)
      row_group_bytes  = optional(number)
      timestamp_format = optional(string)
      type             = string
      unstructured     = optional(bool)
    }))
    http = optional(object({
      authentication = bool
      cors = optional(object({
        origins = optional(list(string))
      }))
      enabled = bool
    }))
    schema = optional(object({
      fields = optional(list(object({
        metadata_key = optional(string)
        name         = optional(string)
        required     = optional(bool)
        sql_name     = optional(string)
        type         = string
        unit         = optional(string)
      })))
      inferred = optional(bool)
    }))
    worker_binding = optional(object({
      enabled = bool
    }))
  }))
}

