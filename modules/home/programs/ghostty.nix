{
  programs.ghostty = {
    enable = true;
    package = null; # Ghostty is installed via DMG on macOS, not managed by Nix
    systemd.enable = false;
    settings = {
      font-family = [
        "GeistMono Nerd Font"
        "Symbols Nerd Font Mono"
      ];
      font-size = 14;
      shell-integration-features = "no-cursor,sudo,no-title";
      cursor-style = "block";
      adjust-cell-height = "35%";

      mouse-hide-while-typing = true;
      mouse-scroll-multiplier = 2;

      window-padding-balance = true;
      window-save-state = "always";
      macos-titlebar-style = "transparent";
      window-colorspace = "display-p3";

      copy-on-select = "clipboard";

      # Dracula Theme
      background = "#282a36";
      foreground = "#f8f8f2";
      selection-background = "#44475a";
      selection-foreground = "#f8f8f2";
      cursor-color = "#f8f8f2";
      cursor-text = "#282a36";

      background-opacity = 0.95;
      background-blur = true;

      minimum-contrast = 4.5;
      bold-color = "bright";
      faint-opacity = 0.7;

      palette = [
        "0=#21222c"
        "1=#ff5555"
        "2=#50fa7b"
        "3=#f1fa8c"
        "4=#bd93f9"
        "5=#ff79c6"
        "6=#8be9fd"
        "7=#f8f8f2"
        "8=#6272a4"
        "9=#ff6e6e"
        "10=#69ff94"
        "11=#ffffa5"
        "12=#d6acff"
        "13=#ff92df"
        "14=#a4ffff"
        "15=#ffffff"
      ];

      # keybindings
      keybind = [
        "cmd+s>r=reload_config"
        "cmd+s>x=close_surface"

        "cmd+s>n=new_window"

        # tabs
        "cmd+s>c=new_tab"
        "cmd+s>shift+l=next_tab"
        "cmd+s>shift+h=previous_tab"
        "cmd+s>comma=move_tab:-1"
        "cmd+s>period=move_tab:1"

        # quick tab switch
        "cmd+s>1=goto_tab:1"
        "cmd+s>2=goto_tab:2"
        "cmd+s>3=goto_tab:3"
        "cmd+s>4=goto_tab:4"
        "cmd+s>5=goto_tab:5"
        "cmd+s>6=goto_tab:6"
        "cmd+s>7=goto_tab:7"
        "cmd+s>8=goto_tab:8"
        "cmd+s>9=goto_tab:9"

        # split
        "cmd+s>equal=new_split:right"
        "cmd+s>minus=new_split:down"

        "cmd+s>j=goto_split:bottom"
        "cmd+s>k=goto_split:top"
        "cmd+s>h=goto_split:left"
        "cmd+s>l=goto_split:right"

        "cmd+s>z=toggle_split_zoom"

        "cmd+s>e=equalize_splits"
      ];
    };
  };
}
