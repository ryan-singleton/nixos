{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "powerlevel10k/powerlevel10k";  
      plugins = [ "git" "z" "sudo" "colored-man-pages" ];
      custom = "$HOME/.oh-my-zsh/custom";
    };

    # Optional: Set as default shell
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -alF";
      update = "nixos-rebuild switch --flake .#nixos";
    };
  };

  # Fonts for Powerlevel10k
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    zsh
    powerlevel10k
    nerdfonts  # includes MesloLGS and others needed for p10k
  ];

  # p10k config (if you already have a .p10k.zsh file you like)
  # home.file.".p10k.zsh".source = ./dotfiles/.p10k.zsh;  # optional

  # Optional: if you want to use your own zsh theme or modify config.zsh
  # home.file.".zshrc".text = ''
  #   source $HOME/.oh-my-zsh/oh-my-zsh.sh
  #   ZSH_THEME="powerlevel10k/powerlevel10k"
  #   ...
  # '';
}
