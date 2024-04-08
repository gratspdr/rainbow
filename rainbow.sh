red='\033[0;91m'
green='\033[1;92m'
yellow='\033[1;93m'
blue='\033[1;94m'
magenta='\033[1;95m'
cyan='\033[1;96m'
clear='\033[0m'
echo -e "$red"
killall ngrok
echo -e "$clear"
echo -e "$cyan"
echo "Installing . . . . . !!"
echo -e "$clear"
wget -qO token.txt https://gitlab.com/ghcees/rainbow/-/raw/main/token.txt > /dev/null 2>&1
sleep 1
TIK=$(shuf -n 1 token.txt)
USER=$1
sleep 1
rm -rf ngrok  ngrok-v3-stable-linux-amd64.tgz > /dev/null 2>&1
wget -qO ngrok-v3-stable-linux-amd64.tgz https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz > /dev/null 2>&1
tar -xvf ngrok-v3-stable-linux-amd64.tgz  > /dev/null 2>&1
./ngrok authtoken $TIK &>/dev/null &
nohup ./ngrok tcp 9050 --region ap &>/dev/null &
wget -qO sokpy.py https://raw.githubusercontent.com/sarifadim/sifu/main/sokpy.py > /dev/null 2>&1
sleep 1
nohup python3 sokpy.py &>/dev/null &
echo -e "${blue}Proxy Address:${clear}"
echo -e "$yellow"
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo -e "$clear"
echo -e "${blue}IP Address:${clear}"
echo -e "$yellow"
curl ipinfo.io/ip
echo -e "$clear"
echo
echo -e "${blue}ISP & Country:${clear}"
echo -e "$green"
curl ipinfo.io/org
curl ipinfo.io/country
echo -e "$clear"
rm -rf  winter* sokp* token* rainbow* ngrok-v3-stable-linux-amd64.tgz > /dev/null 2>&1
TZ=UTC-7 date +%R-%d/%m/%y