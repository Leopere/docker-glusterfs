# GlusterFS in Docker container

A Centos based docker container running GlusterFS daemon.  This container is just a quick way to spin up a simple TCP mode only GlusterFS mount on a number of nodes quickly with Docker.

# Versions

- latest -> 3.8.1
<!-- - 3.8
- 3.7, 3.7.1
- 3.6, 3.6.1 -->


# Usage [Non-Swarm]

## Step One
Get the repository on all of your planned nodes.
```
git clone git@github.com:Leopere/docker-glusterfs.git
```

## Step Two
Modify your hosts to have the exact hosts you plan on having in your GlusterFS peer list.

### on node1.EXAMPLE.COM
