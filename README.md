# NixOS Gaming Rig

This version of the Nix configuration uses flakes and home manager.

To run this, use this command

`sudo nixos-rebuild switch --flake {flake.nix folder}/#{host}`

Assuming you have not changed the host and have placed this in, say
`~/nixos`

The command would be 
`sudo nixos-rebuild switch --flake ~nixos/nixos`

Because the host is `nixos` by default.

As you can see, though, this builds against the `flake.nix` file and its location. Not the configuration.nix file in `/etc/nixos`.

## Themes

## Global

Layan

## Application
Breeze

## Plasma
Ambient-Blue

## Colors
QogirDark

## Window Decorations
Qogir-dark

## Fonts
All Roboto 10pt except:
Small Roboto 8pt
Fixed width: Code Pro Medium 10pt

## Icons
Papirus

## Cursors
Breeze Light

