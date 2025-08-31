# maintenance.nix

{ lib, config, pkgs, ... }:

{
  # Set a limit on the number of generations to include in boot
  boot.loader.systemd-boot.configurationLimit = 20;

  # Auto GC
  nix.gc = {
    automatic = true;
    persistent = true;
    options = "--delete-older-than 30d";
  };
}
