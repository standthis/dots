#!/bin/bash
if ! systemctl status docker.service | grep -q 'active (running)'; then
    echo starting docker service
    systemctl start docker.service
    echo docker service is running
fi

#if docker container list | grep -q searx; then
#    echo searx already running
#    echo removing container
#    docker stop searx
#    if docker rm searx; then
#        echo searx container removed
#    fi
#fi
docker rm searx
echo new container from image commencing..

docker run --dns 146.231.129.97 -d --name searx -p $PORT:8888 wonderfall/searx
port=$(nmap localhost -p- | grep '/tcp' | tail -2 | head -1 | awk -F '/' '{print $1}')
url="http://localhost:$port/?q={}"
echo $url
echo -n $url | xc
echo "complete!"
