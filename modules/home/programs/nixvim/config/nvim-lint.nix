{
  plugins.nvim-lint = {
    enable = true;
    lintersByFt = {
      go = ["golangcilint"];
      lua = ["luacheck"];
      sh = ["shellcheck"];
      bash = ["shellcheck"];
      zsh = ["shellcheck"];
      fish = ["fish"];
      php = ["pint"];
    };
  };

  extraConfigLua = ''
    local lint = require("lint")
    
    -- Configure golangci-lint to ignore exit codes
    local golangcilint = lint.linters.golangcilint
    golangcilint.ignore_exitcode = true
    
    -- Configure Pint for Laravel
    lint.linters.pint = {
        cmd = "pint",
        stdin = false,
        args = { "--test" },
        stream = "stderr",
        ignore_exitcode = true,
        parser = function(output, bufnr)
            local diagnostics = {}
            if not output or output == "" then
                return diagnostics
            end
            if string.find(output, "FAIL") or string.find(output, "differs") then
                table.insert(diagnostics, {
                    lnum = 0,
                    col = 0,
                    message = "Code style issues found - run formatter to fix",
                    severity = vim.diagnostic.severity.WARN,
                    source = "pint"
                })
            end
            return diagnostics
        end,
    }
    
    -- Auto-lint on save and text changes
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
            local linters = lint.linters_by_ft[vim.bo.filetype]
            if linters and #linters > 0 then
                lint.try_lint()
            end
        end,
    })
  '';
}
