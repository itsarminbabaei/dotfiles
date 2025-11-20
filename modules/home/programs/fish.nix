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

      # Salvage Denim Fish Theme
      # Colors
      set -g fish_color_normal DEDDE6
      set -g fish_color_command 7C8594
      set -g fish_color_keyword 2E4566
      set -g fish_color_quote 1D3456
      set -g fish_color_redirection 152C4C
      set -g fish_color_end 12253F
      set -g fish_color_error 091C38
      set -g fish_color_param C3C3C3
      set -g fish_color_comment 061930
      set -g fish_color_selection --background=1D3456
      set -g fish_color_search_match --background=152C4C
      set -g fish_color_operator 2E4566
      set -g fish_color_escape 12253F
      set -g fish_color_autosuggestion 7C8594

      # Pager colors
      set -g fish_pager_color_progress DEDDE6 --background=061930
      set -g fish_pager_color_prefix C3C3C3 --bold --underline
      set -g fish_pager_color_completion 7C8594
      set -g fish_pager_color_description 2E4566
    '';
  };
}
