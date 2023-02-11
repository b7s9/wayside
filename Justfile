_:
    just --list

upload:
    rsync --archive --filter=':- ./.gitignore' --exclude=.git ./ lokkij@dev.lokkij.com:wayside
    ssh -t lokkij@dev.lokkij.com "cd wayside && sudo docker compose up --build -d"