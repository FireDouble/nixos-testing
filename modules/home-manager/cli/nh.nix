{
  lib,
  config,
  ...
}:

{
  options = {
    nh.enable = lib.mkEnableOption "Enable nh";
  };

  config = lib.mkIf config.nh.enable {
    programs.nh = {
      enable = true;
      flake = "/home/shizu/nixos";
      clean = {
        enable = true;
        extraArgs = "--keep-since 7d --keep 5";
      };
    };
  };
}
