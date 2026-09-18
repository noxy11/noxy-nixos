function nixos-update --description 'Быстрая локальная сборка'
    mkdir -p /home/noxy/.dotfiles/nixos/modules
    cp -u /etc/nixos/configuration.nix /home/noxy/.dotfiles/nixos/ 2>/dev/null
    cp -ru /etc/nixos/modules/. /home/noxy/.dotfiles/nixos/modules/ 2>/dev/null
    sudo nixos-rebuild switch --flake "path:/home/noxy/.dotfiles/nixos/#nixos" --impure $argv
end
