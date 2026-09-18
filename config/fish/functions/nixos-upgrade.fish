function nixos-upgrade --description 'update flake inputs and rebuild nixos'
    nix flake update --flake /home/noxy/.dotfiles/nixos/
    sudo nixos-rebuild switch --flake "path:/home/noxy/.dotfiles/nixos/#nixos" --impure $argv
end

