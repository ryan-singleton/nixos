# main-user.nix
{ lib, config, pkgs, ... }:
let
  cfg = config.main-user;

  userConfigs = lib.listToAttrs (map (userName: {
    name = userName;
    value = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" ];
    };
  }) cfg.userNames);

in {
  options.main-user = {
    enable = lib.mkEnableOption "enable main user module";

    userNames = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ "mainuser" ];
      description = ''
        List of usernames to create as main users
      '';
    };
  };

  config = lib.mkIf cfg.enable { users.users = userConfigs; };
}
