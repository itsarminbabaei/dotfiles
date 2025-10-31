{ config, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;

    # Use your existing init.lua as base
    # Copy the contents of your ~/dev/dotfiles/nvim/init.lua here
    # Or import it from a file
    extraConfigLua = ''
      -- Your init.lua content here
      -- For example:
      vim.opt.number = true
      vim.opt.relativenumber = true
      -- Add all your settings from init.lua
    '';

    # Plugins - convert your lazy plugins to nixvim
    plugins = {
      # Example: if you use telescope
      telescope.enable = true;

      # For lazy.nvim plugins, use extraPlugins
      # extraPlugins = with pkgs.vimPlugins; [
      #   lazy-nvim
      #   # Add your plugins from lazy-lock.json
      # ];

      # LSP, treesitter, etc.
      lsp = {
        enable = true;
        servers = {
          # Add your LSP servers
          lua-ls.enable = true;
        };
      };

      treesitter.enable = true;
    };

    # Keymaps, options, etc.
    keymaps = [
      # Add your keybindings
    ];

    opts = {
      # Vim options
      number = true;
      relativenumber = true;
    };
  };
}
