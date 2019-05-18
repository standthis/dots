if ! systemctl status docker.service | grep -q 'active (running)'; then
    echo starting docker service
    systemctl start docker.service
fi

if docker ps | grep -q searx; then
    echo searx already running
    echo exiting
    exit
fi

docker run --dns 146.231.129.97 -d --name searx -p $PORT:8888 wonderfall/searx
port=$(nmap localhost -p- | grep sometimes | awk -F '/' '{print $1}')
url=http://localhost:$port/?q={}
echo $url
echo -n $url | xc
