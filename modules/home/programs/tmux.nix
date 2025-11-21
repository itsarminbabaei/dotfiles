# Tmux - Terminal multiplexer
# Docs: https://github.com/tmux/tmux
# Rationale: Session management with Dracula theme for consistent UI

{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    terminal = "screen-256color";
    baseIndex = 1;
    mouse = true;
    
    plugins = with pkgs.tmuxPlugins; [
      dracula
    ];
  };
}
