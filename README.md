# noxy-nixos

Привет! Это мой личный репозиторий с модульной конфигурацией операционной системы NixOS и индивидуальными настройками окружения. Здесь собраны мои конфиги для Kitty, Fish и Neovim (NvChad). 

Система построена на базе Nix Flakes. Я принципиально не использую Home Manager, так как предпочитаю управлять конфигурацией приложений напрямую через стандартные файлы настроек. Однако, если вам удобнее использовать Home Manager, вы можете без проблем установить и настроить его самостоятельно поверх этой сборки.

Если вы не хотите устанавливать мои приложения, перед запуском сборки просто откройте файл nixos/modules/software.nix и удалите или закомментируйте ненужные вам пакеты и добавьте свои так как у меня система построенна на niri(noctalia).

> [!WARNING]
> В моей конфигурации по умолчанию включен автозапуск дисплейного менеджера **SDDM** и Wayland-композитора **Niri**. Если вы используете другое графическое окружение (Hyprland, GNOME, KDE и т.д.), обязательно измените эти настройки в файле  `nixos/modules/desktop.nix` перед первой пересборкой, и в файле nixos/modules/users.nix поменяйте название user на свое которое у вас в системе.
> В общем если вы решили установить Nixos, то вы уже чуть знаете основы linux и сможете что то с этим поделать а если вы хотите как я установить окружение niri и установить оболочку noctalia,
> то я думаю что я скоро добавлю конфигурации.


## Repository Structure

```text
~/.dotfiles/
├── config/
│   ├── fastfetch/
│   │   ├── 1.png
│   │   ├── config.jsonc
│   │   ├── NixOS.png
│   │   ├── nixos_snowflake_colorful.svg
│   │   └── nixos_snowflake_rewrite.svg
│   ├── fish/
│   │   ├── config.fish
│   │   ├── nixos-clean.fish
│   │   ├── nixos-optimize.fish
│   │   ├── nixos-update.fish
│   │   ├── nixos-update-git.fish
│   │   ├── nixos-upgrade.fish
│   │   ├── pokemon.fish
│   │   └── y.fish
│   ├── kitty/
│   │   ├── current-theme.conf
│   │   ├── kitty.conf
│   │   ├── mocha.conf
│   │   ├── scroll_mark.py
│   │   ├── search.py
│   │   └── themes/
│   │       └── noctalia.conf
│   └── nvim/
│       ├── .stylua.toml
│       ├── init.lua
│       ├── lazy-lock.json
│       ├── LICENSE
│       ├── README.md
│       └── lua/
│           ├── autocmds.lua
│           ├── chadrc.lua
│           ├── mappings.lua
│           ├── options.lua
│           ├── configs/
│           │   ├── conform.lua
│           │   ├── lazy.lua
│           │   └── lspconfig.lua
│           └── plugins/
│               └── init.lua
├── nixos/
│   ├── modules/
│   │   ├── desktop.nix
│   │   ├── fonts.nix
│   │   ├── localization.nix
│   │   ├── software.nix
│   │   ├── system.nix
│   │   └── users.nix
│   ├── configuration.nix
│   ├── flake.lock
│   └── flake.nix
├── install.fish
└── README.md
```


## Installation

```bash
git clone https://github.com/noxy11/noxy-nixos 
nix-shell -p fish --run "fish ~/.dotfiles/install.fish"
```

## System Maintenance Commands

После установки Fish будут доступны следующие кастомные команды вместо стандартных:

* `nixos-update` — Быстрое применение локальных изменений из `/etc/nixos/` без синхронизации с Git.
* `nixos-update-git` — Полный перенос системных конфигов, настроек приложений, обновление lock-файла и отправка бэкапа на GitHub.
* `nixos-upgrade` — Чистый апгрейд пакетов флейка из официальных репозиториев NixOS.
* `nixos-clean` — Глубокая очистка старых поколений системы и оптимизация хранилища.
