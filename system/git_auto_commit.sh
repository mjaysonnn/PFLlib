#!/bin/bash

# Check for changes
if [[ ! -z $(git status --porcelain) ]]; then
    # Stage all changes
    git add .

    # Commit changes with a message
    git commit -m "Automated commit: $(date +"%Y-%m-%d %H:%M:%S")"

    # Push changes to the remote repository
    git push
else
    echo "No changes detected."
fi
