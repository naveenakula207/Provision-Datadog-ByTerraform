resource "datadog_dashboard" "example" {
  title       = "Example Dashboard"
  description = "An example dashboard created with Terraform"
  layout_type = "ordered"

  widget {
    timeseries_definition {
      request {
        query = "avg:system.cpu.user{*}"
      }
      title = "CPU Usage"
    }
  }
}
