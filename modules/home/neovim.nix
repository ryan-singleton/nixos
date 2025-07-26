# nvim.nix

{ lib, config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      dracula-vim
      rose-pine
      nightfox-nvim
      telescope-nvim
      nerdtree
    ];
    extraConfig = ''
      colorscheme carbonfox
    '';
  };
}
