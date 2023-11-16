#!/bin/bash

# Source server details
source_server="root@brn0vlappdv079a"
source_grafana_db_path="/d3/data01/grafana/grafana.db"

# Destination server details
destination_server="root@brn0vlappdv098a"
destination_server="root@brn0vlappua079a"
destination_server="root@gen0vlapp079a"
destination_grafana_db_path="/d3/data01/grafana/grafana.db"

# Backup on the source server
ssh $source_server "sudo cp $source_grafana_db_path $source_grafana_db_path.backup"

# Copy the backup to the local machine
scp $source_server:$source_grafana_db_path.backup .

# Copy the backup to the destination server
scp ./grafana.db.backup $destination_server:$destination_grafana_db_path

# Restore on the destination server
ssh $destination_server "sudo cp $destination_grafana_db_path $destination_grafana_db_path.backup"
ssh $destination_server "sudo cp grafana.db.backup $destination_grafana_db_path"

# Clean up local backup
rm grafana.db.backup
