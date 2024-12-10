{ lib, config, pkgs, ... }:

{
  options = {
    fish.enable = lib.mkEnableOption "Enable fish config";
  };

  config = lib.mkIf config.fish.enable {
    programs.fish = {
      enable = true;
    };
  };
}
