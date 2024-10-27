{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home-manager/desktop/hyprland.nix
  ];

  home.username = "shizu";
  home.homeDirectory = "/home/shizu";

  home.stateVersion = "24.05"; 
  
  home.packages = with pkgs; [

  ];

 
  home.file = {
    
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
