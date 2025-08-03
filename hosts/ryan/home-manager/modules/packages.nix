# packages.nix
# This is where packages are added that are ad-hoc in nature. If configuration or 
# grouping is involved, it may be better to just make a module of it.
{ lib, config, pkgs, ... }: {

  home.packages = with pkgs; [
    kdePackages.kdenlive
    krita
    gimp3-with-plugins
    libreoffice-qt
    inkscape
    obsidian
    obs-studio
    vlc
    discord
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
  ];

}
