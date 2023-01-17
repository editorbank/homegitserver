#!
[ ! -f ~/.ssh/id_ed25519.pub ] && ssh-keygen -q -t ed25519 -C $USER -N "" -f ~/.ssh/id_ed25519
[ ! -f ./public_key.tmp ] && cp ~/.ssh/id_ed25519.pub ./public_key.tmp
docker-compose up --build -d
#docker build -t homegitserver-image:latest . 
#docker run --volume=./git-repos:/git/repos --volume=/git/repos -p 8822:22 --name homegitserver-container -d homegitserver-image:latest