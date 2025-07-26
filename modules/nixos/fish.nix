# fish.nix

{ lib, config, pkgs, ... }:

{
  home.packages = with pkgs; [ fastfetch fish oh-my-fish ];
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      function fish_greeting
        fastfetch
      end
    '';
  };
}
