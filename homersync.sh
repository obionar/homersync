#!/bin/bash

# Define variables
SOURCE_DIR="$HOME"
DEST_DIR="/mnt/external/backup_home"

# Function to check if rsync is installed
check_rsync() {
    if ! command -v rsync &> /dev/null; then
        echo "rsync could not be found. Installing rsync..."
        sudo apt update && sudo apt install -y rsync
        if [ $? -ne 0 ]; then
            echo "Failed to install rsync. Please install it manually and re-run the script."
            exit 1
        fi
    fi
}

# Function to prompt user for confirmation
confirm() {
    read -r -p "Are you sure you want to continue with the backup? (Y/n) " response
    case "$response" in
        [Yy][Ee][Ss]|[Yy])
            return 0
            ;;
        *)
            echo "Backup aborted."
            exit 1
            ;;
    esac
}

# Function to check if the backup directory is available
check_backup_dir() {
    if [ ! -d "$DEST_DIR" ]; then
        echo "Backup directory $DEST_DIR is not available."
        echo "Please ensure your external hard disk is mounted."
        exit 1
    fi
}

# Check if rsync is installed
check_rsync

# Check if the backup directory is available
check_backup_dir

# Prompt for confirmation
confirm

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Run rsync to backup the home directory, excluding the .cache directory
rsync -avh --delete --exclude=".cache" "$SOURCE_DIR/" "$DEST_DIR/"

# Print completion message
echo "Backup of $SOURCE_DIR completed successfully to $DEST_DIR."
