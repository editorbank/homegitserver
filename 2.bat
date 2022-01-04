if exist .\repo1 rd /S /Q .\repo1
ssh -p 8822 git@localhost ls -lA /git/repos/
ssh -p 8822 git@localhost git init --bare /git/repos/repo1.git
git clone ssh://git@localhost:8822/git/repos/repo1.git
if exist ./repo1 (
  cd repo1
  echo Hello, Home Git server!>readme.md
  git add readme.md && ^
  git commit -m "First commit" && ^
  git push -u --all
  cd ..
)
ssh -p 8822 git@localhost ls -lA /git/repos/
