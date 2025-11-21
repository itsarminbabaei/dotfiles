# Starship prompt - Dracula preset with dynamic all modules
# Docs: https://starship.rs/presets/

{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      format = "$all$character ";
      add_newline = false;

      # Dracula preset colors
      palette = "dracula";
      palettes.dracula = {
        background = "#282a36";
        current_line = "#44475a";
        foreground = "#f8f8f2";
        comment = "#6272a4";
        red = "#ff5555";
        orange = "#ffb86c";
        yellow = "#f1fa8c";
        green = "#50fa7b";
        cyan = "#8be9fd";
        blue = "#bd93f9";
        purple = "#ff79c6";
      };

      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
        vimcmd_symbol = "[❮](bold cyan)";
      };
    };
  };
}
