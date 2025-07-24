# steam.nix

{ lib, config, pkgs, ... }:

{
  programs.steam.enable = true;
  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
  programs.steam.gamescopeSession.enable = true;
}
