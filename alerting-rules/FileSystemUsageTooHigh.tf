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


---

provider "grafana" {
  url      = "https://your-grafana-instance-url"
  username = "your-username"
  password = "your-password"
}

resource "grafana_alert_notification_channel" "filesystem_alert" {
  uid        = "c9d8a183-b0b7-4b46-8cbb-9e19b7474995"
  name       = "Filesytem usage too high metrics"
  type       = "prometheus"
  is_default = false
  
  settings {
    http_method = "POST"
    url         = "http://your-prometheus-url/api/v1/alerts"
    username    = "your-prometheus-username"
    password    = "your-prometheus-password"
    send_resolved = true  # Set to true if you want resolved alerts to be sent
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

  no_data_state   = "ok"
  exec_err_state  = "alerting"
  execution_error = "Alerting"
  timeout         = "5m"
  thresholds      = [{}]
}
