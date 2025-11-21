# Flash - Enhanced motion
# Docs: https://github.com/folke/flash.nvim
# Leap-style motions with search/char/treesitter modes. Enhances f/t/n motions.

{
  plugins.flash = {
    enable = true;
    settings = {
      modes = {
        search = {
          enabled = true;
        };
        char = {
          enabled = true;
        };
      };
    };
  };
}
