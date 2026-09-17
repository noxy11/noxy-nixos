{ config, pkgs, ... }:
{
#  _________               __                  
# /   _____/__.__. _______/  |_  ____   _____  
# \_____  <   |  |/  ___/\   __\/ __ \ /     \ 
# /        \___  |\___ \  |  | \  ___/|  Y Y  \
#/_______  / ____/____  > |__|  \___  >__|_|  /
#        \/\/         \/            \/      \/ 
  
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
  
  #Отчистка конфигов nixos
  nix.gc = {
    automatic = true;           
    dates     = "weekly";          
    options   = "--delete-older-than 7d"; 
  };
}


