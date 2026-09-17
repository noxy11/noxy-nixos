{ config, pkgs, ... }:
{
#  _________               __                  
# /   _____/__.__. _______/  |_  ____   _____  
# \_____  <   |  |/  ___/\   __\/ __ \ /     \ 
# /        \___  |\___ \  |  | \  ___/|  Y Y  \
#/_______  / ____/____  > |__|  \___  >__|_|  /
#        \/\/         \/            \/      \/ 

  #Берет конфигурацию железа
  imports =
    [
      ./hardware-configuration.nix
    ];
  
  #Добавляет flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  #Настройка системного загрузчика
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  #Версия ядра
  boot.kernelPackages = pkgs.linuxPackages_latest;
  
  #Настройка сети
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;


#  .____                        .__  .__                __  .__               
#|    |    ____   ____ _____  |  | |__|____________ _/  |_|__| ____   ____  
#|    |   /  _ \_/ ___\\__  \ |  | |  \___   /\__  \\   __\  |/  _ \ /    \ 
#|    |__(  <_> )  \___ / __ \|  |_|  |/    /  / __ \|  | |  (  <_> )   |  \
#|_______ \____/ \___  >____  /____/__/_____ \(____  /__| |__|\____/|___|  /
#        \/          \/     \/              \/     \/                    \/ 
  #Время/нахождение
  time.timeZone = "Asia/Krasnoyarsk";
  
  #Основной язык системы
  i18n.defaultLocale = "ru_RU.UTF-8";

  #Генерация настроек под русский язык
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  #Раскладка
  services.xserver.xkb = {
    layout = "us,ru";
    variant = "";
    options = "alt_shift_toggle";
  };


#___________                     __          
#\_   _____/___   ____   _______/  |_  ______
# |    __)/  _ \ /    \ /  ___/\   __\/  ___/
# |     \(  <_> )   |  \\___ \  |  |  \___ \ 
# \___  / \____/|___|  /____  > |__| /____  >
#     \/             \/     \/            \/ 
  
  #Шрифты
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.hack
    nerd-fonts.iosevka
    nerd-fonts.meslo-lg
    nerd-fonts.mononoki
    nerd-fonts.sauce-code-pro
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "JetBrainsMono Nerd Font Bold" ];
      sansSerif = [ "Noto Sans Bold" ];
      serif     = [ "Noto Serif Bold" ];
    };
  };


#  _________       _____  __                                 
# /   _____/ _____/ ____\/  |___  _  _______ _______   ____  
# \_____  \ /  _ \   __\\   __\ \/ \/ /\__  \\_  __ \_/ __ \ 
# /        (  <_> )  |   |  |  \     /  / __ \|  | \/\  ___/ 
#/_______  /\____/|__|   |__|   \/\_/  (____  /__|    \___  >
#        \/                                 \/            \/ 

  #Включаем все пакеты
  nixpkgs.config.allowUnfree = true;
   environment.systemPackages = with pkgs; [
     #Система
     wget vim neovim git curl
     trash-cli
     xdg-user-dirs
     wl-clipboard
     networkmanagerapplet
     pavucontrol
     util-linux
     usbutils
     sing-box
     repgrep
     
     #Терменал/Кастомизация
     kitty
     fish
     starship
     fastfetch
     btop
     cmatrix
     cava

     #Wayland/Система
     waybar
     awww
     swaybg
     fuzzel
     mako
     swaylock
     xwayland-satellite
     slurp
     grim
     noctalia

     #Мои приложения 
     chromium
     librewolf
     nautilus
     spotify
     obsidian
     obs-studio
     vscodium
     mpv

     #Компиляторы
     cmake gcc clang llvm
     tree-sitter
     python3 nodejs
     rustc cargo go
     ruby php perl
     ocaml swift
     
     #Библиотеки
     librsvg
     adwaita-icon-theme
     xdg-utils
   ];


#____ ___                           
#|    |   \______ ___________  ______
#|    |   /  ___// __ \_  __ \/  ___/
#|    |  /\___ \\  ___/|  | \/\___ \ 
#|______//____  >\___  >__|  /____  >
#             \/     \/           \/ 
  
  #Конфигурация users
  users.users."noxy" = {
    isNormalUser = true;
    description = "noxy";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

 
#________                 __      __                 
#\______ \   ____   _____|  | ___/  |_  ____ ______  
# |    |  \_/ __ \ /  ___/  |/ /\   __\/  _ \\____ \ 
# |    `   \  ___/ \___ \|    <  |  | (  <_> )  |_> >
#/_______  /\___  >____  >__|_ \ |__|  \____/|   __/ 
#        \/     \/     \/     \/             |__|    

  #Включаем niri
  programs.niri.enable = true;

  #Включаем shell терменала fish
  programs.fish.enable = true;
  
  #Подлючаем недостающие библиотеки nautilus
  services.gvfs.enable = true;
  services.dbus.enable = true;

  #Дисплейный менеджер sddm
  services.xserver.enable = true;
  services.displayManager.sddm = {
    enable = true;
  };

  #Порталы gnome для коректной работы приложений
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };

  #Звуковая система pipewire
  services.pipewire = {
    enable       = true;
    audio.enable = true;
    pulse.enable = true; 
    jack.enable  = true; 
    alsa = {
      enable       = true;
      support32Bit = true; 
    };
  };

  #Отчистка конфигов nixos
  nix.gc = {
    automatic = true;           
    dates     = "weekly";          
    options   = "--delete-older-than 7d"; 
  };
  
  #Версия nixos
  system.stateVersion = "26.05";
}
