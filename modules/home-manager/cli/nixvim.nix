{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  options = {
    nixvim.enable = lib.mkEnableOption "Enable NixVim";
  };

  config = lib.mkIf config.nixvim.enable {
    home.packages = with pkgs; [
      nixd
    ];

    nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

    programs.nixvim = {
      enable = true;

      colorschemes.catppuccin.enable = true;

      keymaps = [
        {
          action = "<cmd>Oil<CR>";
          key = "m";
        }
        {
          action = "<cmd>Oil .<CR>";
          key = "<C-m>";
        }
      ];

      plugins = {
        lsp = {
          enable = true;
          servers = {
            nixd.enable = true;
          };
        };

        arrow.enable = true;
        auto-session.enable = true;
        autoclose.enable = true;
        blink-cmp.enable = true;
        ccc.enable = true;
        comment.enable = true;
        fugitive.enable = true;
        gitignore.enable = true;
        guess-indent.enable = true;
        hardtime.enable = true;
        lualine.enable = true;
        lz-n.enable = true;
        neoclip.enable = true;
        neogit.enable = true;
        nix.enable = true;
        oil.enable = true;
        precognition.enable = true;
        telescope.enable = true;
        treesitter.enable = true;
        trim.enable = true;
        trouble.enable = true;
        vim-surround.enable = true;
        web-devicons.enable = true;
        which-key.enable = true;
        wilder.enable = true;
        wtf.enable = true;
      };
    };
  };
}
