if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Disable greeting
set fish_greeting ""

# Homebrew
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

# Mise handles Node/Python auto-switching
# No nvm/pyenv needed

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

# Starship
starship init fish | source

# Editor
set -gx EDITOR nvim

# Herd Lite (PHP)
fish_add_path /Users/itsarminbabaei/.config/herd-lite/bin
set -gx PHP_INI_SCAN_DIR "/Users/itsarminbabaei/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

# Kiro integration
string match -q "$TERM_PROGRAM" "kiro" and . (kiro --locate-shell-integration-path fish)

# Mise activation
$HOME/.local/bin/mise activate fish | source

# Chezmoi source dir
set -gx CHEZMOI_SOURCE_DIR ~/dev/dotfiles
