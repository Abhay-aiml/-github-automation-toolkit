#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}GitHub Commit Stats${NC}"
echo "===================="

if [ -z "$GITHUB_TOKEN" ]; then
    echo -e "\033[0;31mError: GITHUB_TOKEN not set!\033[0m"
    exit 1
fi

USERNAME=$(curl -s -H "Authorization: Bearer $GITHUB_TOKEN" \
    https://api.github.com/user | grep '"login"' \
    | head -1 | cut -d '"' -f 4)

echo -e "${CYAN}User: $USERNAME${NC}"
echo ""

REPOS=$(curl -s -H "Authorization: Bearer $GITHUB_TOKEN" \
    "https://api.github.com/user/repos?per_page=100" \
    | grep '"name"' | cut -d '"' -f 4)

echo -e "${YELLOW}Commits per Repo:${NC}"
echo "--------------------"

TOTAL=0
for REPO in $REPOS; do
    COUNT=$(curl -s -H "Authorization: Bearer $GITHUB_TOKEN" \
        "https://api.github.com/repos/$USERNAME/$REPO/commits?per_page=1" \
        -I | grep -i "link:" | grep -o 'page=[0-9]*>' \
        | tail -1 | grep -o '[0-9]*')

    if [ -z "$COUNT" ]; then
        COUNT=1
    fi

    echo -e "  ${GREEN}$REPO${NC}: $COUNT commits"
    TOTAL=$((TOTAL + COUNT))
done

echo "--------------------"
echo -e "${CYAN}Total commits: $TOTAL${NC}"
