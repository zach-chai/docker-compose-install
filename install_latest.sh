#!/bin/bash
if type "wget" > /dev/null; then
  LATEST="$(wget -qO- https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d'"' -f4)"
  wget -qO- https://get.docker.com/ | sh
  wget -q https://github.com/docker/compose/releases/download/${LATEST}/docker-compose-`uname -s`-`uname -m`
  mv docker-compose-`uname -s`-`uname -m` /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
else
  echo "Script needs wget work"
fi
