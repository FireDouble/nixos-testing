{ lib, config, ... }:

{
  options = {
    fish.enable = lib.mkEnableOption "Enable fish config";
  };

  config = lib.mkIf config.fish.enable {
    programs.fish = {
      enable = true;

      functions = {
        nt = "sudo nixos-rebuild test --flake $argv";
        ns = "sudo nixos-rebuild switch --flake $argv";
      };
    };
  };
}
