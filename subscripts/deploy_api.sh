#!/bin/bash

API_PATH=$1

# Function to deploy API
function deploy_api() {
  log "Deploying API..."
  # Build API
  cd api
  dotnet publish -c Release -o $API_PATH
}

# Call the deploy_api function
deploy_api
