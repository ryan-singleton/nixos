# tuning.nix
# the settings that should really make this configuration more gaming friendly
# attempts to emulate distros like cachyOS and their advantages as much as possible
# https://wiki.cachyos.org/features/kernel/

{ lib, config, pkgs, inputs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages;
  boot.kernelParams = [ "split_lock_detect=off" ];
}

