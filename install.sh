#!/bin/bash
#用户输入
echo
read -p "输入你的sspanel_url:" sspanelurl
echo
echo "-----$sspanelurl-----"
echo
read -p "输入你的mukey：" mukey
echo
echo "-----$mukey-----"
echo
read -p "输入你node_id：" myid
echo
echo "-----$myid-----"
echo
read -p "输入你的api端口：" myapiport 
echo
echo "-----$myapiport-----"
mkdir v2;mv v2
#安装docker
curl -sSL https://get.docker.com | bash
service docker restart
systemctl enable docker
curl -L https://github.com/docker/compose/releases/download/1.17.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
curl -L https://raw.githubusercontent.com/docker/compose/1.8.0/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose
clear
wget -L https://raw.githubusercontent.com/961644045/ricotest/master/docker-compose.yml
sed -i "s/sspanel_url:.*/sspanel_url: \"${sspanelurl}\"/"  ./docker-compose.yml
sed -i "s/key:.*/key: '$mukey'/g" ./docker-compose.yml
sed -i "s/node_id:.*/node_id: $myid/g" ./docker-compose.yml
sed -i "s/api_port:.*/api_port: $myapiport/g" ./docker-compose.yml
docker-compose up -d
#rm -rf ./*
clear
docker ps
