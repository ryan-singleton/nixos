# fonts.nix

{ lib, config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    nerd-fonts.meslo-lg
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    source-code-pro
    roboto
    roboto-mono
  ];

  environment.sessionVariables = {
    FREETYPE_PROPERTIES =
      "cff:no-stem-darkening=0 autofitter:no-stem-darkening=0";
  };
}
