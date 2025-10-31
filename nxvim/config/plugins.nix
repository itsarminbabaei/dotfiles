{
  plugins = {
    # Syntax highlighting
    treesitter = {
      enable = true;
      settings = {
        ensure_installed = [
          "bash"
          "c"
          "cpp"
          "css"
          "go"
          "html"
          "javascript"
          "json"
          "lua"
          "markdown"
          "nix"
          "python"
          "rust"
          "typescript"
          "vim"
          "yaml"
        ];
      };
    };

    # LSP
    lsp = {
      enable = true;
      servers = {
        rust-analyzer.enable = true;
        tsserver.enable = true;
        lua-ls.enable = true;
        nixd.enable = true;
      };
    };

    # Completion
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
      };
    };

    # Fuzzy finder
    telescope.enable = true;

    # Git integration
    gitsigns.enable = true;

    # Status line
    lualine.enable = true;

    # Icons
    web-devicons.enable = true;
  };

  colorschemes.catppuccin.enable = true;
}
