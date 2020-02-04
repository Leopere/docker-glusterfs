#!/usr/bin/env bash
function peer_enum() {
  wc -l < /config/hosts
}

function brick_list() {
  for read PEER; do
    # echo "Adding $PEER to brick list."
    # echo "PEER_LIST currently contains:"
    # echo $PEER_LIST
    export PEER_LIST="$PEER:/data/brick1 $PEER_LIST"
    # echo "Peer list now reads:"
    # echo $PEER_LIST
  done
}

function peer_mode() {
  case $2 in
    replica )
      echo replica
      ;;
    stripe )
      echo stripe
      ;;
    * )
      echo $2 is not a valid peering mode for this container your choices are replica and stripe only.
      ;;
  esac
}

function peer_up() {
  # $ docker-compose up -d
  # $ docker-compose exec gs1 bash
  gluster peer probe gs1
  gluster volume create gv0 $(peer_mode) $(peer_enum) transport tcp $(peer_list) force
  gluster volume start gv0
  # mount gs1:/gv0 /mnt
  # date > /mnt/example.file
}

case $1 in
  peer-up )
    peer_up
    ;;
  * )
    bash
    ;;
esac
