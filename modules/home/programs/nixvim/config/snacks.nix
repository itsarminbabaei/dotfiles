{
  plugins.snacks = {
    enable = true;

    settings = {
      bigfile = { enabled = true; };
      dashboard = { enabled = true; };
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

  keymaps = [
    # Top Pickers & Explorer
    { mode = "n"; key = "<leader><space>"; action = "<cmd>lua Snacks.picker.smart()<CR>"; options = { desc = "Smart Find Files"; }; }
    { mode = "n"; key = "<leader>/"; action = "<cmd>lua Snacks.picker.grep()<CR>"; options = { desc = "Grep"; }; }
    { mode = "n"; key = "<leader>:"; action = "<cmd>lua Snacks.picker.command_history()<CR>"; options = { desc = "Command History"; }; }
    { mode = "n"; key = "<leader>sn"; action = "<cmd>lua Snacks.picker.notifications()<CR>"; options = { desc = "Search Notifications"; }; }
    { mode = "n"; key = "<leader>e"; action = "<cmd>lua Snacks.explorer()<CR>"; options = { desc = "File Explorer"; }; }

    # Find
    { mode = "n"; key = "<leader>fc"; action = "<cmd>lua Snacks.picker.files({ cwd = vim.fn.stdpath('config') })<CR>"; options = { desc = "Find Config File"; }; }
    { mode = "n"; key = "<leader>ff"; action = "<cmd>lua Snacks.picker.files()<CR>"; options = { desc = "Find Files"; }; }
    { mode = "n"; key = "<leader>fg"; action = "<cmd>lua Snacks.picker.git_files()<CR>"; options = { desc = "Find Git Files"; }; }
    { mode = "n"; key = "<leader>fp"; action = "<cmd>lua Snacks.picker.projects()<CR>"; options = { desc = "Projects"; }; }
    { mode = "n"; key = "<leader>fr"; action = "<cmd>lua Snacks.picker.recent()<CR>"; options = { desc = "Recent"; }; }

    # Git
    { mode = "n"; key = "<leader>gb"; action = "<cmd>lua Snacks.picker.git_branches()<CR>"; options = { desc = "Git Branches"; }; }
    { mode = "n"; key = "<leader>gl"; action = "<cmd>lua Snacks.picker.git_log()<CR>"; options = { desc = "Git Log"; }; }
    { mode = "n"; key = "<leader>gL"; action = "<cmd>lua Snacks.picker.git_log_line()<CR>"; options = { desc = "Git Log Line"; }; }
    { mode = "n"; key = "<leader>gs"; action = "<cmd>lua Snacks.picker.git_status()<CR>"; options = { desc = "Git Status"; }; }
    { mode = "n"; key = "<leader>gS"; action = "<cmd>lua Snacks.picker.git_stash()<CR>"; options = { desc = "Git Stash"; }; }
    { mode = "n"; key = "<leader>gd"; action = "<cmd>lua Snacks.picker.git_diff()<CR>"; options = { desc = "Git Diff (Hunks)"; }; }
    { mode = "n"; key = "<leader>gf"; action = "<cmd>lua Snacks.picker.git_log_file()<CR>"; options = { desc = "Git Log File"; }; }

    # Grep
    { mode = "n"; key = "<leader>sb"; action = "<cmd>lua Snacks.picker.lines()<CR>"; options = { desc = "Buffer Lines"; }; }
    { mode = "n"; key = "<C-s>"; action = "<cmd>lua Snacks.picker.grep_buffers()<CR>"; options = { desc = "Grep Open Buffers"; }; }
    { mode = "n"; key = "<leader>st"; action = "<cmd>lua Snacks.picker.grep()<CR>"; options = { desc = "Grep"; }; }
    { mode = ["n" "x"]; key = "<leader>sw"; action = "<cmd>lua Snacks.picker.grep_word()<CR>"; options = { desc = "Visual selection or word"; }; }

    # Search
    { mode = "n"; key = "<leader>s\""; action = "<cmd>lua Snacks.picker.registers()<CR>"; options = { desc = "Registers"; }; }
    { mode = "n"; key = "<leader>s/"; action = "<cmd>lua Snacks.picker.search_history()<CR>"; options = { desc = "Search History"; }; }
    { mode = "n"; key = "<leader>sa"; action = "<cmd>lua Snacks.picker.autocmds()<CR>"; options = { desc = "Autocmds"; }; }
    { mode = "n"; key = "<leader>sc"; action = "<cmd>lua Snacks.picker.command_history()<CR>"; options = { desc = "Command History"; }; }
    { mode = "n"; key = "<leader>sC"; action = "<cmd>lua Snacks.picker.commands()<CR>"; options = { desc = "Commands"; }; }
    { mode = "n"; key = "<leader>sd"; action = "<cmd>lua Snacks.picker.diagnostics()<CR>"; options = { desc = "Diagnostics"; }; }
    { mode = "n"; key = "<leader>sD"; action = "<cmd>lua Snacks.picker.diagnostics_buffer()<CR>"; options = { desc = "Buffer Diagnostics"; }; }
    { mode = "n"; key = "<leader>sh"; action = "<cmd>lua Snacks.picker.help()<CR>"; options = { desc = "Help Pages"; }; }
    { mode = "n"; key = "<leader>sH"; action = "<cmd>lua Snacks.picker.highlights()<CR>"; options = { desc = "Highlights"; }; }
    { mode = "n"; key = "<leader>si"; action = "<cmd>lua Snacks.picker.icons()<CR>"; options = { desc = "Icons"; }; }
    { mode = "n"; key = "<leader>sj"; action = "<cmd>lua Snacks.picker.jumps()<CR>"; options = { desc = "Jumps"; }; }
    { mode = "n"; key = "<leader>sk"; action = "<cmd>lua Snacks.picker.keymaps()<CR>"; options = { desc = "Keymaps"; }; }
    { mode = "n"; key = "<leader>sl"; action = "<cmd>lua Snacks.picker.loclist()<CR>"; options = { desc = "Location List"; }; }
    { mode = "n"; key = "<leader>sm"; action = "<cmd>lua Snacks.picker.marks()<CR>"; options = { desc = "Marks"; }; }
    { mode = "n"; key = "<leader>sM"; action = "<cmd>lua Snacks.picker.man()<CR>"; options = { desc = "Man Pages"; }; }
    { mode = "n"; key = "<leader>sp"; action = "<cmd>lua Snacks.picker.lazy()<CR>"; options = { desc = "Search for Plugin Spec"; }; }
    { mode = "n"; key = "<leader>sq"; action = "<cmd>lua Snacks.picker.qflist()<CR>"; options = { desc = "Quickfix List"; }; }
    { mode = "n"; key = "<leader>sR"; action = "<cmd>lua Snacks.picker.resume()<CR>"; options = { desc = "Resume"; }; }
    { mode = "n"; key = "<leader>su"; action = "<cmd>lua Snacks.picker.undo()<CR>"; options = { desc = "Undo History"; }; }
    { mode = "n"; key = "<leader>uC"; action = "<cmd>lua Snacks.picker.colorschemes()<CR>"; options = { desc = "Colorschemes"; }; }

    # LSP
    { mode = "n"; key = "gd"; action = "<cmd>lua Snacks.picker.lsp_definitions()<CR>"; options = { desc = "Goto Definition"; }; }
    { mode = "n"; key = "gD"; action = "<cmd>lua Snacks.picker.lsp_declarations()<CR>"; options = { desc = "Goto Declaration"; }; }
    { mode = "n"; key = "gr"; action = "<cmd>lua Snacks.picker.lsp_references()<CR>"; options = { desc = "References"; nowait = true; }; }
    { mode = "n"; key = "gI"; action = "<cmd>lua Snacks.picker.lsp_implementations()<CR>"; options = { desc = "Goto Implementation"; }; }
    { mode = "n"; key = "gy"; action = "<cmd>lua Snacks.picker.lsp_type_definitions()<CR>"; options = { desc = "Goto T[y]pe Definition"; }; }
    { mode = "n"; key = "<leader>p"; action = "<cmd>lua Snacks.picker.lsp_symbols()<CR>"; options = { desc = "LSP Symbols"; }; }
    { mode = "n"; key = "<leader>WS"; action = "<cmd>lua Snacks.picker.lsp_workspace_symbols()<CR>"; options = { desc = "LSP Workspace Symbols"; }; }

    # Other
    { mode = "n"; key = "<leader>z"; action = "<cmd>lua Snacks.zen()<CR>"; options = { desc = "Toggle Zen Mode"; }; }
    { mode = "n"; key = "<leader>Z"; action = "<cmd>lua Snacks.zen.zoom()<CR>"; options = { desc = "Toggle Zoom"; }; }
    { mode = "n"; key = "<leader>."; action = "<cmd>lua Snacks.scratch()<CR>"; options = { desc = "Toggle Scratch Buffer"; }; }
    { mode = "n"; key = "<leader>S"; action = "<cmd>lua Snacks.scratch.select()<CR>"; options = { desc = "Select Scratch Buffer"; }; }
    { mode = "n"; key = "<leader>n"; action = "<cmd>lua Snacks.notifier.show_history()<CR>"; options = { desc = "Notification History"; }; }
    { mode = "n"; key = "Q"; action = "<cmd>lua Snacks.bufdelete()<CR>"; options = { desc = "Delete Buffer"; }; }
    { mode = "n"; key = "<leader>cR"; action = "<cmd>lua Snacks.rename.rename_file()<CR>"; options = { desc = "Rename File"; }; }
    { mode = ["n" "v"]; key = "<leader>gB"; action = "<cmd>lua Snacks.gitbrowse()<CR>"; options = { desc = "Git Browse"; }; }
    { mode = "n"; key = "<leader>gg"; action = "<cmd>lua Snacks.lazygit()<CR>"; options = { desc = "Lazygit"; }; }
    { mode = "n"; key = "<leader>un"; action = "<cmd>lua Snacks.notifier.hide()<CR>"; options = { desc = "Dismiss All Notifications"; }; }
    { mode = "n"; key = "<c-/>"; action = "<cmd>lua Snacks.terminal()<CR>"; options = { desc = "Toggle Terminal"; }; }
    { mode = "n"; key = "<c-_>"; action = "<cmd>lua Snacks.terminal()<CR>"; options = { desc = "which_key_ignore"; }; }
    { mode = ["n" "t"]; key = "]]"; action = "<cmd>lua Snacks.words.jump(vim.v.count1)<CR>"; options = { desc = "Next Reference"; }; }
    { mode = ["n" "t"]; key = "[["; action = "<cmd>lua Snacks.words.jump(-vim.v.count1)<CR>"; options = { desc = "Prev Reference"; }; }
  ];

  extraConfigLua = ''
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        _G.dd = function(...) Snacks.debug.inspect(...) end
        _G.bt = function() Snacks.debug.backtrace() end
        vim.print = _G.dd

        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
        Snacks.toggle.treesitter():map("<leader>uT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
        Snacks.toggle.inlay_hints():map("<leader>uh")
        Snacks.toggle.indent():map("<leader>ug")
        Snacks.toggle.dim():map("<leader>uD")
      end,
    })
  '';
}
