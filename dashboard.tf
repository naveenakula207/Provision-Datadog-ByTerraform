resource "datadog_dashboard" "dashboard" {
  title       = "Example Dashboard"
  description = "An example dashboard created with Terraform"
  layout_type = "ordered"

  widget {
    definition {
      treemap_definition {
        request {
          query {
            metric_query {
              query = "avg:system.cpu.user{*} by {host}"
              name  = "cpu_usage"
            }
          }
          formula {
            formula = "cpu_usage"
            alias   = "CPU Usage by Host"
          }
        }
      }

      timeseries_definition {
        requests {
          q = "avg:system.cpu.user{*}"
        }
        title = "CPU Usage"
      }
    }
  }
}
