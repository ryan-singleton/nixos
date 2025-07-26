# swap.nix
{ config, lib, ... }:

with lib;

let cfg = config.swap;
in {
  options.swap = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable swap support (ZRAM or disk).";
    };

    hibernate = mkOption {
      type = types.bool;
      default = false;
      description = "Enable hibernate support (requires disk-backed swap).";
    };
  };

  config = mkIf cfg.enable {
    zramSwap = mkIf (!cfg.hibernate) {
      enable = true;
      priority = 100;
    };

    swapDevices = mkIf cfg.hibernate [{
      device = "/swapfile";
      size = 16 * 1024;
    }];
  };
}
