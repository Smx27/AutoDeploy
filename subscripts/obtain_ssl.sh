#!/bin/bash

# Function to obtain SSL certificate
function obtain_ssl() {
  log "Obtaining SSL certificate using Certbot..."
  certbot certonly --webroot -w $FRONTEND_PATH -d example.com -d www.example.com
}

# Call the obtain_ssl function
obtain_ssl
