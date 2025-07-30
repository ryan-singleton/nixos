# display.nix
{ lib, config, pkgs, ... }:

let cfg = config.display;
in {
  options.display = {
    enable = mkEnableOption "display system configuration";

    x11 = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Enable X11 windowing system";
      };

      layout = mkOption {
        type = types.str;
        default = "us";
        description = "Keyboard layout for X11";
      };

      variant = mkOption {
        type = types.str;
        default = "";
        description = "Keyboard variant for X11";
      };
    };

    wayland = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Enable Wayland support";
      };
    };

    desktopManager = mkOption {
      type = types.enum [ "plasma6" "gnome" "xfce" "none" ];
      default = "plasma6";
      description = "Desktop manager to use";
    };

    displayManager = mkOption {
      type = types.enum [ "sddm" "gdm" "lightdm" "none" ];
      default = "sddm";
      description = "Display manager to use";
    };

  };

  config = lib.mkIf cfg.enable {
    # X11 Configuration
    services.xserver = mkIf cfg.x11.enable {
      enable = true;
      xkb = {
        layout = cfg.x11.layout;
        variant = cfg.x11.variant;
      };
    };

    # Desktop Manager Configuration
    services.desktopManager = {
      plasma6.enable = mkIf (cfg.desktopManager == "plasma6") true;
      gnome.enable = mkIf (cfg.desktopManager == "gnome") true;
      xfce.enable = mkIf (cfg.desktopManager == "xfce") true;
    };

    # Display Manager Configuration
    services.displayManager = {
      sddm = mkIf (cfg.displayManager == "sddm") {
        enable = true;
        wayland.enable = cfg.wayland.enable;
        autoLogin = mkIf cfg.autoLogin.enable {
          enable = true;
          user = cfg.autoLogin.user;
        };
      };

      gdm = mkIf (cfg.displayManager == "gdm") {
        enable = true;
        wayland = cfg.wayland.enable;
        autoLogin = mkIf cfg.autoLogin.enable {
          enable = true;
          user = cfg.autoLogin.user;
        };
      };

      lightdm = mkIf (cfg.displayManager == "lightdm") {
        enable = true;
        autoLogin = mkIf cfg.autoLogin.enable {
          enable = true;
          user = cfg.autoLogin.user;
        };
      };
    };

    # Additional packages based on desktop manager
    environment.systemPackages = with pkgs;
      (optionals (cfg.desktopManager == "plasma6") [
        kdePackages.kate
        kdePackages.konsole
      ]) ++ (optionals (cfg.desktopManager == "gnome") [
        gnome.gnome-terminal
        gnome.nautilus
      ]) ++ (optionals (cfg.desktopManager == "xfce") [
        xfce.thunar
        xfce.xfce4-terminal
      ]);
  };
}

