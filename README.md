# NixOS Gaming Rig

This version of the Nix configuration uses flakes and home manager.

To run this, use this command

`sudo nixos-rebuild switch --flake {flake.nix folder}/#{host}`

`host` correlates to the folder that holds the specific configurations for your host machine/user

So if you set up a host named "john" in `./hosts/john`, the command would be
`sudo nixos-rebuild switch --flake ~nixos/#john`

As you can see, though, this builds against the `flake.nix` file and its location. Not the configuration.nix file in `/etc/nixos` like you'll see in starter stuff. Once you have gone to flakes, do not build against `/etc/nixos/configuraiton.nix` anymore~

After it is initially built, you can just run `flake-switch`, `flake-upgrade`, or `flake-test` since the aliases will be applied to the host that you set up. It will know from then forward which once is relevant.

## Structural Stuff
I'm mostly following a Vimjoyer amalgamation with [this repo](https://github.com/Misterio77/nix-starter-configs). The way hosts are separated (different machine profiles) follows the Vimjoyer format because I like that a little better.

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




