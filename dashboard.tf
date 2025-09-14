resource "datadog_dashboard" "example_dashboard" {
  title       = "Treemap Custom Links Test"
  layout_type = "ordered"

  widget {
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
        }
      }
      title = "Host CPU Usage"
      custom_links {
        label = "View Host Details"
        #link  = "https://app.datadoghq.com/infrastructure/host/{{host}}"  # Correct template variable syntax
      }
      custom_links {
        label = "View Documentation"
        #link  = "https://docs.example.com/monitoring"  # Static URL example
      }
    }
  }
}