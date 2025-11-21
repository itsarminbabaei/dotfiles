{
  programs.fish = {
    enable = true;

    shellAbbrs = {
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";
      "~" = "cd ~";
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gco = "git checkout";
      gb = "git branch";
      gd = "git diff";
      gl = "git log --oneline";
      gp = "git push";
      gpl = "git pull";
      bu = "brew update";
      bi = "brew install";
      bs = "brew search";
      o = "open .";
      e = "nvim";
      reload = "exec fish";
      claude = "/Users/itsarminbabaei/.claude/local/claude";
      ls = "eza -la --icons --git --group-directories-first --header";
      la = "eza -la --icons --git --group-directories-first --header";
      ll = "eza -la --icons --git --group-directories-first --header";
      lt = "eza -la --tree --level=2 --icons --git --group-directories-first";
      lg = "eza -la --grid --icons --git --group-directories-first";
      cat = "bat";
      rm = "trash";
      tree = "eza --tree --icons --git --group-directories-first";
    };

    shellInit = ''
      set fish_greeting ""
    '';

    interactiveShellInit = ''
      bind --preset \cC 'cancel-commandline'

      # Dracula Fish Theme
      # Colors
      set -g fish_color_normal f8f8f2
      set -g fish_color_command 8be9fd
      set -g fish_color_keyword ff79c6
      set -g fish_color_quote f1fa8c
      set -g fish_color_redirection bd93f9
      set -g fish_color_end 50fa7b
      set -g fish_color_error ff5555
      set -g fish_color_param ffb86c
      set -g fish_color_comment 6272a4
      set -g fish_color_selection --background=44475a
      set -g fish_color_search_match --background=44475a
      set -g fish_color_operator 50fa7b
      set -g fish_color_escape 8be9fd
      set -g fish_color_autosuggestion 6272a4

      # Pager colors
      set -g fish_pager_color_progress f8f8f2 --background=282a36
      set -g fish_pager_color_prefix 8be9fd --bold --underline
      set -g fish_pager_color_completion 6272a4
      set -g fish_pager_color_description bd93f9
    '';
  };
}
