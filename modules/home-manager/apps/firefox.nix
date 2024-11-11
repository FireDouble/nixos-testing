{
  inputs,
  lib,
  config,
  ...
}:

{
  options = {
    firefox.enable = lib.mkEnableOption "Enable Firefox";
  };

  config = lib.mkIf config.firefox.enable {
    programs.firefox = {
      enable = true;
      profiles.shizu = {
        settings = {
          "extensions.autoDisableScopes" = 0;
        };

        bookmarks = [
          {
            name = "Toolbar";
            toolbar = true;
            bookmarks = [
              {
                name = "Watching";
                bookmarks = [
                  {
                    name = "Youtube";
                    url = "https://www.youtube.com/";
                  }
                  {
                    name = "h!anime";
                    url = "https://hianime.to/home";
                  }
                  {
                    name = "Netflix";
                    url = "https://www.netflix.com/browse";
                  }
                  {
                    name = "Rakuten";
                    url = "https://www.rakuten.tv/pl";
                  }
                ];
              }
              {
                name = "Gaming";
                bookmarks = [
                  {
                    name = "StarRailStation";
                    url = "https://starrailstation.com/en";
                  }
                  {
                    name = "Guobas Kitchen";
                    url = "https://www.guobaskitchen.com/";
                  }
                  {
                    name = "Warp Calculator";
                    url = "https://hsr-warp-calculator.vercel.app/";
                  }
                  {
                    name = "HomGDCat Wiki";
                    url = "https://homdgcat.wiki/sr/hidden?lang=EN";
                  }
                  {
                    name = "Fribbles Calculator";
                    url = "https://fribbels.github.io/hsr-optimizer";
                  }
                ];
              }
              {
                name = "Other";
                bookmarks = [
                  {
                    name = "Gmail";
                    url = "https://mail.google.com/mail/u/0/#inbox";
                  }
                  {
                    name = "Chess";
                    url = "https://www.chess.com/";
                  }
                  {
                    name = "ChatGPT";
                    url = "https://chatgpt.com/";
                  }
                  {
                    name = "Pingu NixOS config";
                    url = "https://github.com/blahai/nyx";
                  }
                  {
                    name = "FireFox Color Catppuccin";
                    url = "https://github.com/catppuccin/firefox";
                  }
                ];
              }
            ];
          }
        ];

        containersForce = true;
        containers = {
          "1. Watching" = {
            color = "red";
            icon = "circle";
            id = 2;
          };
          "2. Gaming" = {
            color = "purple";
            icon = "circle";
            id = 3;
          };
          "3. Other" = {
            color = "blue";
            icon = "circle";
            id = 4;
          };
        };

        extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
          sponsorblock
          adblocker-ultimate
          adnauseam
          multi-account-containers
          return-youtube-dislikes
          firefox-color
        ];
      };
    };
  };
}
