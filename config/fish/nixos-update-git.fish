function nixos-update-git --description 'Синхронизация NixOS и конфигов программ с GitHub'
    # 1. Создаем структуру папок
    mkdir -p ~/.dotfiles/nixos/modules
    mkdir -p ~/.dotfiles/config

    # 2. Копируем файлы конфигурации из /etc/nixos
    cp -u /etc/nixos/*.nix ~/.dotfiles/nixos/ 2>/dev/null

    # 3. Копируем папки настроек программ
    rsync -av --delete --exclude='.git' ~/.config/nvim/ ~/.dotfiles/config/nvim/ 2>/dev/null
    rsync -av --delete ~/.config/fastfetch/ ~/.dotfiles/config/fastfetch/ 2>/dev/null
    rsync -av --delete --exclude='themes' ~/.config/kitty/ ~/.dotfiles/config/kitty/ 2>/dev/null
    
    # 4. Копируем скрипты Fish
    mkdir -p ~/.dotfiles/config/fish
    cp -u ~/.config/fish/*.fish ~/.dotfiles/config/fish/ 2>/dev/null
    cp -u ~/.config/fish/functions/*.fish ~/.dotfiles/config/fish/ 2>/dev/null

    # 5. Git-цепочка и сборка без предупреждений
    cd ~/.dotfiles
    git add -A
    git stash
    git pull origin main --rebase
    git stash pop
    git add -A
    nix flake update --flake ~/.dotfiles/nixos/ 2>/dev/null
    git add -A
    sudo nixos-rebuild switch --flake ~/.dotfiles/nixos/#nixos --impure
    git commit -m 'chore: auto-sync all configs and modules' --allow-empty
    git push origin main $argv
end
