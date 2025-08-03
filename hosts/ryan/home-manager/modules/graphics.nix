# graphics.nix
# graphic design configurations
{ lib, config, pkgs, ... }: {

  home.packages = with pkgs; [
    kdePackages.kdenlive
    krita
    gimp3-with-plugins
    inkscape
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "image/svg+xml" = "inkscape.desktop";
      "image/svg+xml-compressed" = "inkscape.desktop";
    };
  };
}
