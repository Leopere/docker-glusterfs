# GlusterFS in Docker container

A Fedora based docker container running GlusterFS daemon.  This container is just a quick way to spin up a simple TCP mode only GlusterFS mount on a number of nodes quickly with Docker.

# Versions

- latest -> 7.2

## Documentation inbound

As this is heavily a WIP container I'm not going to certify it's use by giving any real documentation however I am planning on a `./config.sh` script to do some of the prep work for you and my scope and goal here is to just start off with simple volume based gluster bricks.

## Scope

Since Version 7.2 is the one that currently contains the functionality that is the most up to date against the official documentation and also includes things like dispersed storage which will be the best use case for my personal needs I will be proceeding down the path of just a very purpose build Dockerfile and docker-compose.yml stack with the eventual goal of getting a docker-swarm capable system.

<!-- # Usage [Non-Swarm]

## Step One
Get the repository on all of your planned nodes.
```
git clone git@github.com:Leopere/docker-glusterfs.git
```

## Step Two
Modify your hosts to have the exact hosts you plan on having in your GlusterFS peer list.

### on node1.EXAMPLE.COM -->
