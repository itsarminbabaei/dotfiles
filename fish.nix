{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    # Plugins managed by fisher
    plugins = [
      { name = "fisher"; src = pkgs.fetchFromGitHub { owner = "jorgebucaran"; repo = "fisher"; rev = "4.4.4"; sha256 = "sha256-e8gIaVbuUzTwKtuMPNXBT5STeddYqQegduWBtURLT3M="; }; }
      # Temporarily removed spark.fish due to sha256 issue
    ];

    # Interactive shell init - adapted from your config.fish
    interactiveShellInit = ''
      # Disable greeting
      set fish_greeting ""

      # Homebrew paths (keep for compatibility)
      set -gx HOMEBREW_PREFIX "/opt/homebrew"
      set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar"
      set -gx HOMEBREW_REPOSITORY "/opt/homebrew"
      set -gx MANPATH "/opt/homebrew/share/man" $MANPATH
      set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH
      fish_add_path /opt/homebrew/bin
      fish_add_path /opt/homebrew/sbin
      fish_add_path $HOME/.local/bin

      # Ruby gems
      fish_add_path /opt/homebrew/lib/ruby/gems/3.4.0/bin
      fish_add_path $HOME/.gem/ruby/3.4.0/bin

      # Bun
      set --export BUN_INSTALL "$HOME/.bun"
      fish_add_path $BUN_INSTALL/bin

      # Solana
      fish_add_path $HOME/.local/share/solana/install/active_release/bin

      # Cargo
      fish_add_path $HOME/.cargo/bin

      # Clear line on CTRL+C
      bind --preset \cC 'cancel-commandline'

      # Abbreviations
      abbr -a .. 'cd ..'
      abbr -a ... 'cd ../..'
      abbr -a .... 'cd ../../..'
      abbr -a ..... 'cd ../../../..'
      abbr -a ~ 'cd ~'
      abbr -a gs 'git status'
      abbr -a ga 'git add'
      abbr -a gc 'git commit'
      abbr -a gco 'git checkout'
      abbr -a gb 'git branch'
      abbr -a gd 'git diff'
      abbr -a gl 'git log --oneline'
      abbr -a gp 'git push'
      abbr -a gpl 'git pull'
      abbr -a bu 'brew update'
      abbr -a bi 'brew install'
      abbr -a bs 'brew search'
      abbr -a o 'open .'
      abbr -a e 'nvim'
      abbr -a reload 'exec fish'
      abbr -a claude '/Users/itsarminbabaei/.claude/local/claude'
      abbr -a ls 'eza -la --icons --git --group-directories-first --header'
      abbr -a la 'eza -la --icons --git --group-directories-first --header'
      abbr -a ll 'eza -la --icons --git --group-directories-first --header'
      abbr -a lt 'eza -la --tree --level=2 --icons --git --group-directories-first'
      abbr -a lg 'eza -la --grid --icons --git --group-directories-first'
      abbr -a cat 'bat'
      abbr -a rm 'trash'

      # Editor
      set -gx EDITOR nvim

      # Herd Lite (PHP)
      fish_add_path /Users/itsarminbabaei/.config/herd-lite/bin
      set -gx PHP_INI_SCAN_DIR "/Users/itsarminbabaei/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

      # Kiro integration
      string match -q "$TERM_PROGRAM" "kiro" and . (kiro --locate-shell-integration-path fish)

      # Chezmoi source dir
      set -gx CHEZMOI_SOURCE_DIR ~/dev/dotfiles
    '';

    # Functions (you may need to copy them manually or source)
    functions = {
      # Example: copy functions from fish/functions/ if needed
    };

    # Shell aliases (if any)
    shellAliases = {
      nxvim = "XDG_CONFIG_HOME=~/.config_nxvim /Users/itsarminbabaei/.nix-profile/bin/nvim";
    };
  };
}
