# dev.nix

{ lib, config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    direnv
    git
    neovim
    vscodium
    nixfmt-classic
  ];
}
