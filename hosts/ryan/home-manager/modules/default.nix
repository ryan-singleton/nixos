# Add modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These are specifically for this host configuration's home manager.
{
  imports = [
    ./aliases.nix
    ./browser.nix
    ./git.nix
    ./neovim.nix
    ./packages.nix
    ./terminal.nix
  ];
}
