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

Installs`protonup-qt` to get GE-Proton and Proton-CachyOS 

Command `lsfg-vk-ui`, set up a profile that you like for most games like `2xf`, then put steam command `LSFG_PROCESS=2xf` in the launch options for any game you want to use losseless scaling on.




