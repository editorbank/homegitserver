#!
[ -d ./repo1 ] && rm -rf ./repo1
ssh -p 8822 root@localhost pwd
ssh -p 8822 root@localhost mkrepo /repos/repo1.git
ssh -p 8822 root@localhost mkrepo repo2.git
git clone ssh://root@localhost:8822/repos/repo1.git
if [ -d ./repo1 ] ; then
  cd repo1
  git config user.email ""
  git config user.user $USER
  echo Hello, Home Git server!>readme.md
  git add readme.md && \
  git commit -m "First commit" && \
  git push -u --all
  cd ..
fi
ssh -p 8822 root@localhost lsrepo /repos
ssh -p 8822 root@localhost lsrepo
