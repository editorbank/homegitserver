if not exist "%USERPROFILE%\.ssh\id_rsa.pub" ssh-keygen -q -t rsa -C homegitserver -N "" -f "%USERPROFILE%\.ssh\id_rsa"
if not exist .\id_rsa.pub if exist "%USERPROFILE%\.ssh\id_rsa.pub" copy "%USERPROFILE%\.ssh\id_rsa.pub" .\
start "homegitserver-service" cmd /k docker-compose up --build ^&^& docker-compose down ^&^& docker rmi homegitserver-image