if exist .\repo1 rd /S /Q .\repo1
ssh -p 8822 git@localhost ls -lA
ssh -p 8822 git@localhost git init --bare repo1.git
git clone ssh://git@localhost:8822/~/repo1.git
cd repo1
echo Hello, Home Git server!>readme.md
git add readme.md
git commit -m "First commit"
git push -u --all
cd ..
ssh -p 8822 git@localhost ls -lA
