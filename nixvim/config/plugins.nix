{
  plugins = {
    # File explorer
    nvim-tree.enable = true;

    # Fuzzy finder
    telescope.enable = true;

    # Syntax highlighting
    treesitter = {
      enable = true;
      ensureInstalled = [
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
      settings.sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
      ];
    };

    # Git integration
    gitsigns.enable = true;

    # Status line
    lualine.enable = true;

    # Icons
    web-devicons.enable = true;
  };

  # Extra plugins not in nixvim
  extraPlugins = [
    # Add any additional plugins here
  ];

  # Extra config
  extraConfigLua = ''
    -- Your additional Lua config here
    vim.g.mapleader = " "
  '';
}
