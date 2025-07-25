# main-user.nix

{ lib, config, pkgs, ... }:

let cfg = config.main-user;
in {
  options.main-user = {
    enable = lib.mkEnableOption "enable main user module";
    userName = lib.mkOption {
      default = "mainuser";
      description = ''
        username
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    users.users.${config.main-user.userName} = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" ];
      shell = pkgs.zsh;
    };
  };
}

