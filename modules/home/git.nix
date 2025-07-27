# git.nix

{ lib, config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "ryan-singleton";
    userEmail = "ryan@northofreal.com";
    extraConfig = { init.defaultBranch = "main"; };
  };
}
