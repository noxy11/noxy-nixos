{ config, pkgs, ... }:
{
#  _________       _____  __                                 
# /   _____/ _____/ ____\/  |___  _  _______ _______   ____  
# \_____  \ /  _ \   __\\   __\ \/ \/ /\__  \\_  __ \_/ __ \ 
# /        (  <_> )  |   |  |  \     /  / __ \|  | \/\  ___/ 
#/_______  /\____/|__|   |__|   \/\_/  (____  /__|    \___  >
#        \/                                 \/            \/ 
  
#Включаем все пакеты
  nixpkgs.config.allowUnfree = true;
   #Все приложения которые установить в этот масив
   environment.systemPackages = with pkgs; [
     #Система
     wget vim neovim git curl
     trash-cli
     xdg-user-dirs
     networkmanagerapplet
     pavucontrol
     util-linux
     usbutils
     sing-box
     repgrep
     psmisc
     mesa-demos
     radeontop
     nvtopPackages.full
     playerctl
     jq
     bibata-cursors

     #Терменал/Кастомизация
     kitty
     fish
     starship
     fastfetch
     btop
     cmatrix
     cava
     tty-clock
     
     #Wayland/X11
     waybar
     awww
     swaybg
     mako
     swaylock
     xwayland-satellite
     slurp
     grim
     noctalia
     nwg-displays
     hyprpolkitagent
     hyprpicker
     cliphist
     wlsunset
     wl-clipboard
     wl-screenrec
     wl-mirror
     libnotify
     playerctl 
     brightnessctl
     xsetroot
     feh

     #Мои приложения 
     chromium
     librewolf
     nautilus
     spotify
     obsidian
     obs-studio
     vscodium
     mpv
     fuzzel

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
}

