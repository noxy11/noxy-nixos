{ config, pkgs, ... }:
{
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
}

