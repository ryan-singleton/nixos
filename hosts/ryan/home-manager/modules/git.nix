# git.nix

{ lib, config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      user.name = "ryan-singleton";
      user.email = "ryan@northofreal.com";
    };
  };
}
