#!/usr/bin/env

## Function declarations.
function host-get() {
  read -p "Enter Friendly Name [node1.example.com]: " HUMAN_READABLE
  read -p "Enter network IP Address [10.0.0.1]: " IP_ADDRESS
}

function add-host() {
  read -r -p "Add more bricks[hosts]? [y/N] " response
  response=${response,,}    # tolower
  if [[ "$response" =~ ^(yes|y)$ ]]; then
    host-get
    echo "$IP_ADDRESS    $HUMAN_READABLE" > ./persist/config/hosts
    add-host
  fi
}

function secure-access() {
  read -r -p "Would you like me to enable secure-access? [y/N] " response
  response=${response,,}    # tolower
  if [[ "$response" =~ ^(yes|y)$ ]]; then
    touch ./persist/config/secure-access
    echo "Do note that you will still have to uncomment the volume line in the \n
    included docker-compose.yml so that you enable the secure-access volume mount."
  fi
}

function create-dirs() {
  read -r -p "Would you like me to create a docker-compose.yml default configuration compatible directory structure? [y/N] " response
  response=${response,,}    # tolower
  if [[ "$response" =~ ^(yes|y)$ ]]; then
    mkdir -p ./persist/config ./persist/data
  fi
}

## actual work time.
echo "First thing I'm going to do is ask you if you wish to have some default \n
      configurations set that will work correctly with the shipped docker-compose.yml file"
echo ""
echo ""
echo "Disclaimer:"
echo "This script is not designed to account for every way you could mess up so think logically when asked questions."

create-dirs
secure-access
add-host
