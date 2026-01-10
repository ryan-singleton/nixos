# dev.nix
# developer tools that should be system wide

{
  lib,
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    direnv
    git
    neovim
    vscodium
    dotnet-sdk
    mono
    jetbrains.rider
    nixfmt

    elixir
    elixir-ls
  ];
}
