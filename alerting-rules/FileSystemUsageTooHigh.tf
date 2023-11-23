provider "grafana" {
  url      = "https://your-grafana-instance-url"
  username = "your-username"
  password = "your-password"
}

resource "grafana_alert_notification_channel" "filesystem_alert" {
  name       = "Filesytem usage too high metrics"
  type       = "email"  # Adjust the type based on your notification channel type
  is_default = false
  
  settings {
    addresses = ["your-email@example.com"]  # Adjust based on your notification channel settings
  }

  frequency = "5m"
  
  conditions {
    type  = "query"
    query = "100 - (node_filesystem_free_bytes{device=\"/dev/mapper/vg_data-rke2\"} / node_filesystem_size_bytes{device=\"/dev/mapper/vg_data-rke2\"}) * 100 > 85"
  }

  annotations {
    description  = "Attention: The disk usage for /var/lib/rancher has reached 85% capacity, requiring immediate attention."
    runbook_link = "https://confluence.citco.com/display/KUB/Grafana+Alert+-+FileSystemUsageTooHigh"
    summary      = "Filesystem usage is too high"
  }

  labels = {
    severity = "critical"
  }

  no_data_state = "ok"
  exec_err_state = "alerting"
}
