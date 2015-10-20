#!/bin/bash

if [ "$(whoami)" != "root" ]; then
  echo "Script requires root priviliges"
  exit 1
fi

if type "docker-compose" > /dev/null; then
  echo "uninstalling compose..."
  rm /usr/local/bin/docker-compose
fi

echo "Finished."
