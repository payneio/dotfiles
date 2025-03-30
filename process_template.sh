#!/bin/bash

# Script to process a template file by replacing variables with their values

# Usage: process_template.sh template_file output_file
# Example: process_template.sh ~/.dotfiles/copy/.gitconfig.tpl ~/.gitconfig

# Function to process a template
process_template() {
    local template_file="$1"
    local output_file="$2"
    
    # Check if template file exists
    if [ ! -f "$template_file" ]; then
        echo "Error: Template file '$template_file' does not exist"
        return 1
    fi
    
    # Create a temporary file
    local temp_file=$(mktemp)
    
    # Copy template to temp file
    cp "$template_file" "$temp_file"
    
    # Replace variables in the template
    
    # Git user name
    if [ -z "$GIT_NAME" ]; then
        read -p "Enter your Git user name: " GIT_NAME
    fi
    sed -i "s/{{GIT_NAME}}/$GIT_NAME/g" "$temp_file"
    
    # Git email
    if [ -z "$GIT_EMAIL" ]; then
        read -p "Enter your Git email: " GIT_EMAIL
    fi
    sed -i "s/{{GIT_EMAIL}}/$GIT_EMAIL/g" "$temp_file"
    
    # GitHub username
    if [ -z "$GITHUB_USER" ]; then
        read -p "Enter your GitHub username: " GITHUB_USER
    fi
    sed -i "s/{{GITHUB_USER}}/$GITHUB_USER/g" "$temp_file"
    
    # Add more variable replacements here as needed
    
    # Move the processed file to the destination
    mv "$temp_file" "$output_file"
    echo "Template processed and saved to $output_file"
}

# If script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    if [ $# -ne 2 ]; then
        echo "Usage: $0 template_file output_file"
        exit 1
    fi
    
    process_template "$1" "$2"
fi