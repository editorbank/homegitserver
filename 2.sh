#!
[ -d ./repo1 ] && rm -rf ./repo1
ssh -p 8822 git@localhost pwd
ssh -p 8822 git@localhost mkrepo repos/repo1.git
git clone ssh://git@localhost:8822/~/repos/repo1.git
if [ -d ./repo1 ] ; then
  cd repo1
  echo Hello, Home Git server!>readme.md
  git add readme.md && \
  git commit -m "First commit" && \
  git push -u --all
  cd ..
fi
ssh -p 8822 git@localhost lsrepo repos
