# terminals.nix

{ lib, config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ fastfetch fish oh-my-fish ghostty ];
  programs.fish.enable = true;
}
