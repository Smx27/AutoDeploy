#!/bin/bash

FRONTEND_PATH=$1

# Function to deploy frontend
function deploy_frontend() {
  log "Deploying frontend..."
  # Build frontend
  cd frontend
  ng build --prod --output-path $FRONTEND_PATH
}

# Call the deploy_frontend function
deploy_frontend
