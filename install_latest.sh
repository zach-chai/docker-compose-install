LATEST="$(curl -sL https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d'"' -f4)"
wget -qO- https://get.docker.com/ | sh
curl -L https://github.com/docker/compose/releases/download/${LATEST}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
