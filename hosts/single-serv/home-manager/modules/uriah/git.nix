# git.nix

{
  lib,
  config,
  pkgs,
  ...
}:

{
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      user.name = "Chilevec";
      user.email = "chilevecnull@gmail.com";
    };
  };
}
