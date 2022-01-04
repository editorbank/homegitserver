# Home Git Server

## 1. Create and run Docker container
Create or copy yuor public key in to file ./id_rsa.pub, and run:
```
docker-compose up --build
```
Connect to container by root:
```
docker exec -it homegitserver-container /bin/bash
```

## 2. Testing of Git server
Open other terminal window.
View repository list on Git-server
```
ssh -p 8822 git@localhost ls -lA
```
Create new repository
```
ssh -p 8822 git@localhost git init --bare repo1.git
```
Clone new repository in to local folder and test works.
```
git clone ssh://git@localhost:8822/~/repo1.git
cd repo1
echo Hello, Home Git server!>readme.md
git add readme.md
git commit -m "First commit"
git push -u --all
cd ..
```

## 3. Export repository from container
Export all container to tar archive
```
docker export -o homegitserver-container.tar homegitserver-container
```
or git home dir only
```
docker export homegitserver-container | tar -xf - --wildcards git/*
```

## 4. Clean
```
 docker-compose down
 docker rm homegitserver-container
 docker rmi homegitserver-image
```

## Links
* [https://habr.com/ru/company/ruvds/blog/359216/]
* [http://cccp-blog.com/koding/sozdayom-git-server-svoimi-rukami]
* [https://lumpics.ru/installation-ssh-server-in-ubuntu/]
* [https://www.garron.me/en/linux/sshd-no-hostkeys-available-exiting.html]
* [https://www.openssh.com/txt/release-8.8]
