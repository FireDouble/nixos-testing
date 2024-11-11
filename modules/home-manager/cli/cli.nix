{ lib, ... }:

{
  imports = [
    ./kitty.nix
    ./fastfetch.nix
    ./nixvim.nix
    ./fish.nix
  ];

  kitty.enable = lib.mkDefault true;
  fastfetch.enable = lib.mkDefault true;
  nixvim.enable = lib.mkDefault true;
  fish.enable = lib.mkDefault true;
}
