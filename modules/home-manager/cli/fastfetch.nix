{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    fastfetch.enable = lib.mkEnableOption "Enable FastFetch";
  };

  config = lib.mkIf config.fastfetch.enable {
    home.packages = with pkgs; [
      fastfetch
    ];

    programs.fastfetch = {
      enable = true;

      settings = {
        logo = {
          padding = {
            top = 2;
          };
          type = "small";
        };
        modules = [
          "break"
          {
            type = "title";
            keyWidth = 10;
            format = "         {6}{7}{8}";
          }
          {
            type = "custom";
            format = " ─────────────────────────── ";
          }
          {
            type = "kernel";
            key = " ";
            keyColor = "yellow";
          }
          {
            type = "wm";
            key = " ";
            keyColor = "blue";
          }
          {
            type = "shell";
            key = " ";
            keyColor = "yellow";
          }
          {
            type = "terminal";
            key = "";
            keyColor = "blue";
          }
          {
            type = "memory";
            key = "󰍛 ";
            keyColor = "magenta";
            format = "{1} / {2}";
          }
          {
            type = "uptime";
            key = "󰍛 ";
            keyColor = "green";
          }
          {
            type = "custom";
            format = " ─────────────────────────── ";
          }
          "break"
        ];
      };
    };
  };
}
