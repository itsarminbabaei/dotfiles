{
  plugins.mason = {
    enable = true;
    settings = {
      ensure_installed = [
        # LSP servers
        "lua-language-server"
        "gopls"
        "zls"
        "typescript-language-server"
        "rust-analyzer"
        "intelephense"
        "tailwindcss-language-server"
        "html-lsp"
        "css-lsp"
        "vue-language-server"

        # Formatters
        "stylua"
        "goimports"
        "black"
        "isort"

        # Linters and diagnostics
        "golangci-lint"
        "luacheck"
        "pint"
        "biome"

        # Additional tools
        "delve"
        "shfmt"
        "shellcheck"
      ];
    };
  };
}
