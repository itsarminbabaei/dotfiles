if status is-interactive
    # Commands to run in interactive sessions can go here
end
 
# Disable the fish greeting message
set fish_greeting ""
 
# Print a new line after any command
source ~/.config/fish/functions/postexec_newline.fish

# Setup Homebrew environment
set -gx HOMEBREW_PREFIX "/opt/homebrew"
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar"
set -gx HOMEBREW_REPOSITORY "/opt/homebrew"
set -gx MANPATH "/opt/homebrew/share/man" $MANPATH
set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH

# Use fish_add_path instead of setting PATH manually
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path $HOME/.local/bin

# rails
fish_add_path /opt/homebrew/lib/ruby/gems/3.4.0/bin
fish_add_path $HOME/.gem/ruby/3.4.0/bin

# Bun setup
set --export BUN_INSTALL "$HOME/.bun"
fish_add_path $BUN_INSTALL/bin

# Solana
fish_add_path $HOME/.local/share/solana/install/active_release/bin

fish_add_path $HOME/.cargo/bin

# Clear line on CTRL + C
# Sometimes it still doesn't work well enough on node.js scripts :(
bind --preset \cC 'cancel-commandline'
 
# Auto-switch nvm version on cd
# Requires a ~/.node-version file with a valid node version
# https://github.com/jorgebucaran/nvm.fish/pull/186
if type -q nvm
  function __nvm_auto --on-variable PWD
  nvm use --silent 2>/dev/null # Comment out the silent flag for debugging
  end
  __nvm_auto
end
 
# Pyenv setup
# Requires `brew install pyenv`
if type -q pyenv
  status --is-interactive; and source (pyenv init -|psub)
end
 
# `ls` → `ls -laG` abbreviation
abbr -a -g ls ls -laG
 
# `ls` → `eza` abbreviation
# Requires `brew install eza`
if type -q eza
  abbr --add -g ls 'eza -la --icons --git --group-directories-first --header'
  abbr --add -g la 'eza -la --icons --git --group-directories-first --header'
  abbr --add -g ll 'eza -la --icons --git --group-directories-first --header'
  abbr --add -g lt 'eza -la --tree --level=2 --icons --git --group-directories-first'
  abbr --add -g lg 'eza -la --grid --icons --git --group-directories-first'
end
 
# `cat` → `bat` abbreviation
# Requires `brew install bat`
if type -q bat
  abbr --add -g cat 'bat'
end
 
# `rm` → `trash` abbreviation (moves files to the trash instead of deleting them)
# Requires `brew install trash`
if type -q trash
  abbr --add -g rm 'trash'
end

starship init fish | source

# Set default editor
set -gx EDITOR nvim

# Cargo environment (Fish equivalent of sourcing .cargo/env)
fish_add_path ~/.cargo/bin

# Herd Lite paths
fish_add_path /Users/itsarminbabaei/.config/herd-lite/bin
set -gx PHP_INI_SCAN_DIR "/Users/itsarminbabaei/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

string match -q "$TERM_PROGRAM" "kiro" and . (kiro --locate-shell-integration-path fish)
