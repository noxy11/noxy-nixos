{ config, pkgs, ... }:
{
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
}

