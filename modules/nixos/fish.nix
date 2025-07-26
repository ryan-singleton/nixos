# fish.nix

{ lib, config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ neofetch fish oh-my-fish ];
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      function fish_greeting
        neofetch
      end
    '';
  };
}
