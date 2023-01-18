# Home Git Server

## 1. Create and run Docker container
Create or copy yuor public key in to file ./id_ed25519.pub.
Use ED25519 algorithm, for Windows:
```
ssh-keygen -q -t ed25519 -C %USERNAME% -N "" -f "%USERPROFILE%\.ssh\id_ed25519"
```
for Linux:
```
ssh-keygen -q -t ed25519 -C $USER -N "" -f ~/.ssh/id_ed25519
```

Run for build image and run container:
```
docker-compose up --build -d
```
Connect to container by root:
```
docker exec -it homegitserver-container /bin/sh
```


## 2. Testing of Git server
Open other terminal window.

Reset host for first connect in file known_hosts, use:
```
ssh-keygen -R [localhost]:8822
```
Otherwise, errors may occur:
```
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that a host key has just been changed.
The fingerprint for the RSA key sent by the remote host is
SHA256:02xN0mD6Xd0XXIjZjRkUBIapKMXjeVW5HVy5StxzYMk.
Please contact your system administrator.
Add correct host key in /c/Users/user1/.ssh/known_hosts to get rid of this message.
Offending RSA key in /c/Users/user1/.ssh/known_hosts:4
RSA host key for [localhost]:8822 has changed and you have requested strict checking.
Host key verification failed. 
```
View repository list on Git-server
```
ssh -p 8822 git@localhost ls -lA /git/repos/
```
Create new repository
```
ssh -p 8822 git@localhost git init --bare /git/repos/repo1.git
```
Clone new repository in to local folder and test works.
```
git clone ssh://git@localhost:8822/git/repos/repo1.git
cd repo1
echo Hello, Home Git server!>readme.md
git add readme.md
git commit -m "First commit"
git push -u --all
cd ..
```

## 3. Export repository from container
The `/repos` folder in the container will be mapped to the local folder `./git-repos` and it can be backuped in any convenient way.

If the volume attachment is not used, the repositories can be exported from the image.
```
docker export homegitserver-container | tar -xf - --wildcards repos/*
```

## 4. Clean
```
 docker rm -f homegitserver-container
 docker rmi -f homegitserver-image
```

## Links
* [https://habr.com/ru/company/ruvds/blog/359216/]
* [http://cccp-blog.com/koding/sozdayom-git-server-svoimi-rukami]
* [https://lumpics.ru/installation-ssh-server-in-ubuntu/]
* [https://www.garron.me/en/linux/sshd-no-hostkeys-available-exiting.html]
* [https://www.openssh.com/txt/release-8.8]
