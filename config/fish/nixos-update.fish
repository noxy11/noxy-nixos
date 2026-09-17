function nixos-update --description 'Копирование конфигов из /etc/nixos в дотфайлы и быстрая локальная сборка'
    # Копируем измененные файлы конфигурации системы в репозиторий
    cp -u /etc/nixos/*.nix ~/.dotfiles/nixos/ 2>/dev/null
    
    # Применяем сборку по чистому пути без варнингов
    sudo nixos-rebuild switch --flake "path:/home/noxy/.dotfiles/nixos/#nixos" $argv
end
