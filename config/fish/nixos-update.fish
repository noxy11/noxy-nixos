function nixos-update --description 'Просто применить систему из дотфайлов'
    sudo nixos-rebuild switch --flake ~/.dotfiles#nixos $argv
end
