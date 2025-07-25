# fish.nix

{ lib, config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ fish oh-my-fish ];
  programs.fish.enable = true;
}
