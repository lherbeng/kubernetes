provider "grafana" {
  # Configure the Grafana provider with the necessary details
  url      = "https://your-grafana-instance-url"
  username = "your-username"
  password = "your-password"
}

resource "grafana_dashboard" "filesystem_alert" {
  # Dashboard settings
  folder                = "Nodes Monitoring"
  dashboard_title       = "FilesystemUsageTooHigh metrics"
  overwrite             = true
  timezone              = "browser"
  editable              = true
  hide_controls         = false
  shared_cross_domain   = false
  rows                   = []  # Add rows if needed
  
  # Variables if needed
  # variables = []
  
  # Dashboard links if needed
  # links = []

  # Alert settings
  alerts {
    name       = "Filesytem usage too high metrics"
    conditions = "B"
    frequency  = "5m"

    notifications {
      uid   = "email"
      name  = "Email"
      type  = "email"
      send_reminder = true
    }

    # Expression for alert condition
    expression = "100 - (node_filesystem_free_bytes{device=\"/dev/mapper/vg_data-rke2\"} / node_filesystem_size_bytes{device=\"/dev/mapper/vg_data-rke2\"}) * 100 > 85"
    
    # Alert annotations
    annotations {
      description  = "Attention: The disk usage for /var/lib/rancher has reached 85% capacity, requiring immediate attention."
      runbook_link = "https://confluence.citco.com/display/KUB/Grafana+Alert+-+FileSystemUsageTooHigh"
      summary      = "Filesystem usage is too high"
    }

    # Alert labels
    labels = {
      severity = "critical"
    }

    no_data_state = "ok"
    exec_err_state = "alerting"
  }
}
