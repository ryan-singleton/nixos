

{ lib, config, pkgs, ... }: {

  home.packages = with pkgs; [
    kdePackages.kdenlive
    krita
    gimp3-with-plugins
    libreoffice-qt
    inkscape
  ];

}
