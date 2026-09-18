function nixos-update-git --description 'Полная синхронизация и GitHub'
    echo '1. Копирование системных конфигов...'
    mkdir -p /home/noxy/.dotfiles/nixos/modules
    cp -u /etc/nixos/configuration.nix /home/noxy/.dotfiles/nixos/ 2>/dev/null
    cp -ru /etc/nixos/modules/. /home/noxy/.dotfiles/nixos/modules/ 2>/dev/null

    echo '2. Синхронизация конфигов софта...'
    rsync -av --delete --exclude='.git' ~/.config/nvim/ /home/noxy/.dotfiles/config/nvim/ 2>/dev/null
    rsync -av --delete /home/noxy/.config/fastfetch/ /home/noxy/.dotfiles/config/fastfetch/ 2>/dev/null
    rsync -av --delete --exclude='themes' ~/.config/kitty/ /home/noxy/.dotfiles/config/kitty/ 2>/dev/null
    
    mkdir -p /home/noxy/.dotfiles/config/fish/functions
    cp -u ~/.config/fish/*.fish /home/noxy/.dotfiles/config/fish/ 2>/dev/null
    cp -u ~/.config/fish/functions/*.fish /home/noxy/.dotfiles/config/fish/functions/ 2>/dev/null

    echo '3. Синхронизация Git...'
    git -C /home/noxy/.dotfiles add -A
    git -C /home/noxy/.dotfiles stash
    git -C /home/noxy/.dotfiles pull origin main --rebase -X ours
    git -C /home/noxy/.dotfiles stash pop
    nix flake update --flake /home/noxy/.dotfiles/nixos/
    git -C /home/noxy/.dotfiles add -A

    echo '4. Запуск сборки NixOS...'
    sudo nixos-rebuild switch --flake "path:/home/noxy/.dotfiles/nixos/#nixos" --impure $argv

    echo '5. Отправка на GitHub...'
    git -C /home/noxy/.dotfiles commit -m 'auto-update' --allow-empty
    git -C /home/noxy/.dotfiles push origin main
    echo 'Готово.'
end
