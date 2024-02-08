#!/bin/bash

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with root privileges."
    exit 1
fi

# NGINX version selection (stable or development)
nginx_version="stable" # Use "development" for the latest development version

# Add the NGINX PPA repository
add-apt-repository ppa:nginx/$nginx_version

# Update the package list
apt update

# Install NGINX
apt install nginx

# Define the NGINX configuration file
config_file="/etc/nginx/nginx.conf"

# Create or edit the NGINX configuration
cat <<EOL > $config_file
worker_processes 4;
worker_rlimit_nofile 40000;

events {
    worker_connections 8192;
}

stream {
    upstream rancher_servers_http {
        least_conn;
        server 192.168.1.7:80 max_fails=3 fail_timeout=5s;
        server 192.168.1.5:80 max_fails=3 fail_timeout=5s;
        server 192.168.1.9:80 max_fails=3 fail_timeout=5s;
    }
    server {
        listen 80;
        proxy_pass rancher_servers_http;
    }

    upstream rancher_servers_https {
        least_conn;
        server 192.168.1.7:443 max_fails=3 fail_timeout=5s;
        server 192.168.1.5:443 max_fails=3 fail_timeout=5s;
        server 192.168.1.9:443 max_fails=3 fail_timeout=5s;
    }
}

http {
    server {
        listen 443 ssl;
        proxy_pass rancher_servers_https;
        ssl_certificate /path/to/tls.crt;
        ssl_certificate_key /path/to/key.key;
        location / {
            proxy_pass https://rancher_servers_https;
            proxy_set_header Host <rancher UI URL>;
            proxy_ssl_server_name on;
            proxy_ssl_name brandonlucasfaye.com;
        }
    }
}
EOL

# Reload NGINX to apply the configuration
nginx -s reload

echo "NGINX has been installed and the load balancer configuration is updated and reloaded."
