# Twilight - Dim inactive code
# Docs: https://github.com/folke/twilight.nvim
# Dims surrounding code, focuses attention on current function/block.

{
  plugins.twilight = {
    enable = true;
    settings = {
      dimming = {
        alpha = 0.25;
        term_bg = "#000000";
        inactive = false;
      };
      context = 10;
      treesitter = true;
      treesitter_context = true;
      line_numbers = false;
      mode = "cursorline";
    };
  };
}
