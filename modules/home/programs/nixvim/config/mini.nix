# Mini - Collection of small utilities
# Docs: https://github.com/echasnovski/mini.nvim
# Lightweight utilities: ai (textobjects), surround, pairs (auto-pairs).

{
  plugins.mini = {
    enable = true;
    modules = {
      ai = {
        mappings = {
          around = null;
          inside = null;
        };
      };
      surround = {
        mappings = {
          add = null;
          delete = null;
          find = null;
          find_left = null;
          highlight = null;
          replace = null;
          update_n_lines = null;
        };
      };
      pairs = {};
    };
  };
}
