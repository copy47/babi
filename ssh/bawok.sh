#!/bin/bash
red='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
clear
echo -e "${BLUE}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${BLUE}│${NC}                • SERVER STATUS •                ${BLUE}│${NC}"
echo -e "${BLUE}└─────────────────────────────────────────────────┘${NC}"
echo -e " ${BLUE}┌───────────────────────────────────────────────┐${NC}"
systemctl daemon-reload
echo -e " ${BLUE}│${GREEN}  [INFO] • Starting ...                        ${BLUE}│${NC}"
sleep 1
systemctl restart ssh
echo -e " ${BLUE}│${GREEN}  [INFO] • Restarting SSH Services             ${BLUE}│${NC}"
sleep 1
systemctl restart squid
echo -e " ${BLUE}│${GREEN}  [INFO] • Restarting Squid Services           ${BLUE}│${NC}"
sleep 1
systemctl restart openvpn
systemctl restart nginx
echo -e " ${BLUE}│${GREEN}  [INFO] • Restarting Nginx Services           ${BLUE}│${NC}"
sleep 1
systemctl restart dropbear
echo -e " ${BLUE}│${GREEN}  [INFO] • Restarting Dropbear Services        ${BLUE}│${NC}"
sleep 1
systemctl restart ws-dropbear
echo -e " ${BLUE}│${GREEN}  [INFO] • Restarting Ws-Dropbear Services     ${BLUE}│${NC}"
sleep 1
systemctl restart ws-stunnel
echo -e " ${BLUE}│${GREEN}  [INFO] • Restarting Ws-Stunnel Services      ${BLUE}│${NC}"
sleep 1
systemctl restart stunnel4
echo -e " ${BLUE}│${GREEN}  [INFO] • Restarting Stunnel4 Services        ${BLUE}│${NC}"
sleep 1
systemctl restart xray
echo -e " ${BLUE}│${GREEN}  [INFO] • Restarting Xray Services            ${BLUE}│${NC}"
sleep 1
systemctl restart cron
echo -e " ${BLUE}│${GREEN}  [INFO] • Restarting Cron Services            ${BLUE}│${NC}"
echo -e " ${BLUE}│${GREEN}  [INFO] • All Services Restates Successfully  ${BLUE}│${NC}"
sleep 1
echo -e " ${BLUE}└───────────────────────────────────────────────┘${NC}" 
echo -e "${BLUE}┌────────────────────── ${ORANGE}BY ${BLUE}───────────────────────┐${NC}"
echo -e "${BLUE}│${CYAN}               • SC ARYA BLITAR •                ${BLUE}│${NC}"
echo -e "${BLUE}└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "  Press any key to back on menu"
set