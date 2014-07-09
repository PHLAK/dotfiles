#!/bin/bash

# Define your workspace path here
WORKSPACE=/home/chris/Dropbox/workspace

for FILE in $WORKSPACE/*; do
    echo ""
    echo -n "Verifying ${FILE} ... "

    if [ -d $FILE/.git ]; then
        echo "CLEANING"

        cd $FILE
        git fsck
        git gc
    else
        echo "NOT A GIT REPOSITORY"
    fi
done

echo ""
echo "All repositories cleaned!"
