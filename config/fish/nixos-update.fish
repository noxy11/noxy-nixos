function nixos-update --description 'Копирование конфигов из /etc/nixos в дотфайлы и быстрая локальная сборка'
    # Копируем ТОЛЬКО configuration.nix, игнорируя hardware-configuration
    cp -u /etc/nixos/configuration.nix ~/.dotfiles/nixos/ 2>/dev/null
    
    sudo nixos-rebuild switch --flake "path:/home/noxy/.dotfiles/nixos/#nixos" $argv
end
