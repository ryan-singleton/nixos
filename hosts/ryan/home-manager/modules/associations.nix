# associations.nix
# set default applications for links, filetypes, and mime types in general
{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
{
  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "image/svg+xml" = "inkscape.desktop";
    };
    defaultApplications = {
      "text/html" = "zen-beta.desktop";
      "x-scheme-handler/http" = "zen-beta.desktop";
      "x-scheme-handler/https" = "zen-beta.desktop";
      "image/svg+xml" = "inkscape.desktop";
    };
  };
}
