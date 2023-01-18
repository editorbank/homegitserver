#!
[ ! -d ./tmp ] && mkdir ./tmp
[ ! -f ~/.ssh/id_ed25519.pub ] && [ ! -f ~/.ssh/id_rsa.pub ] && ssh-keygen -q -t ed25519 -C $USER -N "" -f ~/.ssh/id_ed25519
[ ! -f ./public_key.tmp ] && [ -f ~/.ssh/id_rsa.pub ] && cp ~/.ssh/id_rsa.pub ./tmp/public_key.tmp
[ ! -f ./public_key.tmp ] && [ -f ~/.ssh/id_ed25519.pub ] && cp ~/.ssh/id_ed25519.pub ./tmp/public_key.tmp
#docker-compose up --build -d
docker build -t homegitserver-image:latest . 
docker run --volume=$(pwd)/git-repos:/repos --volume=/repos -p 8822:22 --name homegitserver-container -d homegitserver-image:latest
