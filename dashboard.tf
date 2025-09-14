resource "datadog_dashboard" "example" {
  title       = "Example Dashboard"
  description = "An example dashboard created with Terraform"
  layout_type = "ordered"

  widget {
    definition {
      timeseries_definition {
        requests {
          q = "avg:system.cpu.user{*}"
        }
        title = "CPU Usage"
      }
    }
  }
}
