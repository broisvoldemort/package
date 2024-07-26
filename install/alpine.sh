#!/bin/sh

echo Installing requirements...
apk add --no-cache wget bash

wget -O /usr/local/bin/package https://github.com/broisvoldemort/package/raw/main/scripts/alpine/package.sh
if [ $? -eq 0 ]; then
  chmod +x /usr/local/bin/package
  echo "Installed successfully."
else
  echo "Failed to download the package script."
  exit 1
fi

rm -f "$0"
