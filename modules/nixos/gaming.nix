# gaming.nix
# optimizations to make nixos like other gaming specific distros

{ lib, config, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelModules = [ "fuse" "kvm-intel" ];

  boot.kernel.sysctl = { "kernel.sched_schedstats" = 0; };

  powerManagement.cpuFreqGovernor = "performance";

  hardware.graphics.enable = true;
  hardware.cpu.intel.updateMicrocode = true;

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
