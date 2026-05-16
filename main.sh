#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}================================${NC}"
echo -e "${CYAN}  GitHub Automation Toolkit${NC}"
echo -e "${CYAN}  Made by: Abhay-aiml${NC}"
echo -e "${CYAN}================================${NC}"
echo ""
echo -e "${YELLOW}Choose an option:${NC}"
echo "1. Auto Push to GitHub"
echo "2. Backup All Repos"
echo "3. Show Commit Stats"
echo "4. Exit"
echo ""
echo -e "${YELLOW}Enter your choice:${NC}"
read CHOICE

if [ "$CHOICE" = "1" ]; then
    ./auto_push.sh
elif [ "$CHOICE" = "2" ]; then
    ./repo_backup.sh
elif [ "$CHOICE" = "3" ]; then
    ./commit_stats.sh
elif [ "$CHOICE" = "4" ]; then
    echo -e "${GREEN}Goodbye!${NC}"
    exit 0
else
    echo "Invalid choice!"
fi
