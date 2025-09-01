# network.nix

{ lib, config, pkgs, ... }:

{
  networking.hostName = "single-serv";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [ xrdp unixtools.netstat ];
  # Firewall configuration for game servers
  networking.firewall = {
    allowedTCPPorts = [ 5900 18888 8777 ] ++ (lib.range 7770 7797);

    allowedUDPPorts = [ 27015 8777 ] ++ (lib.range 7770 7797);
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
