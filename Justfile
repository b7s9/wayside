_:
    just --list

upload:
    rsync --archive --filter=':- ./.gitignore' --exclude=.git ./ lokkij@dev.lokkij.com:campfire
    ssh -t lokkij@dev.lokkij.com "cd campfire && sudo docker compose up --build -d"