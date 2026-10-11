resource "cloudflare_pipeline_stream" "pipeline_streams" {
  for_each = var.pipeline_streams

  account_id     = each.value.account_id
  name           = each.value.name
  format         = each.value.format
  http           = each.value.http
  schema         = each.value.schema
  worker_binding = each.value.worker_binding
}

