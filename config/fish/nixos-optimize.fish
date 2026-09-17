function nixos-optimize --description 'Оптимизация'
    sudo nix-store --optimize $argv
end
