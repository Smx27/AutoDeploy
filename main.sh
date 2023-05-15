#!/bin/bash

# Set variables
FRONTEND_PATH="/var/www/html"
API_PATH="/var/www/api"
BACKUP_PATH="/var/backup"
LOG_FILE="/var/log/deployment.log"

# Function to log messages
function log() {
  echo "$(date) $1" >> $LOG_FILE
}

# Function to backup files
function backup() {
  log "Backing up files to $BACKUP_PATH..."
  mkdir -p $BACKUP_PATH
  cp -r $FRONTEND_PATH $BACKUP_PATH/frontend
  cp -r $API_PATH $BACKUP_PATH/api
}

# Function to deploy frontend
function deploy_frontend() {
  log "Deploying frontend..."
  # Call the separate deploy_frontend.sh script
  ./subscript/deploy_frontend.sh $FRONTEND_PATH
}

# Function to deploy API
function deploy_api() {
  log "Deploying API..."
  # Call the separate deploy_api.sh script
  ./subscript/deploy_api.sh $API_PATH
}

# Function to obtain SSL certificate
function obtain_ssl() {
  log "Obtaining SSL certificate using Certbot..."
  # Call the separate obtain_ssl.sh script
  ./subscript/obtain_ssl.sh
}

# Function to deploy on Nginx
function deploy_on_nginx() {
  log "Deploying on Nginx..."
  # Call the separate deploy_on_nginx.sh script
  ./subscript/deploy_on_nginx.sh
}

# Function to deploy on Apache
function deploy_on_apache() {
  log "Deploying on Apache..."
  # Call the separate deploy_on_apache.sh script
  ./subscript/deploy_on_apache.sh
}

# Function to prompt to revert changes
function prompt_to_revert() {
  read -p "Do you want to revert the changes? [y/n]: " REVERT
  if [[ $REVERT =~ ^[Yy]$ ]]; then
    log "Reverting changes..."
    # Call the separate revert_changes.sh script
    ./subscript/revert_changes.sh $FRONTEND_PATH $API_PATH $BACKUP_PATH
  fi
}

# Start deployment
log "Starting deployment..."

# Main page prompt
echo "=== Main Page ==="
echo "1. Deploy Frontend"
echo "2. Deploy API"
echo "3. Obtain SSL Certificate"
echo "4. Deploy on Nginx"
echo "5. Deploy on Apache"
echo "6. Revert Changes"

read -p "Enter your choice (1-6): " CHOICE

case $CHOICE in
  1)
    deploy_frontend
    echo "Want to deploy API?"
    read -p "Type [y/n]" REPLY
     if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Script Started"
    deploy_api
        read -p "Choose Deploy Server Apache or Nginx? [a/n]" SERVER
        if [[ $SERVER =~ ^[Aa]$ ]]; then
        deploy_on_apache
            read -p "Want To integrate SSL? [y/n]" SSL
            if [[ $SSL =~ ^[Yy]$ ]]; then
            obtain_ssl
            fi
        fi
        if [[ $SERVER =~ ^[Nn]$ ]]; then
        deploy_on_nginx
            read -p "Want To integrate SSL? [y/n]" SSL
            if [[ $SSL =~ ^[Yy]$ ]]; then
            obtain_ssl
            fi
        fi
    fi

    ;;
  2)
    deploy_api
    ;;
  3)
    obtain_ssl
    ;;
  4)
    deploy_on_nginx
    ;;
  5)
    deploy_on_apache
    ;;
  6)
    prompt_to_revert
    ;;
  *)
    echo "Invalid choice. Exiting."
    exit 1
    ;;
esac

log "Deployment complete."
