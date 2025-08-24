# gaming.nix

{ lib, config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [ steamcmd steam-run ];
}
