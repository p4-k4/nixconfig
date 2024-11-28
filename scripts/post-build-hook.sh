#!/bin/sh

# This script runs after nix-darwin rebuilds
# It ensures chezmoi is installed and available

# Get the current user
CURRENT_USER=$(stat -f "%Su" /dev/console)

# Function to run command as user
run_as_user() {
    su - "$CURRENT_USER" -c "$1"
}

# Check if chezmoi is installed
if ! run_as_user "command -v chezmoi" > /dev/null 2>&1; then
    echo "Reinstalling chezmoi..."
    run_as_user "brew install chezmoi"
fi
