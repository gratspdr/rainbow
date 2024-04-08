rm -rf rudalpro.* > /dev/null 2>&1
rm -rf token.txt* > /dev/null 2>&1
wget https://gitlab.com/ghcees/prox/-/raw/main/token.txt > /dev/null 2>&1
sleep 1
TIK=$(shuf -n 1 token.txt)
USER=$1
sleep 1
rm -rf ngrok > /dev/null 2>&1
curl -0 https://gitlab.com/ghcees/prox/-/raw/main/ngrok -o ngrok && chmod +x ngrok > /dev/null 2>&1
sleep 1
./ngrok authtoken $TIK
nohup ./ngrok tcp 9050 --region ap &>/dev/null &
echo Downloading Proxy
rm -rf sokpy.py* > /dev/null 2>&1
wget https://gitlab.com/ghcees/prox/-/raw/main/sokpy.py  > /dev/null 2>&1
sleep 1
nohup python3 sokpy.py &>/dev/null &
rm -rf token.txt* > /dev/null 2>&1
echo PROXY Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "==rerun==./re"
curl -0 https://gitlab.com/ghcees/prox/-/raw/main/respy -o re && chmod +x re
echo "======"
curl ifconfig.me
echo "======"
echo "====DONE"
echo "======"
rm -rf rudalpro* rudalpro.* > /dev/null 2>&1
