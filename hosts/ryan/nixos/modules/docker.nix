# docker.nix

{ lib, config, pkgs, ... }: {
  virtualisation.docker.enable = true;
  users.users.ryan.extraGroups = [ "docker" ];

  environment.systemPackages = with pkgs; [ docker-compose ];
}
