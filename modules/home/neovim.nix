# nvim.nix
{ lib, config, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withPython3 = true;
    plugins = with pkgs.vimPlugins; [
      dracula-vim
      rose-pine
      lualine-nvim
      nightfox-nvim
      telescope-nvim
      neoformat
      nerdtree
    ];
    extraPackages = with pkgs; [ xclip xsel wl-clipboard ];
    extraConfig = ''
      colorscheme carbonfox
      syntax on
      set number

      let mapleader = " "

      nnoremap <leader>ff :Telescope find_files<cr>
      nnoremap <leader>fr :Telescope oldfiles<cr>
      nnoremap <leader>fs :Telescope live_grep<cr>
      nnoremap <leader>fc :Telescope grep_string<cr>
      nnoremap <leader>fk :Telescope keymaps<cr>

      nnoremap <leader>n :NERDTreeFocus<cr>
      nnoremap <C-n> :NERDTree<cr>
      nnoremap <C-t> :NERDTreeToggle<cr>
      nnoremap <C-f> :NERDTreeFind<cr>

      augroup fmt
        autocmd!
        autocmd BufWritePre * undojoin | Neoformat
      augroup END
    '';
    extraLuaConfig = ''
       require('lualine').setup {
         options = {
         theme = 'carbonfox',
       }
      }
    '';
  };
}
