{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        go = ["goimports" "gofmt"];
        lua = ["stylua"];
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
        python = ["isort" "black"];
        php = ["pint"];
        sh = ["shfmt"];
        bash = ["shfmt"];
        rust = ["rustfmt"];
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
