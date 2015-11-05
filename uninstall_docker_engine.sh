#!/bin/bash

if [ "$(whoami)" != "root" ]; then
  echo "Script requires root priviliges"
  exit 1
fi

if type "apt-get" > /dev/null; then
  $(apt-get autoremove --purge docker-engine)
elif type "dnf" > /dev/null; then
  $(dnf -y remove docker-engine.x86_64)
elif type "yum" > /dev/null; then
  $(yum -y remove docker-engine.x86_64)
else
  echo "package manager not supported"
  exit 1
fi

echo "Finished."
