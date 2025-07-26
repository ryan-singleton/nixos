# NixOS Gaming Rig

This version of the Nix configuration uses flakes and home manager.

To run this, use this command

`sudo nixos-rebuild switch --flake {flake.nix folder}/#{host}`

Assuming you have not changed the host and have placed this in, say
`~/nixos`

The command would be 
`sudo nixos-rebuild switch --flake ~nixos/#nixos`

Because the host is `nixos` by default.

As you can see, though, this builds against the `flake.nix` file and its location. Not the configuration.nix file in `/etc/nixos`.

After it is initially built, you can just run `flakeswitch` or `flaketest` since the aliases will be applied.

## Themes

## Global
Layan

## Application
Breeze

## Plasma
Materia

## Colors
Monochrome

## Window Decorations
Monochrome

## Fonts
All Roboto 10pt except:
Small Roboto 8pt
Fixed width: Code Pro Medium 10pt

## Icons
Papirus

## Cursors
Breeze Light



## Gaming Optimizations

Installing `protonup-qt` to get GE-Proton and Proton-CachyOS 

```nix
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelModules = [ "fuse" "kvm-intel" ];
  boot.kernelParams = [ "split_lock_detect=off" ];

   environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "/home/user/.steam/root/compatibilitytools.d";
  };

  powerManagement.cpuFreqGovernor = "performance";

  hardware.graphics.enable = true;
  hardware.cpu.intel.updateMicrocode = true;
```


