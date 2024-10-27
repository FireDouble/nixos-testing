{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home-manager/hypr/hyprland.nix
    ../../modules/home-manager/ags/ags.nix
  ];
  
  home.username = "shizu";
  home.homeDirectory = "/home/shizu";

  home.stateVersion = "24.05"; 
  
  home.packages = with pkgs; [

  ];

 
  home.file = {
    
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
