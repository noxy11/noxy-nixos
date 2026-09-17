function nixos-upgrade --description 'Чистый апгрейд системы без Git'
    cd ~/.dotfiles && nix flake update && sudo nixos-rebuild switch --flake ~/.dotfiles#nixos $argv
end
