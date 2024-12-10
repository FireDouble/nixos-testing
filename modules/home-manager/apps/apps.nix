{ lib, ... }:

{
  imports = [
    ./firefox.nix
    ./kitty.nix
  ];

  firefox.enable = lib.mkDefault true;
  kitty.enable = lib.mkDefault true;
}
