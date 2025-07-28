# maintenance.nix

{ lib, config, pkgs, ... }:

{
  # Set a limit on the number of generations to include in boot
  boot.loader.systemd-boot.configurationLimit = 20;

  # # Enable auto-upgrades.
  # system.autoUpgrade = {
  #   enable = true;
  #   # Run daily
  #   dates = "daily";
  #   # Build the new config and make it the default, but don't switch yet.  This will be picked up on reboot.  This helps
  #   # prevent issues with OpenSnitch configs not well matching the state of the system.
  #   operation = "boot";
  # };

  # Auto GC
  nix.gc = {
    automatic = true;
    persistent = true;
    options = "--delete-older-than 30d";
  };
}
