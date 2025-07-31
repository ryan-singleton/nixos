{ lib, config, pkgs, ... }: {
  # Install Ghostty
  home.packages = with pkgs; [ ghostty fish fastfetch oh-my-fish ];

  # Create Ghostty config file
  home.file.".config/ghostty/config".text = ''
    # Set Fish as default shell
    command = ${pkgs.fish}/bin/fish

    # Carbon Fox theme colors
    background = 161618
    foreground = f2f4f8

    # Carbon Fox color palette
    palette = 0=#282828
    palette = 1=#ee5396
    palette = 2=#25be6a
    palette = 3=#08bdba
    palette = 4=#78a9ff
    palette = 5=#be95ff
    palette = 6=#33b1ff
    palette = 7=#dfdfe0
    palette = 8=#928374
    palette = 9=#f16da6
    palette = 10=#46c880
    palette = 11=#2dc7c4
    palette = 12=#8cb6ff
    palette = 13=#c8a5ff
    palette = 14=#52c1ff
    palette = 15=#ffffff

    # Optional additional settings
    font-family = Source Code Pro
    font-style = semibold
    font-size = 10
    cursor-style = underline
    mouse-hide-while-typing = true
    window-padding-x = 10
    window-padding-y = 10
  '';

  # Configure Fish shell
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      # Carbon Fox theme for Fish
      set -g fish_color_normal f2f4f8
      set -g fish_color_command 78a9ff
      set -g fish_color_keyword be95ff
      set -g fish_color_quote 25be6a
      set -g fish_color_redirection 33b1ff
      set -g fish_color_end ee5396
      set -g fish_color_error ee5396
      set -g fish_color_param f2f4f8
      set -g fish_color_comment 6e6f70
      set -g fish_color_selection --background=2a2a2a
      set -g fish_color_search_match --background=3e3e3e
      set -g fish_color_operator 08bdba
      set -g fish_color_escape 08bdba
      set -g fish_color_autosuggestion 6e6f70

      # Prompt colors
      set -g fish_color_cwd 78a9ff
      set -g fish_color_user 25be6a
      set -g fish_color_host 08bdba
    '';
  };
}
