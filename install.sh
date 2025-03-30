#!/bin/bash

# Simple dotfiles installer using directory structure to determine installation method

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SYMLINK_DIR="$SCRIPT_DIR/symlink"
COPY_DIR="$SCRIPT_DIR/copy"

# Print a message with type prefix
log() {
    local type="$1"
    local message="$2"
    echo "[$type] $message"
}

# Create a symlink to a file
create_symlink() {
    local source_file="$1"
    local target_file="$2"
    
    # If target already exists
    if [ -e "$target_file" ] || [ -L "$target_file" ]; then
        # If it's already a symlink to our file, do nothing
        if [ -L "$target_file" ] && [ "$(readlink "$target_file")" = "$source_file" ]; then
            log "SKIP" "$target_file is already correctly linked"
            return 0
        fi
        
        # Ask to replace
        read -p "Replace existing $target_file? [y/N] " answer
        if [[ "$answer" != "y" && "$answer" != "Y" ]]; then
            log "SKIP" "$target_file"
            return 0
        fi
        
        # Remove the existing file/symlink
        rm -rf "$target_file"
    fi
    
    # Create the symlink
    ln -s "$source_file" "$target_file"
    log "LINK" "$target_file -> $source_file"
}

# Copy a file
copy_file() {
    local source_file="$1"
    local target_file="$2"
    
    # If target already exists
    if [ -e "$target_file" ]; then
        # If files are identical, do nothing
        if cmp -s "$source_file" "$target_file"; then
            log "SKIP" "$target_file is already identical"
            return 0
        fi
        
        # Ask to replace
        read -p "Replace existing $target_file? [y/N] " answer
        if [[ "$answer" != "y" && "$answer" != "Y" ]]; then
            log "SKIP" "$target_file"
            return 0
        fi
    fi
    
    # Copy the file
    cp -f "$source_file" "$target_file"
    
    # If source is executable, make target executable too
    if [ -x "$source_file" ]; then
        chmod +x "$target_file"
    fi
    
    log "COPY" "$target_file"
}

# Handle template files
process_template_file() {
    local template="$1"
    local target="$2"
    
    # If template exists
    if [ -f "$template" ]; then
        # If target already exists
        if [ -e "$target" ]; then
            # Ask to replace
            read -p "Replace existing $target? [y/N] " answer
            if [[ "$answer" != "y" && "$answer" != "Y" ]]; then
                log "SKIP" "$target"
                return 0
            fi
        fi
        
        # Run the template processor
        log "GEN" "Generating $target from template"
        bash "$SCRIPT_DIR/process_template.sh" "$template" "$target"
    fi
}

# Install files that should be symlinked
log "INFO" "Installing symlinked files..."
for file in "$SYMLINK_DIR"/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        target="$HOME/.$filename"
        create_symlink "$file" "$target"
    fi
done

# Handle subdirectories in symlink dir
for dir in "$SYMLINK_DIR"/*/; do
    if [ -d "$dir" ]; then
        dirname=$(basename "$dir")
        target="$HOME/.$dirname"
        create_symlink "$dir" "$target"
    fi
done

# Install files that should be copied
log "INFO" "Installing copied files..."

# Function to copy files recursively, preserving path structure
copy_recursively() {
    local base_source="$1"
    local base_target="$2"
    local path_prefix="$3"
    
    # Process all files and directories
    find "$base_source" -type f -o -type d | while read -r item; do
        # Get the relative path from the base source
        local rel_path="${item#$base_source/}"
        
        # Skip template files, they're handled separately
        if [[ "$rel_path" == *.tpl ]]; then
            continue
        fi
        
        # Skip if this is the base directory itself
        if [ "$item" = "$base_source" ]; then
            continue
        fi
        
        # Construct target path
        local target_path="$base_target/$rel_path"
        
        if [ -d "$item" ]; then
            # Create directory if it doesn't exist
            if [ ! -d "$target_path" ]; then
                mkdir -p "$target_path"
                log "DIR" "Created directory $target_path"
            fi
        elif [ -f "$item" ]; then
            # Copy file
            copy_file "$item" "$target_path"
        fi
    done
}

# Copy everything from the copy directory to home, preserving paths
copy_recursively "$COPY_DIR" "$HOME" ""

# Process template files
log "INFO" "Processing template files..."
if [ -f "$COPY_DIR/.gitconfig.tpl" ]; then
    process_template_file "$COPY_DIR/.gitconfig.tpl" "$HOME/.gitconfig"
fi

# Process other templates as needed here
# Example: process_template_file "$COPY_DIR/.ssh-config.tpl" "$HOME/.ssh/config"

log "INFO" "Installation complete"