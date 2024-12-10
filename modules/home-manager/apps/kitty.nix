{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    kitty.enable = lib.mkEnableOption "Enable Kitty";
  };

  config = lib.mkIf config.kitty.enable {
    home.packages = with pkgs; [
      kitty
    ];

    programs.kitty = {
      enable = true;
      themeFile = "Catppuccin-Mocha";
    };
  };
}
