# gaming.nix
# optimizations to make nixos like other gaming specific distros

{ lib, config, pkgs, inputs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages;
  boot.kernelModules = [ "fuse" "kvm-intel" ];
  boot.kernelParams = [ "split_lock_detect=off" ];

  boot.kernel.sysctl = {
    "kernel.sched_schedstats" = 0;
    "vm.swappiness" = 10;
  };

  powerManagement.cpuFreqGovernor = "performance";

  hardware.graphics.enable = true;

  environment.systemPackages = with pkgs; [
    protonup-qt
    wineWowPackages.stable
    winetricks
    lutris
    heroic
    goverlay
    mangohud
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "/home/user/.steam/root/compatibilitytools.d";
  };
}
