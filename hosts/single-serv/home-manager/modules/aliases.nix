

{ lib, config, pkgs, ... }: {

  home.packages = with pkgs; [
    (writeShellScriptBin "flake-test" ''
      sudo nixos-rebuild test --flake ~/nixos/#single-serv
    '')
    (writeShellScriptBin "flake-switch" ''
      sudo nixos-rebuild switch --flake ~/nixos/#single-serv
    '')
    (writeShellScriptBin "flake-upgrade" ''
      cd ~/nixos
      sudo nix flake update
    '')
    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

}
