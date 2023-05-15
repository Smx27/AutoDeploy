#!/bin/bash

FRONTEND_PATH=$1
API_PATH=$2
BACKUP_PATH=$3

# Function to revert changes
function revert_changes() {
  log "Reverting changes..."
  # Remove Nginx or Apache config
  rm /etc/nginx/sites-enabled/example.com /etc/nginx/sites-available/example.com
  rm /etc/apache2/sites-enabled/example.com.conf /etc/apache2/sites-available/example.com.conf
  # Restart Nginx or Apache
  systemctl restart nginx || systemctl restart apache2
  # Remove frontend and API files
  rm -rf $FRONTEND_PATH/* $API_PATH/*
  # Restore backup files
  cp -r $BACKUP_PATH/frontend/* $FRONTEND_PATH
  cp -r $BACKUP_PATH/api/* $API_PATH
  # Restart Nginx or Apache
  systemctl restart nginx || systemctl restart apache2
}

# Call the revert_changes function
revert_changes
