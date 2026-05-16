#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}GitHub Repo Backup Script${NC}"
echo "=========================="

if [ -z "$GITHUB_TOKEN" ]; then
    echo -e "${RED}Error: GITHUB_TOKEN not set!${NC}"
    exit 1
fi

BACKUP_DIR=~/github-backups/$(date "+%Y-%m-%d")
mkdir -p "$BACKUP_DIR"
echo -e "${YELLOW}Backup folder: $BACKUP_DIR${NC}"

echo -e "${YELLOW}Fetching your repos...${NC}"
REPOS=$(curl -s -H "Authorization: Bearer $GITHUB_TOKEN" \
    "https://api.github.com/user/repos?per_page=100" \
    | grep '"clone_url"' \
    | cut -d '"' -f 4)

if [ -z "$REPOS" ]; then
    echo -e "${RED}No repos found!${NC}"
    exit 1
fi

COUNT=0
for REPO_URL in $REPOS; do
    REPO_NAME=$(basename "$REPO_URL" .git)
    echo -e "${YELLOW}Cloning: $REPO_NAME${NC}"
    if git clone "$REPO_URL" "$BACKUP_DIR/$REPO_NAME" 2>/dev/null; then
        echo -e "${GREEN}Done: $REPO_NAME${NC}"
        COUNT=$((COUNT + 1))
    else
        echo -e "${RED}Failed: $REPO_NAME${NC}"
    fi
done

echo ""
echo -e "${GREEN}Backup complete! $COUNT repos saved!${NC}"
echo -e "${GREEN}Location: $BACKUP_DIR${NC}"
