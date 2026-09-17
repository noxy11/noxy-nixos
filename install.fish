#!/usr/bin/env fish

echo "==> Install config"

# Проверяем, что репозиторий находится в правильной директории
if not test -d ~/.dotfiles
    echo "[ОШИБКА] Репозиторий должен быть клонирован строго в папку ~/.dotfiles."
    exit 1
end

echo "==> Настройка символических ссылок для системы и приложений..."

# Удаляем стандартную директорию модулей ОС и создаем ссылку на модули из дотфайлов
sudo rm -rf /etc/nixos/modules
sudo ln -s /home/noxy/.dotfiles/nixos/modules /etc/nixos/modules
echo "[УСПЕХ] Символическая ссылка для модулей NixOS успешно создана."

# Проверяем наличие папки конфигурации пользователя
mkdir -p ~/.config

# Полная глубокая очистка окружения Neovim (NvChad) от старого кэша и плагинов
echo "==> Очистка старого кэша и данных Neovim для чистой установки NvChad..."
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

# Пересоздаем ссылки для приложений, чтобы избежать конфликтов конфигурации
rm -rf ~/.config/kitty ~/.config/fastfetch
ln -s ~/.dotfiles/config/nvim ~/.config/nvim
ln -s ~/.dotfiles/config/kitty ~/.config/kitty
ln -s ~/.dotfiles/config/fastfetch ~/.config/fastfetch
echo "[УСПЕХ] Конфигурации приложений (Neovim, Kitty, Fastfetch) успешно привязаны."

# Развертывание кастомных функций и скриптов обслуживания в окружение Fish
mkdir -p ~/.config/fish/functions
ln -sf ~/.dotfiles/config/fish/* ~/.config/fish/functions/
echo "[УСПЕХ] Функции и скрипты обслуживания Fish успешно добавлены."

# Перезаписываем глобальный системный файл конфигурации NixOS
echo "==> Копируем основной configuration.nix в /etc/nixos/..."
sudo cp ~/.dotfiles/nixos/configuration.nix /etc/nixos/configuration.nix

# Подгружаем созданную функцию обновления и запускаем пересборку всей системы
echo "==> Инициализация завершена. Запускаем пересборку через nixos-update..."
source ~/.config/fish/functions/nixos-update.fish
nixos-update
