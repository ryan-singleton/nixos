# fish.nix

{ lib, config, pkgs, ... }:

{
  home.packages = with pkgs; [ fish oh-my-fish ];

  programs.fish.enable = true;
}
