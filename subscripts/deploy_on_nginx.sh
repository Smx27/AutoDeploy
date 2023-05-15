#!/bin/bash

# Function to deploy on Nginx
function deploy_on_nginx() {
  log "Deploying on Nginx..."
  # Install Nginx if not already installed
  apt-get update
  apt-get install -y nginx
  # Configure Nginx
  cp nginx.conf /etc/nginx/sites-available/example.com
  ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled/
  # Restart Nginx
  systemctl restart nginx
}

# Call the deploy_on_nginx function
deploy_on_nginx
