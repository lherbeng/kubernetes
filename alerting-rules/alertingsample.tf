resource "grafana_folder" "rule_folder" {
  title = "Nodes Monitoring"
}

resource "grafana_rule_group" "filesystem_alert" {
  name             = "FilesystemUsageTooHigh metrics"
  folder_uid       = grafana_folder.rule_folder.uid
  interval_seconds = 300
  org_id           = 1

  rule {
    name           = "Filesystem usage too high metrics"
    for            = "5m"
    condition      = "B"
    no_data_state  = "Ok"
    exec_err_state = "Alerting"

    annotations = {
      description = 'Attention: The disk usage for /var/lib/rancher has reached 85% capacity, requiring immediate attention.'
      runbook_url = "https://confluence.citco.com/display/KUB/Grafana+Alert+-+FileSystemUsageTooHigh"
      summary     = "Filesystem usage is too high"
    }

    labels = {
      severity = "critical"
    }

    is_paused = false

    data {
      ref_id     = "A"
      query_type = "code"
      relative_time_range {
        from = 600
        to   = 0
      }
      datasource_uid = "prometheus"

      model = jsonencode({
        editorMode   = "code"
        expr         = '100 - (node_filesystem_free_bytes{device="/dev/mapper/vg_data-rke2"} / node_filesystem_size_bytes{device="/dev/mapper/vg_data-rke2"}) * 100 > 85'
        instant      = true
        intervalMs   = 1000
        legendFormat = "__auto"
        maxDataPoints = 43200
        range        = false
        refId        = "A"
      })
    }

    data {
      ref_id     = "B"
      query_type = "classic_conditions"
      relative_time_range {
        from = 600
        to   = 0
      }
      datasource_uid = "__expr__"

      model = <<EOT
{
  "conditions": [
    {
      "evaluator": {
        "params": [],
        "type": "gt"
      },
      "operator": {
        "type": "and"
      },
      "query": {
        "params": [
          "B"
        ]
      },
      "reducer": {
        "params": [],
        "type": "last"
      },
      "type": "query"
    }
  ],
  "datasource": {
    "type": "__expr__",
    "uid": "__expr__"
  },
  "hide": false,
  "intervalMs": 1000,
  "maxDataPoints": 43200,
  "refId": "B",
  "type": "classic_conditions"
}
EOT
    }
  }
}

----

resource "grafana_folder" "rule_folder" {
  title = "Nodes Monitoring"
}

resource "grafana_rule_group" "filesystem_alert" {
  name             = "FilesystemUsageTooHigh metrics"
  folder_uid       = grafana_folder.rule_folder.uid
  interval_seconds = 300
  org_id           = 1

  rule {
    name           = "Filesystem usage too high metrics"
    for            = "5m"
    condition      = "B"
    no_data_state  = "Ok"
    exec_err_state = "Alerting"

    annotations = {
      description = <<-EOT
        Attention: The disk usage for /var/lib/rancher has reached 85% capacity,
        requiring immediate attention.
      EOT
      runbook_url = "https://confluence.citco.com/display/KUB/Grafana+Alert+-+FileSystemUsageTooHigh"
      summary     = "Filesystem usage is too high"
    }

    labels = {
      severity = "critical"
    }

    is_paused = false

    data {
      ref_id     = "A"
      query_type = "code"
      relative_time_range {
        from = 600
        to   = 0
      }
      datasource_uid = "prometheus"

      model = jsonencode({
        editorMode   = "code",
        expr         = '100 - (node_filesystem_free_bytes{device="/dev/mapper/vg_data-rke2"} / node_filesystem_size_bytes{device="/dev/mapper/vg_data-rke2"}) * 100 > 85',
        instant      = true,
        intervalMs   = 1000,
        legendFormat = "__auto",
        maxDataPoints = 43200,
        range        = false,
        refId        = "A",
      })
    }

    data {
      ref_id     = "B"
      query_type = "classic_conditions"
      relative_time_range {
        from = 600
        to   = 0
      }
      datasource_uid = "__expr__"

      model = jsonencode({
        conditions    = [
          {
            evaluator = {
              params = [],
              type   = "gt"
            }
            operator = {
              type = "and"
            }
            query = {
              params = ["B"]
            }
            reducer = {
              params = [],
              type   = "last"
            }
            type = "query"
          }
        ],
        datasource    = {
          type = "__expr__",
          uid  = "__expr__"
        },
        hide          = false,
        intervalMs    = 1000,
        maxDataPoints = 43200,
        refId         = "B",
        type          = "classic_conditions"
      })
    }
  }
}

}
