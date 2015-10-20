#!/bin/bash

if ! type "wget" > /dev/null; then
  echo "Script needs wget work"
  exit 1
fi

if [ "$(whoami)" != "root" ]; then
	echo "Script requires root priviliges"
	exit 1
fi

if ! type "docker" > /dev/null; then
  echo "Installing Docker..."
  wget -qO- https://get.docker.com/ | sh
  usermod -a -G docker $(whoami)
fi

if ! type "docker-compose" > /dev/null; then
	echo "Installing Docker Compose..."
  LATEST="$(wget -qO- https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d'"' -f4)"
  wget -q https://github.com/docker/compose/releases/download/${LATEST}/docker-compose-`uname -s`-`uname -m`
  mv docker-compose-`uname -s`-`uname -m` /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
fi

echo "Finished."
