{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

{
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  options = {
    ags.enable = lib.mkEnableOption "Enable AGS";
  };

  config = lib.mkIf config.ags.enable {
    home.packages = with pkgs; [
      esbuild
      fish
      typescript
      bun
      libnotify
      dart-sass
      fd
      btop
      bluez
      libgtop
      gobject-introspection
      glib
      bluez-tools
      grimblast
      gpu-screen-recorder
      brightnessctl
      gnome-bluetooth
      python3
      matugen

      hyprpicker
      wl-clipboard

      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];

    fonts.fontconfig.enable = true;

    programs.ags = {
      enable = true;

      # null or path, leave as null if you don't want hm to manage the config
      configDir = ./config;
      # configDir = null;

      # additional packages to add to gjs's runtime
      extraPackages = with pkgs; [
        accountsservice
      ];
    };
  };
}
