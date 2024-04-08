red='\033[0;91m'
green='\033[1;92m'
yellow='\033[1;93m'
blue='\033[1;94m'
magenta='\033[1;95m'
cyan='\033[1;96m'
clear='\033[0m'
echo  "$red"
killall ngrok
echo  "$clear"
echo  "$cyan"
echo "Installing . . . . . !!"
echo  "$clear"
wget -qO token.txt https://gitlab.com/ghcees/rainbow/-/raw/main/token.txt  > /dev/null 2>&1
sleep 1
TIK=$(shuf -n 1 token.txt)
USER=$1
sleep 1
rm -rf ngrok  ngrok-v3-stable-linux-amd64.tgz > /dev/null 2>&1
wget -qO ngrok-v3-stable-linux-amd64.tgz https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz > /dev/null 2>&1
tar -xvf ngrok-v3-stable-linux-amd64.tgz  > /dev/null 2>&1
./ngrok authtoken $TIK &>/dev/null &
nohup ./ngrok tcp 9050 --region ap &>/dev/null &
wget -qO sokpy.py https://gitlab.com/ghcees/rainbow/-/raw/main/sokpy.py  > /dev/null 2>&1
sleep 1
nohup python3 sokpy.py &>/dev/null &
echo  "${blue}Proxy Address:${clear}"
echo  "$yellow"
curl --silent --showrror http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo  "$clear"
echo  "${blue}IP Address:${clear}"
echo  "$yellow"
curl ipinfo.io/ip
echo  "$clear"
echo
echo  "${blue}ISP & Country:${clear}"
echo  "$green"
curl ipinfo.io/org
curl ipinfo.io/country
echo  "$clear"
