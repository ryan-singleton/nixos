

{ lib, config, pkgs, ... }: {

  home.packages = with pkgs; [ brave ];

  home-manager.users.myuser.xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "brave-browser.desktop";
      "x-scheme-handler/http" = "brave-browser.desktop";
      "x-scheme-handler/https" = "brave-browser.desktop";
    };
  };
}
