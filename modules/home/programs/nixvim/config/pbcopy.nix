# Clipboard - macOS integration
# Docs: https://neovim.io/doc/user/provider.html#clipboard
# Enable pbcopy/pbpaste for Neovim to use system clipboard on macOS.

{
  clipboard = {
    register = "unnamedplus";
    providers = {
      pbcopy.enable = true;  # macOS clipboard
    };
  };
}
