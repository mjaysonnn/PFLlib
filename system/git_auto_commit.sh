#!/bin/bash

# Git pull changes from the remote repository
echo "Pulling changes from the remote repository..."
git pull

# Check for changes
# empty line
echo ""
echo "Checking for changes..."
if [[ ! -z $(git status --porcelain) ]]; then
    # Stage all changes, including those in parent directories
    git add -A

    # Commit changes with a message
    git commit -m "Automated commit: $(date +"%Y-%m-%d %H:%M:%S")"

    # Push changes to the remote repository
    git push
else
    echo "No changes detected."
fi
