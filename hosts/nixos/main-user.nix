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
      shell = pkgs.fish;
      packages = with pkgs; [
        fish
        oh-my-fish
        vscodium
        nixfmt-classic
        krita
        gimp
        inkscape
        obs-studio
        vlc
        discord
      ];
    };
  };
}

