# terminals.nix

{ lib, config, pkgs, ... }:

{
  users.users.ryan = { shell = pkgs.fish; };

  # Set Ghostty as system default terminal
  environment.variables = { TERMINAL = "${pkgs.ghostty}/bin/ghostty"; };
}
