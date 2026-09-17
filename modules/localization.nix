{ config, pkgs, ... }:
{
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
}

