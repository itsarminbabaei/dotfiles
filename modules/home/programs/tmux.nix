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
      {
        plugin = dracula;
        extraConfig = ''
          set -g @dracula-plugins "git cpu-usage ram-usage battery weather"
          set -g @dracula-show-left-icon "#h | #(whoami)"
          set -g @dracula-show-fahrenheit false
          set -g @dracula-show-location true
          set -g @dracula-weather-show-location true
        '';
      }
    ];
  };
}
