
# workarounds.nix

{ lib, config, nixpkgs, pkgs, inputs, ... }:

{
  nixpkgs = {
    config = {
      # ....
      packageOverrides = pkgs: {
        #o penldap is absolutely jacked lately and NixOS needs to force them to fix their shit.
        # this has gone on too long. Overriding them so that I'm not frozen in time on my OS
        # because one component to the effort is not fixing tests.
        openldap = pkgs.openldap.overrideAttrs {
          finalAttrs: previousAttrs: {
            doCheck = false;
          }
        );
      };
    };
  };
}
