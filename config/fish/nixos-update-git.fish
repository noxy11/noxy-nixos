function nixos-update-git --description 'Синхронизация NixOS и конфигов программ с GitHub'
    # 1. Создаем правильную структуру папок в репозитории
    mkdir -p ~/.dotfiles/nixos
    mkdir -p ~/.dotfiles/config/nvim
    mkdir -p ~/.dotfiles/config/fastfetch
    mkdir -p ~/.dotfiles/config/kitty
    mkdir -p ~/.dotfiles/config/fish

    # 2. Копируем файлы NixOS
    cp -u /etc/nixos/*.nix ~/.dotfiles/nixos/

    # 3. Безопасно копируем конфиги программ (только файлы, игнорируя папки-ссылки)
    cp -u ~/.config/nvim/*.nix ~/.config/nvim/*.lua ~/.config/nvim/*.json ~/.dotfiles/config/nvim/ 2>/dev/null
    cp -u ~/.config/fastfetch/* ~/.dotfiles/config/fastfetch/ 2>/dev/null
    cp -u ~/.config/kitty/* ~/.dotfiles/config/kitty/ 2>/dev/null
    cp -u ~/.config/fish/*.fish ~/.dotfiles/config/fish/ 2>/dev/null
    cp -u ~/.config/fish/functions/*.fish ~/.dotfiles/config/fish/ 2>/dev/null

    # 4. Переходим в репозиторий и запускаем твою рабочую Git-цепочку
    cd ~/.dotfiles
    git add -A
    git stash
    git pull origin main --rebase
    git stash pop
    git add -A
    nix flake update
    git add -A
    sudo nixos-rebuild switch --flake ~/.dotfiles/nixos/#nixos
    git commit -m 'chore: auto-sync all configs and modules' --allow-empty
    git push origin main $argv
end
