{ lib, ... }:

{
  imports = [
    ./firefox.nix
  ];

  firefox.enable = lib.mkDefault true;
}
