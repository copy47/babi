#!/bin/bash
red='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
function status(){
clear
cek=$(service ssh status | grep active | cut -d ' ' -f5)
if [ "$cek" = "active" ]; then
stat=-f5
else
stat=-f7
fi
cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
rekk='xray'
becek='XRAY'
else
rekk='v2ray'
becek='V2RAY'
fi

ssh=$(service ssh status | grep active | cut -d ' ' $stat)
if [ "$ssh" = "active" ]; then
ressh="${green}ONLINE${NC}"
else
ressh="${red}OFFLINE${NC}"
fi
sshstunel=$(service stunnel4 status | grep active | cut -d ' ' $stat)
if [ "$sshstunel" = "active" ]; then
resst="${green}ONLINE${NC}"
else
resst="${red}OFFLINE${NC}"
fi
sshws=$(service ws-dropbear status | grep active | cut -d ' ' $stat)
if [ "$sshws" = "active" ]; then
rews="${green}ONLINE${NC}"
else
rews="${red}OFFLINE${NC}"
fi

sshws2=$(service ws-stunnel status | grep active | cut -d ' ' $stat)
if [ "$sshws2" = "active" ]; then
rews2="${green}ONLINE${NC}"
else
rews2="${red}OFFLINE${NC}"
fi

db=$(service dropbear status | grep active | cut -d ' ' $stat)
if [ "$db" = "active" ]; then
resdb="${green}ONLINE${NC}"
else
resdb="${red}OFFLINE${NC}"
fi
 
v2r=$(service $rekk status | grep active | cut -d ' ' $stat)
if [ "$v2r" = "active" ]; then
resv2r="${green}ONLINE${NC}"
else
resv2r="${red}OFFLINE${NC}"
fi
vles=$(service $rekk status | grep active | cut -d ' ' $stat)
if [ "$vles" = "active" ]; then
resvles="${green}ONLINE${NC}"
else
resvles="${red}OFFLINE${NC}"
fi
trj=$(service $rekk status | grep active | cut -d ' ' $stat)
if [ "$trj" = "active" ]; then
restr="${green}ONLINE${NC}"
else
restr="${red}OFFLINE${NC}"
fi

ningx=$(service nginx status | grep active | cut -d ' ' $stat)
if [ "$ningx" = "active" ]; then
resnx="${green}ONLINE${NC}"
else
resnx="${red}OFFLINE${NC}"
fi

squid=$(service squid status | grep active | cut -d ' ' $stat)
if [ "$squid" = "active" ]; then
ressq="${green}ONLINE${NC}"
else
ressq="${red}OFFLINE${NC}"
fi
echo -e "${BLUE}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${BLUE}│${NC}                • SERVER STATUS •                ${BLUE}│${NC}"
echo -e "${BLUE}└─────────────────────────────────────────────────┘${NC}"
echo -e "${BLUE}┌───────────────────────────────────────────────┐${NC}"
echo -e "${BLUE}│${NC}  • SSH & VPN                        • $ressh"
echo -e "${BLUE}│${NC}  • SQUID                            • $ressq"
echo -e "${BLUE}│${NC}  • DROPBEAR                         • $resdb"
echo -e "${BLUE}│${NC}  • NGINX                            • $resnx"
echo -e "${BLUE}│${NC}  • WS DROPBEAR                      • $rews"
echo -e "${BLUE}│${NC}  • WS STUNNEL                       • $rews2"
echo -e "${BLUE}│${NC}  • STUNNEL                          • $resst"
echo -e "${BLUE}│${NC}  • XRAY-SS                          • $resv2r"
echo -e "${BLUE}│${NC}  • XRAY                             • $resv2r"
echo -e "${BLUE}│${NC}  • VLESS                            • $resvles"
echo -e "${BLUE}│${NC}  • TROJAN                           • $restr"
echo -e "${BLUE}└───────────────────────────────────────────────┘${NC}" 
echo -e "${BLUE}┌────────────────────── ${ORANGE}BY ${BLUE}───────────────────────┐${NC}"
echo -e "${BLUE}│${CYAN}               • SC ARYA BLITAR •                ${BLUE}│${NC}"
echo -e "${BLUE}└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "  Press any key to back on menu"
set
}
function restart(){
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
}

[[ -f /etc/ontorrent ]] && sts="\033[0;32mON \033[0m" || sts="\033[1;31mOFF\033[0m"

enabletorrent() {
[[ ! -f /etc/ontorrent ]] && {
sudo iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
sudo iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
sudo iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
sudo iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
sudo iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
sudo iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
sudo iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
sudo iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
sudo iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
sudo iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
sudo iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
sudo iptables-save > /etc/iptables.up.rules
sudo iptables-restore -t < /etc/iptables.up.rules
sudo netfilter-persistent save >/dev/null 2>&1  
sudo netfilter-persistent reload >/dev/null 2>&1 
touch /etc/ontorrent
set
} || {
sudo iptables -D FORWARD -m string --string "get_peers" --algo bm -j DROP
sudo iptables -D FORWARD -m string --string "announce_peer" --algo bm -j DROP
sudo iptables -D FORWARD -m string --string "find_node" --algo bm -j DROP
sudo iptables -D FORWARD -m string --algo bm --string "BitTorrent" -j DROP
sudo iptables -D FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
sudo iptables -D FORWARD -m string --algo bm --string "peer_id=" -j DROP
sudo iptables -D FORWARD -m string --algo bm --string ".torrent" -j DROP
sudo iptables -D FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
sudo iptables -D FORWARD -m string --algo bm --string "torrent" -j DROP
sudo iptables -D FORWARD -m string --algo bm --string "announce" -j DROP
sudo iptables -D FORWARD -m string --algo bm --string "info_hash" -j DROP
sudo iptables-save > /etc/iptables.up.rules
sudo iptables-restore -t < /etc/iptables.up.rules
sudo netfilter-persistent save >/dev/null 2>&1
sudo netfilter-persistent reload >/dev/null 2>&1 
rm -f /etc/ontorrent
set
}
}

clear
echo -e "${BLUE}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${BLUE}│ ${NC}               • VPS SETTING •                 ${BLUE} │${NC}"
echo -e "${BLUE}└─────────────────────────────────────────────────┘${NC}"
echo -e " ${BLUE}┌───────────────────────────────────────────────┐${NC}"
echo -e " ${BLUE}│$NC   ${ORANGE}[01]${NC} • RUNNING           ${ORANGE}[05]${NC} • RESTART ALL"
echo -e " ${BLUE}│$NC   ${ORANGE}[02]${NC} • SET BANNER        ${ORANGE}[06]${NC} • AUTO REBOOT"
echo -e " ${BLUE}│$NC   ${ORANGE}[03]${NC} • RESTART BANNER    ${ORANGE}[07]${NC} • TEST SPEED"
echo -e " ${BLUE}│$NC   ${ORANGE}[04]${NC} • BANDWITH USAGE "
echo -e " ${BLUE}│$NC"
echo -e " ${BLUE}│$NC   $ORANGE[00]$NC • BALIK MENU"
echo -e " ${BLUE}└───────────────────────────────────────────────┘${NC}"
echo -e "${BLUE}┌────────────────────── ${ORANGE}BY ${BLUE}───────────────────────┐${NC}"
echo -e "${BLUE}│${CYAN}               • SC ARYA BLITAR •                ${BLUE}│${NC}"
echo -e "${BLUE}└─────────────────────────────────────────────────┘${NC}"
echo -e ""
read -p "  Select menu :  "  opt
echo -e   ""
case $opt in
01 | 1) clear ; status ;;
02 | 2) clear ; nano /etc/issue.net ;;
03 | 3) clear ; /etc/init.d/dropbear restart ;;
04 | 4) clear ; banwit ;;
05 | 5) clear ; restart ;;
06 | 6) clear ; reboot ;;
07 | 7) clear ; speedtest ;;
00 | 0) clear ; menu ;;
*) clear ; set ;;
esac
