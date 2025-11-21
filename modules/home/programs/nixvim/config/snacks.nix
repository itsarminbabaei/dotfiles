# Snacks - Collection of modern utilities
# Docs: https://github.com/folke/snacks.nvim
# Modern features: picker (fuzzy), explorer, notifications, bigfile, scrolling hints, word highlights.

{
  plugins.snacks = {
    enable = true;

    settings = {
      bigfile = { enabled = true; };
      dashboard = { enabled = false; };
      explorer = {
        enabled = true;
        cwd = true;
      };
      indent = { enabled = false; };
      input = { enabled = true; };
      notifier = {
        enabled = true;
        timeout = 3000;
      };
      picker = {
        enabled = true;
        sources = {
          files = { hidden = true; };
        };
      };
      quickfile = { enabled = true; };
      scope = { enabled = true; };
      scroll = { enabled = true; };
      statuscolumn = { enabled = true; };
      words = { enabled = true; };
      styles = {
        notification = {};
      };
    };
  };

  extraConfigLua = ''
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        _G.dd = function(...) Snacks.debug.inspect(...) end
        _G.bt = function() Snacks.debug.backtrace() end
        vim.print = _G.dd
      end,
    })
  '';
}
