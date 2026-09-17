{ ... }:
{
  imports =
    [ 
      #Импорт конфигурации железа
      /etc/nixos/hardware-configuration.nix

      #Система разделенна на модули
      ./modules/system.nix #Flakes/kernel/boot/network
      ./modules/localization.nix #Языки/местонахождение/раскладка
      ./modules/fonts.nix #Шрифты
      ./modules/software.nix #Приложения
      ./modules/users.nix #Конфигурация users системы
      ./modules/desktop.nix #Niri/shell/sddm/pipewire/порталы
    ];
  
  #Версия системы
  system.stateVersion = "26.05";
}

