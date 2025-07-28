# gaming.nix

{ lib, config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    protonup-qt
    wineWowPackages.stable
    winetricks
    lutris
    heroic
  ];

  services.lsfg-vk = {
    enable = true;
    ui.enable = true;
  };

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "/home/user/.steam/root/compatibilitytools.d";
  };

  programs.steam.enable = true;
  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
  programs.steam.gamescopeSession.enable = true;
}
