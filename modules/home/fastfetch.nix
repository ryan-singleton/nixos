# modules/fastfetch.nix
{ config, lib, pkgs, ... }:

with lib;

let cfg = config.programs.fastfetch;
in {
  options.programs.fastfetch = {
    enable = mkEnableOption "Enable Fastfetch";
    settings = mkOption {
      type = types.attrs;
      default = { };
      description = "Fastfetch configuration.";
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.fastfetch ];

    xdg.configFile."fastfetch/config.jsonc".text = builtins.toJSON cfg.settings;
  };
}
