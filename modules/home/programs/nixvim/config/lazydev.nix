# LazyDev - Lua dev environment
# Docs: https://github.com/folke/lazydev.nvim
# Dev environment for Nvim API, provides type hints for Lua configuration files.

{
  plugins.lazydev = {
    enable = true;
    settings = {
      library = [
        {
          path = "\${3rd}/luv/library";
          words = ["vim.uv"];
        }
      ];
    };
  };
}
