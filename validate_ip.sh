#!/bin/bash

# Function to validate IP address
validate_ip() {
  local  ip=$1
  local  stat=1

  if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    OIFS=$IFS
    IFS='.'
    ip=($ip)
    IFS=$OIFS
    [[ ${ip[0]} -le 255 && ${ip[1]} -le 255 && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
    stat=$?
  fi
  return $stat
}

# Get IP address from the user
echo "Enter an IP address: "
read ip

# Validate the IP address
if validate_ip $ip; then
  echo -e "\033[31m Valid IP address \033[0m"
else
  echo -e "\033[31m Invalid IP address \033[0m"
fi

