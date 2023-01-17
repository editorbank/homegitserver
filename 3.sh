#!
docker export homegitserver-container -o homegitserver-container.tar
docker export homegitserver-container | tar -xf - --wildcards home/git/* && ls -lA ./home/git
