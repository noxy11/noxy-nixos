function nixos-update-git --description 'Полная синхронизация системы, программ и отправка на GitHub'
    # Копируем ТОЛЬКО configuration.nix
    cp -u /etc/nixos/configuration.nix ~/.dotfiles/nixos/ 2>/dev/null

    # Копируем настройки приложений
    rsync -av --delete --exclude='.git' ~/.config/nvim/ ~/.dotfiles/config/nvim/ 2>/dev/null
    rsync -av --delete ~/.config/fastfetch/ ~/.dotfiles/config/fastfetch/ 2>/dev/null
    rsync -av --delete --exclude='themes' ~/.config/kitty/ ~/.dotfiles/config/kitty/ 2>/dev/null
    
    # Копируем функции Fish
    mkdir -p ~/.dotfiles/config/fish
    cp -u ~/.config/fish/*.fish ~/.dotfiles/config/fish/ 2>/dev/null
    cp -u ~/.config/fish/functions/*.fish ~/.dotfiles/config/fish/ 2>/dev/null

    # Цепочка Git с умным слиянием (стратегия 'ours' отдает приоритет локальным конфигам)
    cd ~/.dotfiles
    git add -A
    git stash
    git pull origin main --rebase -X ours
    git stash pop
    git add -A
    nix flake update --flake ~/.dotfiles/nixos/ 2>/dev/null
    git add -A
    sudo nixos-rebuild switch --flake "path:/home/noxy/.dotfiles/nixos/#nixos"
    git commit -m 'chore: auto-sync all configs and modules' --allow-empty
    git push origin main $argv
end
