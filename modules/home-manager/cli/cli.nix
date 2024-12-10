{ lib, ... }:

{
  imports = [
    ./fastfetch.nix
    ./nixvim.nix
    ./fish.nix
    ./tmux.nix
    ./starship.nix
    ./nh.nix
  ];

  nh.enable = lib.mkDefault true;
  starship.enable = lib.mkDefault true;
  tmux.enable = lib.mkDefault true;
  fastfetch.enable = lib.mkDefault true;
  nixvim.enable = lib.mkDefault true;
  fish.enable = lib.mkDefault true;
}
