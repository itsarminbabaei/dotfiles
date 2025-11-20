{
  programs.ghostty = {
    enable = true;
    package = null; # Ghostty is installed via DMG on macOS, not managed by Nix
    settings = {
      font-family = ["GeistMono Nerd Font Mono" "Symbols Nerd Font"];
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

      # Salvage Denim Theme
      background = "061930";
      foreground = "DEDEE6";
      selection-background = "152C4C";
      selection-foreground = "DEDEE6";
      cursor-color = "7C8594";
      cursor-text = "cell-background";
      split-divider-color = "1D3456";
      unfocused-split-fill = "12253F";

      background-opacity = 0.95;
      background-blur = true;

      minimum-contrast = 4.5;
      bold-color = "bright";
      faint-opacity = 0.7;

      palette = [
        "0=#061930"    # Black: Black Denim
        "1=#152C4C"    # Red: Midnight Denim
        "2=#12253F"    # Green: Navy Denim
        "3=#2E4566"    # Yellow: Vintage Denim
        "4=#1D3456"    # Blue: Deep Indigo Denim
        "5=#7C8594"    # Magenta: Stonewashed Denim
        "6=#091C38"    # Cyan: Dark Wash Denim
        "7=#C3C3C3"    # White: Silver Denim
        "8=#152C4C"    # Bright Black: Midnight Denim
        "9=#1D3456"    # Bright Red: Deep Indigo Denim
        "10=#2E4566"   # Bright Green: Vintage Denim
        "11=#7C8594"   # Bright Yellow: Stonewashed Denim
        "12=#C3C3C3"   # Bright Blue: Silver Denim
        "13=#DEDEE6"   # Bright Magenta: Light Faded Denim
        "14=#DEDEE6"   # Bright Cyan: Light Faded Denim
        "15=#DEDEE6"   # Bright White: Light Faded Denim
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
