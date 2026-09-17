function nixos-clean --description 'Очистка мусора'
    sudo nix-env --delete-generations old && sudo nix-store --gc && sudo nix-store --optimize $argv
end
