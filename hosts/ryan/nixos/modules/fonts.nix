# fonts.nix

{ lib, config, pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    fontconfig = {
      enable = true;
      antialias = true;
      hinting.enable = true;
      hinting.style = "slight";
      subpixel.rgba = "rgb";
    };

    packages = with pkgs; [
      corefonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      inter
      nerd-fonts.meslo-lg
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      source-code-pro
      roboto
      roboto-mono
    ];
  };

  environment.sessionVariables = {
    FREETYPE_PROPERTIES =
      "cff:no-stem-darkening=0 autofitter:no-stem-darkening=0";
    # Qt apps
    QT_AUTO_SCREEN_SCALE_FACTOR = "0";
    QT_SCALE_FACTOR = "1"; # Try 1 or 1.25 if absolutely necessary
    QT_ENABLE_HIGHDPI_SCALING = "1";

    # GTK apps
    GDK_SCALE = "1";
    GDK_DPI_SCALE = "1.0";
  };
}
