# Add modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These are specifically for this host configuration.
{
  imports = [
    ./dev.nix
    ./display.nix
    ./fonts.nix
    ./gaming.nix
    ./graphics.nix
    ./localization.nix
    ./maintenance.nix
    ./network.nix
    ./packages.nix
    ./printing.nix
    ./sound.nix
    ./tuning.nix
  ];
}
