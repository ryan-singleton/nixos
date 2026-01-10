# git.nix

{ lib, config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      userName = "ryan-singleton";
      userEmail = "ryan@northofreal.com";
    };
  };
}
