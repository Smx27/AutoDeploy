#!/bin/bash

# Function to deploy on Apache
function deploy_on_apache() {
  log "Deploying on Apache..."
  # Install Apache if not already installed
  apt-get update
  apt-get install -y apache2
  # Configure Apache
  cp apache.conf /etc/apache2/sites-available/example.com.conf
  ln -s /etc/apache2/sites-available/example.com.conf /etc/apache2/sites-enabled/
  # Restart Apache
  systemctl restart apache2
}

# Call the deploy_on_apache function
deploy_on_apache
