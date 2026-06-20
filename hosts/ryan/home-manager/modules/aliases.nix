{
  lib,
  config,
  pkgs,
  ...
}:
{

  home.packages = with pkgs; [
    (writeShellScriptBin "flake-test" ''
      sudo nixos-rebuild test --flake ~/nixos/#ryan
    '')
    (writeShellScriptBin "flake-switch" ''
      sudo nixos-rebuild switch --flake ~/nixos/#ryan
    '')
    (writeShellScriptBin "flake-boot" ''
      sudo nixos-rebuild boot --flake ~/nixos/#ryan
    '')
    (writeShellScriptBin "flake-upgrade" ''
      cd ~/nixos
      sudo nix flake update
    '')
    (writeShellScriptBin "soulframe-launcher-update" ''
      cd ~/.local/share/Steam/steamapps/compatdata/2649582938/pfx/drive_c/users/steamuser/AppData/Local/Soulframe/Downloaded/Public/Tools/
      mv -f Launcher.exe.tmp Launcher.exe
    '')
    #  while librewolf is in purgatory, we can run it ad hoc after invoking this per build
    (writeShellScriptBin "add-librewolf" ''
      NIXPKGS_ALLOW_INSECURE=1 nix shell nixpkgs#librewolf --impure
    '')
    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

}
