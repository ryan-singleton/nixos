# printing.nix

{ lib, config, pkgs, inputs, ... }:

{
  # Enable CUPS to print documents.
  services.printing.enable = true;
}
