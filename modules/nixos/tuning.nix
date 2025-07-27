# tuning.nix
# the settings that should really make this configuration more gaming friendly
# attempts to emulate distros like cachyOS and their advantages as much as possible
# https://wiki.cachyos.org/features/kernel/

{ lib, config, pkgs, inputs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelModules = [ "fuse" "kvm-intel" ];
  # Fixes shutdown freeze (ACPI) and MHI modem reset hang (Qualcomm) and Audio issues with polling.
  boot.kernelParams = [
    "irqpoll"
    "mhi.timeout_ms=10000"
    "nowatchdog"
    "quiet"
    "reboot-acpi"
    "splash"
    "split_lock_detect=off"
  ];

  # eliminate hang on x11 hangup during shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";

  hardware.cpu.intel.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;

  boot.kernel.sysctl = {
    "kernel.sched_schedstats" = 0;
    "vm.swappiness" = 10;
  };

  powerManagement.cpuFreqGovernor = "performance";
}
