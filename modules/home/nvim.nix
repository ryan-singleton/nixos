# nvim.nix

{ lib, config, pkgs, ... }:

{
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ dracula-vim ];
    extraConfig = ''
      colorscheme dracula
    '';
  };
}
