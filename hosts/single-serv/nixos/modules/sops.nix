# sops.nix
# secrets

{ lib, config, pkgs, inputs, sops-nix, ... }:

{
  sops.defaultSopsFile = ./secrets/secrets.yaml;
  sops.age.keyFile = "/home/ryan/.config/sops/age/keys.txt";

  sops.secrets."gameserver/server_password" = { owner = "ryan"; };
  sops.secrets."gameserver/admin_password" = { owner = "ryan"; };
}
