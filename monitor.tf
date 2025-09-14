resource "datadog_monitor" "high_cpu" {
  name    = "High CPU usage alert"
  type    = "metric alert"
  query   = "avg(last_5m):avg:system.cpu.user{*} > 80"
  message = "Warning: High CPU usage on {{host.name}}"

  thresholds {
    warning  = 70
    critical = 80
  }
  notify_no_data = true
  no_data_timeframe = 10
  tags = ["env:development", "team:devops"]
}
