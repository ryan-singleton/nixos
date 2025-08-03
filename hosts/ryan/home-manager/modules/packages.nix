# packages.nix
# This is where packages are added that are ad-hoc in nature. If configuration or 
# grouping is involved, it may be better to just make a module of it.
{ lib, config, pkgs, ... }: {

  home.packages = with pkgs; [
    #browsers
    brave

    # graphics
    krita
    gimp3-with-plugins
    inkscape

    # docs
    libreoffice-qt
    obsidian

    #video
    kdePackages.kdenlive
    obs-studio
    vlc

    #social
    discord

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
  ];
}
