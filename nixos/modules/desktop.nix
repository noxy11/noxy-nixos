{ config, pkgs, ... }:
{
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
}

