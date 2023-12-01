apiVersion = 1
groups = [
  {
    origId   = 1
    name     = "FilesystemUsageTooHigh metrics"
    folder   = "Nodes Monitoring"
    interval = "5m"
    rules    = [
      {
        uid       = "c9d8a183-b0b7-4b46-8cbb-9e19b7474995"
        title     = "Filesytem usage too high metrics"
        condition = "B"
        data      = [
          {
            refId              = "A"
            relativeTimeRange = {
              from = 600
              to   = 0
            }
            datasourceUid = "prometheus"
            model         = {
              editorMode   = "code"
              expr         = '100 - (node_filesystem_free_bytes{device="/dev/mapper/vg_data-rke2"} / node_filesystem_size_bytes{device="/dev/mapper/vg_data-rke2"}) * 100 > 85'
              instant      = true
              intervalMs   = 1000
              legendFormat = "__auto"
              maxDataPoints = 43200
              range        = false
              refId        = "A"
            }
          },
          {
            refId              = "B"
            relativeTimeRange = {
              from = 600
              to   = 0
            }
            datasourceUid = "__expr__"
            model         = {
              conditions = [
                {
                  evaulator {
                    params = []
                    type   = "gt"
                  }
                  operator {
                    type = "and"
                  }
                  query {
                    params = [
                      "B"
                    ]
                  }
                  reducer {
                    params = []
                    type   = "last"
                  }
                  type = "query"
                }
              ]
              datasource = {
                type = "__expr__"
                uid  = "__expr__"
              }
              expression   = "A"
              intervalMs   = 1000
              maxDataPoints = 43200
              reducer      = "last"
              refId        = "B"
              type         = "reduce"
            }
          }
        ]
        noDataState  = "Ok"
        execErrstate = "Alerting"
        for          = "5m"
        annotations = {
          description  = 'Attention: The disk usage for /var/lib/rancher has reached 85% capacity, requiring immediate attention.'
          runbook_url  = "https://confluence.citco.com/display/KUB/Grafana+Alert+-+FileSystemUsageTooHigh"
          summary      = "Filesystem usage is too high"
        }
        labels = {
          severity = "critical"
        }
        isPaused = false
      }
    ]
  }
]
