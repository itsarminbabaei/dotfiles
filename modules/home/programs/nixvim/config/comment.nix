# Comment - Toggle comments
# Docs: https://github.com/numToStr/Comment.nvim
# Quick toggle comments with gc/gb operators. Treesitter-aware language detection.

{
  plugins.comment = {
    enable = true;
    settings = {
      toggler = {
        line = null;
        block = null;
      };
      opleader = {
        line = null;
        block = null;
      };
    };
  };
}
