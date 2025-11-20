{
  plugins.twilight = {
    enable = true;
    settings = {
      dimming = {
        alpha = 0.25;
        color = {
          "fg" = "#ffffff";
          "bg" = "#000000";
        };
        term_bg = "#000000";
        inactive = false;
      };
      context = 10;
      treesitter = true;
      treesitter_context = true;
      line_numbers = false;
      mode = "cursorline";
      expand = {
        "function" = true;
        "method" = true;
        "table" = false;
        "if" = true;
      };
      exclude = [ ];
    };
  };
}
