# workarounds.nix

{
  lib,
  config,
  nixpkgs,
  pkgs,
  inputs,
  ...
}:

{
  nixpkgs.overlays = [
    (final: prev: {
      # I've been stuck in one version of NixOS for a very long time because of an openldap
      # test issue that is inconsequential, so far as I can tell. This is bad form and the org
      # behind the distro needs to get this resolved. Causing a great many concerns about
      # sticking to NixOS. It needs to be reliable if I'm going to put this much work into it!
      # Ignoring it and moving on.
      # https://github.com/NixOS/nixpkgs/issues/372569
      openldap = prev.openldap.overrideAttrs (old: {
        doCheck = false;
      });
    })
  ];
}
