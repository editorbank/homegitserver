if not exist "%USERPROFILE%\.ssh\id_ed25519.pub" ssh-keygen -q -t ed25519 -C homegitserver -N "" -f "%USERPROFILE%\.ssh\id_ed25519"
if not exist .\public_key.tmp if exist "%USERPROFILE%\.ssh\id_ed25519.pub" copy "%USERPROFILE%\.ssh\id_ed25519.pub" .\public_key.tmp
docker-compose up --build -d