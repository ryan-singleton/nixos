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
      openldap = prev.openldap.overrideAttrs (_: {
        doCheck = false;
      });
      fwupd = prev.fwupd.overrideAttrs (old: {
        mesonFlags = (old.mesonFlags or [ ]) ++ [ "-Ddocs=disabled" ];
      });
    })
  ];
}
