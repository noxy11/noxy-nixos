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
}

