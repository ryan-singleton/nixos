# dev.nix
# developer tools that should be system wide

{
  lib,
  config,
  pkgs,
  ...
}:

{
  programs.nix-ld.enable = true;
  environment.systemPackages = with pkgs; [
    direnv
    git
    neovim
    vscodium
    dotnet-sdk
    mono
    jetbrains.rider
    nixfmt
  ];

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}
