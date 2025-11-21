# Treesitter-context - Code context header
# Docs: https://github.com/nvim-treesitter/nvim-treesitter-context
# Sticky header showing current function/class context at top of window while scrolling.

{
  plugins.treesitter-context = {
    enable = true;
    settings = {
      enable = true;
      max_lines = 0;
      min_window_height = 0;
      line_numbers = true;
      multiline_threshold = 20;
      trim_scope = "outer";
      mode = "cursor";
      separator = null;
      zindex = 20;
      on_attach = null;
    };
  };
}
