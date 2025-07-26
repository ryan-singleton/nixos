# fish.nix

{ lib, config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ fastfetch fish oh-my-fish ];
  programs.fish.enable = true;
}
