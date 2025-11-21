# Conform - Code formatter
# Docs: https://github.com/stevearc/conform.nvim
# Async formatter integrating multiple formatters (Biome, gofmt, stylua, shfmt, etc.).

{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        go = ["goimports" "gofmt"];
        javascript = ["biome"];
        typescript = ["biome"];
        javascriptreact = ["biome"];
        typescriptreact = ["biome"];
        json = ["biome"];
        jsonc = ["biome"];
        yaml = ["biome"];
        markdown = ["biome"];
        html = ["biome"];
        css = ["biome"];
        scss = ["biome"];
        lua = ["stylua"];
        sh = ["shfmt"];
        bash = ["shfmt"];
      };
      default_format_opts = {
        lsp_format = "fallback";
      };
    };
  };

  extraConfigLua = ''
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  '';
}
