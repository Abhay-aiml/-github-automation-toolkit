#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}GitHub Auto Push Script${NC}"
echo "========================"

if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo -e "${RED}Error: Not inside a Git repository!${NC}"
    exit 1
fi

if [ -z "$(git status --porcelain)" ]; then
    echo -e "${GREEN}Nothing to commit!${NC}"
    exit 0
fi

echo -e "${YELLOW}Enter commit message:${NC}"
read MSG

if [ -z "$MSG" ]; then
    MSG="Auto commit: $(date '+%Y-%m-%d %H:%M:%S')"
fi

git add .
git commit -m "$MSG"
git push

echo -e "${GREEN}Successfully pushed to GitHub!${NC}"#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}GitHub Auto Push Script${NC}"
echo "========================"

if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo -e "${RED}Error: Not inside a Git repository!${NC}"
    exit 1
fi

if [ -z "$(git status --porcelain)" ]; then
    echo -e "${GREEN}Nothing to commit!${NC}"
    exit 0
fi

echo -e "${YELLOW}Enter commit message:${NC}"
read MSG

if [ -z "$MSG" ]; then
    MSG="Auto commit: $(date '+%Y-%m-%d %H:%M:%S')"
fi

git add .
git commit -m "$MSG"
git push

echo -e "${GREEN}Successfully pushed to GitHub!${NC}"



