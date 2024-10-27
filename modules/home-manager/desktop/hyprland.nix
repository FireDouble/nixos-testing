{ inputs, pkgs, ... }:

let
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    ${pkgs.waybar}/bin/waybar &
    ${pkgs.swww}/bin/swww init $
  
    sleep 1
  
    ${pkgs.swww}/bin/swww img ${./wallpaper.png}
  '';
in
{
  wayland.windowManager.hyprland = {
    enable = true;
  
    settings = {
      exec-once = ''${startupScript}/bin/start'';

      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$menu" = "rofi -show drun";
      
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = "-0.6";
      };
    };
  };
}

