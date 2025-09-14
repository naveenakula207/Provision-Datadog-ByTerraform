terraform {
  required_providers {
    datadog = {
      source  = "DataDog/datadog"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "datadog" {
  api_key = ${{ secrets.DATADOG_API_KEY }}
  app_key = ${{ secrets.DATADOG_APP_KEY }}
}

resource "datadog_monitor" "example_monitor" {
  name    = "Example Monitor"
  type    = "metric alert"
  query   = "avg(last_5m):avg:system.cpu.user{host:host0} > 80"
  message = "CPU usage is above 80% on host0."
  tags    = ["env:production"]

  thresholds {
    critical = 80
  }
}
