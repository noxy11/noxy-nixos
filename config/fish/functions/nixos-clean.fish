function nixos-clean --description 'Отчистка системы от мусора/старых покалений'
    # 1. Удаляем старые системные поколения 
    sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations old
    
    # 2. Очищаем старые поколения пользователя
    nix-env --delete-generations old
    
    # 3. Удаляем мусор
    sudo nix-store --gc
    
    # 4. Оптимизируем хранилище
    sudo nix-store --optimize $argv
end

