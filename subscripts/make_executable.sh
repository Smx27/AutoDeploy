#!/bin/bash

# Set the list of sub scripts
SUB_SCRIPTS=("deploy_frontend.sh" "deploy_api.sh" "obtain_ssl.sh" "deploy_on_nginx.sh" "deploy_on_apache.sh" "revert_changes.sh")

# Function to make scripts executable
function make_executable() {
  for script in "${SUB_SCRIPTS[@]}"; do
    chmod +x "$script"
  done
}

# Call the make_executable function
make_executable
