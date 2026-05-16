#!/bin/bash

echo "=== My Repos ==="
for REPO in project1 project2 github-automation; do
    echo "Repo: $REPO"
done

echo ""
echo "=== Counting ==="
COUNT=1
while [ $COUNT -le 5 ]; do
    echo "Task $COUNT"
    COUNT=$((COUNT + 1))
done

echo ""
echo "=== My Files ==="
for FILE in *.sh; do
    echo "Found: $FILE"
done
