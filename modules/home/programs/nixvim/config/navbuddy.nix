# NavBuddy - Code structure navigator
# Docs: https://github.com/SmiteshP/nvim-navbuddy
# Popup menu showing LSP symbols. Browse code structure without jumping.

{
  plugins.navbuddy = {
    enable = true;
    settings = {
      window = {
        size = {
          height = "100%";
          width = "100%";
        };
      };
    };
  };
}
