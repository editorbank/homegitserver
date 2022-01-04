:#!/bin/sh
docker-compose down
docker rm homegitserver-container
docker rmi homegitserver-image
