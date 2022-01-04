#!/bin/sh
[ ! -f ~/.ssh/id_rsa.pub ] && ssh-keygen -q -t ed25519 -C homegitserver -N "" -f ~/.ssh/id_rsa
[ ! -f ./id_rsa.pub ] && cp ~/.ssh/id_rsa.pub ./
docker-compose up --build