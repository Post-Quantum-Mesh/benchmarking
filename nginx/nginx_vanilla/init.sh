#!/bin/sh

# Run from CWD using "./init_vanilla.sh"

# Build image
sudo docker build -t nginx-vanilla .


# Create network
#sudo docker network create test_net

# Run container
sudo docker run --network host --cpus="8.0" --name nginx-vanilla -d nginx-vanilla