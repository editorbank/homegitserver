#!
[ ! -d ./tmp ] && mkdir ./tmp
cd ./tmp
#docker export homegitserver-container -o homegitserver-container.tar
#docker export homegitserver-container | tar -xf - --wildcards repos/* && ls -lA ./repos
docker run --rm --volumes-from homegitserver-container -v $PWD:/pwd alpine tar cvf /pwd/repos.$RANDOM.tar /repos
