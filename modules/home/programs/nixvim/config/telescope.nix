# Telescope - Fuzzy finder
# Docs: https://github.com/nvim-telescope/telescope.nvim
# Fuzzy search for files, buffers, grep. Highly extensible. Keybind <leader>ff for files.

{
  plugins.telescope = {
    enable = true;
    settings = {
      defaults = {
        mappings = {
          i = {
            "<C-u>" = false;
            "<C-d>" = false;
          };
        };
      };
    };
  };
}
