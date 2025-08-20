# git.nix

{ lib, config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Chilevec";
    userEmail = "chilevecnull@gmail.com";
    extraConfig = { init.defaultBranch = "main"; };
  };
}
