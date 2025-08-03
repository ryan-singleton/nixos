# associations.nix
# set default applications for links, filetypes, and mime types in general
{ lib, config, pkgs, ... }: {
  xdg.mimeApps = {
    enable = true;
    associations.added = { "image/svg+xml" = "inkscape.desktop"; };
    defaultApplications = {
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "image/svg+xml" = "inkscape.desktop";
    };
  };
}
