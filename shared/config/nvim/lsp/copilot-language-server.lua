local lspconfig = require("lspconfig")

if not lspconfig.configs.copilot_language_server then
  lspconfig.configs.copilot_language_server = {
    default_config = {
      cmd = { "copilot-language-server", "--stdio" },
      filetypes = { "python", "rust", "zig", }, -- add/remove any languages you need
      root_dir = function(fname)
        return lspconfig.util.find_git_ancestor(fname) or vim.loop.os_homedir()
      end,
      settings = {},
    },
  }
end

lspconfig.copilot_language_server.setup({})

