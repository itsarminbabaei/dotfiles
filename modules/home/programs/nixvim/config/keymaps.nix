{
  keymaps = [
    # Core Keybinds
    # Move selected line / block of text in visual mode
    {
      mode = "v";
      key = "J";
      action = ":m '>+1<CR>gv=gv";
      options = { noremap = true; silent = true; };
    }
    {
      mode = "v";
      key = "K";
      action = ":m '<-2<CR>gv=gv";
      options = { noremap = true; silent = true; };
    }

    # Remap for dealing with visual line wraps
    {
      mode = "n";
      key = "k";
      action = "v:count == 0 ? 'gk' : 'k'";
      options = { expr = true; noremap = true; silent = true; };
    }
    {
      mode = "n";
      key = "j";
      action = "v:count == 0 ? 'gj' : 'j'";
      options = { expr = true; noremap = true; silent = true; };
    }

    # Better indenting
    {
      mode = "v";
      key = "<";
      action = "<gv";
      options = { noremap = true; silent = true; };
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
      options = { noremap = true; silent = true; };
    }

    # Paste over currently selected text without yanking it
    {
      mode = "v";
      key = "p";
      action = "\"_dp";
      options = { noremap = true; silent = true; };
    }
    {
      mode = "v";
      key = "P";
      action = "\"_dP";
      options = { noremap = true; silent = true; };
    }

    # Copy everything between { and } including the brackets
    {
      mode = "n";
      key = "YY";
      action = "va{Vy";
      options = { noremap = true; silent = true; };
    }

    # Exit on jj and jk
    {
      mode = "i";
      key = "jj";
      action = "<ESC>";
      options = { noremap = true; silent = true; };
    }
    {
      mode = "i";
      key = "jk";
      action = "<ESC>";
      options = { noremap = true; silent = true; };
    }

    # Move to start/end of line
    {
      mode = ["n" "x" "o"];
      key = "H";
      action = "^";
      options = { noremap = true; silent = true; };
    }
    {
      mode = ["n" "x" "o"];
      key = "L";
      action = "g_";
      options = { noremap = true; silent = true; };
    }

    # Navigate buffers
    {
      mode = "n";
      key = "<Right>";
      action = ":bnext<CR>";
      options = { noremap = true; silent = true; };
    }
    {
      mode = "n";
      key = "<Left>";
      action = ":bprevious<CR>";
      options = { noremap = true; silent = true; };
    }

    # Clear highlights
    {
      mode = "n";
      key = "<Esc>";
      action = ":nohlsearch<CR>";
      options = { noremap = true; silent = true; };
    }

    # Telescope
    {
      mode = "n";
      key = "<leader>ff";
      action = "<Cmd>Telescope find_files<CR>";
      options = { desc = "Find files"; };
    }
    {
      mode = "n";
      key = "<leader>fw";
      action = "<Cmd>Telescope live_grep<CR>";
      options = { desc = "Find word"; };
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = "<Cmd>Telescope buffers<CR>";
      options = { desc = "Find buffers"; };
    }
    {
      mode = "n";
      key = "<leader>fh";
      action = "<Cmd>Telescope help_tags<CR>";
      options = { desc = "Find help"; };
    }

    # Harpoon
    {
      mode = "n";
      key = "<leader>ha";
      action = "<Cmd>lua require('harpoon.mark').add_file()<CR>";
      options = { desc = "Harpoon add file"; };
    }
    {
      mode = "n";
      key = "<leader>hm";
      action = "<Cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>";
      options = { desc = "Harpoon menu"; };
    }
    {
      mode = "n";
      key = "<leader>h1";
      action = "<Cmd>lua require('harpoon.ui').nav_file(1)<CR>";
      options = { desc = "Harpoon file 1"; };
    }
    {
      mode = "n";
      key = "<leader>h2";
      action = "<Cmd>lua require('harpoon.ui').nav_file(2)<CR>";
      options = { desc = "Harpoon file 2"; };
    }
    {
      mode = "n";
      key = "<leader>h3";
      action = "<Cmd>lua require('harpoon.ui').nav_file(3)<CR>";
      options = { desc = "Harpoon file 3"; };
    }
    {
      mode = "n";
      key = "<leader>h4";
      action = "<Cmd>lua require('harpoon.ui').nav_file(4)<CR>";
      options = { desc = "Harpoon file 4"; };
    }

    # Oil
    {
      mode = "n";
      key = "-";
      action = "<Cmd>Oil<CR>";
      options = { desc = "Open parent directory"; };
    }
    {
      mode = "n";
      key = "<CR>";
      action = "<Cmd>lua require('oil.actions').select({ vertical = true })<CR>";
      options = { desc = "Open in vertical split"; noremap = true; silent = true; };
    }

    # Snacks Explorer
    {
      mode = "n";
      key = "<leader>e";
      action = "<Cmd>lua Snacks.explorer()<CR>";
      options = { desc = "File Explorer"; };
    }

    # Conform
    {
      mode = ["n" "v"];
      key = "<leader>cf";
      action = "<Cmd>lua require('conform').format({ async = true })<CR>";
      options = { desc = "Format buffer"; };
    }

    # Neotest
    {
      mode = "n";
      key = "<leader>tr";
      action = "<Cmd>lua require('neotest').run.run()<CR>";
      options = { desc = "Run nearest test"; };
    }
    {
      mode = "n";
      key = "<leader>tf";
      action = "<Cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>";
      options = { desc = "Run file tests"; };
    }
    {
      mode = "n";
      key = "<leader>ts";
      action = "<Cmd>lua require('neotest').summary.toggle()<CR>";
      options = { desc = "Toggle test summary"; };
    }

    # Navbuddy
    {
      mode = "n";
      key = "<leader>nb";
      action = "<Cmd>Navbuddy<CR>";
      options = { desc = "Navbuddy"; };
    }

    # Snacks Toggles
    {
      mode = "n";
      key = "<leader>us";
      action = "<Cmd>lua Snacks.toggle.option('spell', { name = 'Spelling' }):toggle()<CR>";
      options = { desc = "Toggle Spelling"; };
    }
    {
      mode = "n";
      key = "<leader>uw";
      action = "<Cmd>lua Snacks.toggle.option('wrap', { name = 'Wrap' }):toggle()<CR>";
      options = { desc = "Toggle Wrap"; };
    }
    {
      mode = "n";
      key = "<leader>uL";
      action = "<Cmd>lua Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):toggle()<CR>";
      options = { desc = "Toggle Relative Number"; };
    }
    {
      mode = "n";
      key = "<leader>ud";
      action = "<Cmd>lua Snacks.toggle.diagnostics():toggle()<CR>";
      options = { desc = "Toggle Diagnostics"; };
    }
    {
      mode = "n";
      key = "<leader>ul";
      action = "<Cmd>lua Snacks.toggle.line_number():toggle()<CR>";
      options = { desc = "Toggle Line Number"; };
    }
    {
      mode = "n";
      key = "<leader>uc";
      action = "<Cmd>lua Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):toggle()<CR>";
      options = { desc = "Toggle Conceal Level"; };
    }
    {
      mode = "n";
      key = "<leader>uT";
      action = "<Cmd>lua Snacks.toggle.treesitter():toggle()<CR>";
      options = { desc = "Toggle Treesitter"; };
    }
    {
      mode = "n";
      key = "<leader>ub";
      action = "<Cmd>lua Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):toggle()<CR>";
      options = { desc = "Toggle Dark Background"; };
    }
    {
      mode = "n";
      key = "<leader>uh";
      action = "<Cmd>lua Snacks.toggle.inlay_hints():toggle()<CR>";
      options = { desc = "Toggle Inlay Hints"; };
    }
    {
      mode = "n";
      key = "<leader>ug";
      action = "<Cmd>lua Snacks.toggle.indent():toggle()<CR>";
      options = { desc = "Toggle Indent"; };
    }
    {
      mode = "n";
      key = "<leader>uD";
      action = "<Cmd>lua Snacks.toggle.dim():toggle()<CR>";
      options = { desc = "Toggle Dim"; };
    }

    # DAP
    {
      mode = "n";
      key = "<leader>Db";
      action = "<Cmd>lua require('dap').toggle_breakpoint()<CR>";
      options = { desc = "Toggle breakpoint"; };
    }
    {
      mode = "n";
      key = "<leader>Dc";
      action = "<Cmd>lua require('dap').continue()<CR>";
      options = { desc = "Continue"; };
    }
    {
      mode = "n";
      key = "<leader>Dsi";
      action = "<Cmd>lua require('dap').step_into()<CR>";
      options = { desc = "Step into"; };
    }
    {
      mode = "n";
      key = "<leader>Dso";
      action = "<Cmd>lua require('dap').step_over()<CR>";
      options = { desc = "Step over"; };
    }
    {
      mode = "n";
      key = "<leader>Du";
      action = "<Cmd>lua require('dapui').toggle()<CR>";
      options = { desc = "DAP UI toggle"; };
    }

    # Which-Key
    {
      mode = "n";
      key = "<leader>?";
      action = "<Cmd>lua require('which-key').show({ global = false })<CR>";
      options = { desc = "Buffer Local Keymaps (which-key)"; };
    }

    # LSP Navigation (via Trouble)
    {
      mode = "n";
      key = "gd";
      action = "<Cmd>Trouble lsp_definitions<CR>";
      options = { desc = "Go to definition"; };
    }
    {
      mode = "n";
      key = "gr";
      action = "<Cmd>Trouble lsp_references<CR>";
      options = { desc = "Go to references"; };
    }
    {
      mode = "n";
      key = "gi";
      action = "<Cmd>Trouble lsp_implementations<CR>";
      options = { desc = "Go to implementation"; };
    }
    {
      mode = "n";
      key = "gy";
      action = "<Cmd>Trouble lsp_type_definitions<CR>";
      options = { desc = "Go to type definition"; };
    }

    # Git (Gitsigns)
    {
      mode = "n";
      key = "<leader>Gk";
      action = "<Cmd>lua require('gitsigns').prev_hunk({ navigation_message = false })<CR>";
      options = { noremap = true; silent = true; desc = "Prev Hunk"; };
    }
    {
      mode = "n";
      key = "<leader>Gl";
      action = "<Cmd>lua require('gitsigns').blame_line()<CR>";
      options = { noremap = true; silent = true; desc = "Blame"; };
    }
    {
      mode = "n";
      key = "<leader>Gp";
      action = "<Cmd>lua require('gitsigns').preview_hunk()<CR>";
      options = { noremap = true; silent = true; desc = "Preview Hunk"; };
    }
    {
      mode = "n";
      key = "<leader>Gr";
      action = "<Cmd>lua require('gitsigns').reset_hunk()<CR>";
      options = { noremap = true; silent = true; desc = "Reset Hunk"; };
    }
    {
      mode = "n";
      key = "<leader>GR";
      action = "<Cmd>lua require('gitsigns').reset_buffer()<CR>";
      options = { noremap = true; silent = true; desc = "Reset Buffer"; };
    }
    {
      mode = "n";
      key = "<leader>Gj";
      action = "<Cmd>lua require('gitsigns').next_hunk({ navigation_message = false })<CR>";
      options = { noremap = true; silent = true; desc = "Next Hunk"; };
    }
    {
      mode = "n";
      key = "<leader>Gs";
      action = "<Cmd>lua require('gitsigns').stage_hunk()<CR>";
      options = { noremap = true; silent = true; desc = "Stage Hunk"; };
    }
    {
      mode = "n";
      key = "<leader>Gu";
      action = "<Cmd>lua require('gitsigns').undo_stage_hunk()<CR>";
      options = { noremap = true; silent = true; desc = "Undo Stage Hunk"; };
    }
    {
      mode = "n";
      key = "<leader>Gd";
      action = "<Cmd>Gitsigns diffthis HEAD<CR>";
      options = { noremap = true; silent = true; desc = "Git Diff HEAD"; };
    }
    {
      mode = "n";
      key = "<leader>GU";
      action = "<Cmd>UndotreeToggle<CR>";
      options = { noremap = true; silent = true; desc = "Toggle UndoTree"; };
    }

    # LazyGit
    {
      mode = "n";
      key = "<leader>gg";
      action = "<Cmd>LazyGit<CR>";
      options = { desc = "LazyGit"; };
    }

    # Trouble
    {
      mode = "n";
      key = "<leader>xx";
      action = "<cmd>Trouble diagnostics toggle<cr>";
      options = { desc = "Diagnostics (Trouble)"; };
    }
    {
      mode = "n";
      key = "<leader>xX";
      action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
      options = { desc = "Buffer Diagnostics (Trouble)"; };
    }
    {
      mode = "n";
      key = "<leader>cs";
      action = "<cmd>Trouble symbols toggle focus=false<cr>";
      options = { desc = "Symbols (Trouble)"; };
    }
    {
      mode = "n";
      key = "<leader>cl";
      action = "<cmd>Trouble lsp toggle focus=false win.position=right<cr>";
      options = { desc = "LSP Definitions / references / ... (Trouble)"; };
    }
    {
      mode = "n";
      key = "<leader>xL";
      action = "<cmd>Trouble loclist toggle<cr>";
      options = { desc = "Location List (Trouble)"; };
    }
    {
      mode = "n";
      key = "<leader>xQ";
      action = "<cmd>Trouble qflist toggle<cr>";
      options = { desc = "Quickfix List (Trouble)"; };
    }

    # Treesitter Incremental Selection
    {
      mode = "n";
      key = "<leader>vv";
      action = "<Cmd>lua require'nvim-treesitter.incremental_selection'.init_selection()<CR>";
      options = { desc = "Init selection"; };
    }
    {
      mode = "n";
      key = "+";
      action = "<Cmd>lua require'nvim-treesitter.incremental_selection'.node_incremental()<CR>";
      options = { desc = "Node incremental"; };
    }
    {
      mode = "n";
      key = "_";
      action = "<Cmd>lua require'nvim-treesitter.incremental_selection'.node_decremental()<CR>";
      options = { desc = "Node decremental"; };
    }

    # Treesitter Textobjects: Select
    {
      mode = "n";
      key = "af";
      action = "<Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('af')<CR>";
      options = { desc = "Select outer function"; };
    }
    {
      mode = "n";
      key = "if";
      action = "<Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('if')<CR>";
      options = { desc = "Select inner function"; };
    }
    {
      mode = "n";
      key = "ac";
      action = "<Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('ac')<CR>";
      options = { desc = "Select outer class"; };
    }
    {
      mode = "n";
      key = "ic";
      action = "<Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('ic')<CR>";
      options = { desc = "Select inner class"; };
    }
    {
      mode = "n";
      key = "ai";
      action = "<Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('ai')<CR>";
      options = { desc = "Select outer conditional"; };
    }
    {
      mode = "n";
      key = "ii";
      action = "<Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('ii')<CR>";
      options = { desc = "Select inner conditional"; };
    }
    {
      mode = "n";
      key = "al";
      action = "<Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('al')<CR>";
      options = { desc = "Select outer loop"; };
    }
    {
      mode = "n";
      key = "il";
      action = "<Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('il')<CR>";
      options = { desc = "Select inner loop"; };
    }
    {
      mode = "n";
      key = "ap";
      action = "<Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('ap')<CR>";
      options = { desc = "Select outer parameter"; };
    }
    {
      mode = "n";
      key = "ip";
      action = "<Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('ip')<CR>";
      options = { desc = "Select inner parameter"; };
    }

    # Treesitter Textobjects: Move
    {
      mode = "n";
      key = "[f";
      action = "<Cmd>lua require'nvim-treesitter.textobjects.move'.goto_previous_start('@function.outer')<CR>";
      options = { desc = "Previous function"; };
    }
    {
      mode = "n";
      key = "[c";
      action = "<Cmd>lua require'nvim-treesitter.textobjects.move'.goto_previous_start('@class.outer')<CR>";
      options = { desc = "Previous class"; };
    }
    {
      mode = "n";
      key = "[p";
      action = "<Cmd>lua require'nvim-treesitter.textobjects.move'.goto_previous_start('@parameter.inner')<CR>";
      options = { desc = "Previous parameter"; };
    }
    {
      mode = "n";
      key = "]f";
      action = "<Cmd>lua require'nvim-treesitter.textobjects.move'.goto_next_start('@function.outer')<CR>";
      options = { desc = "Next function"; };
    }
    {
      mode = "n";
      key = "]c";
      action = "<Cmd>lua require'nvim-treesitter.textobjects.move'.goto_next_start('@class.outer')<CR>";
      options = { desc = "Next class"; };
    }
    {
      mode = "n";
      key = "]p";
      action = "<Cmd>lua require'nvim-treesitter.textobjects.move'.goto_next_start('@parameter.inner')<CR>";
      options = { desc = "Next parameter"; };
    }

    # Treesitter Textobjects: Swap
    {
      mode = "n";
      key = "<leader>a";
      action = "<Cmd>lua require'nvim-treesitter.textobjects.swap'.swap_next('@parameter.inner')<CR>";
      options = { desc = "Swap with next parameter"; };
    }
    {
      mode = "n";
      key = "<leader>A";
      action = "<Cmd>lua require'nvim-treesitter.textobjects.swap'.swap_previous('@parameter.inner')<CR>";
      options = { desc = "Swap with previous parameter"; };
    }

    # Indent Navigation (for code blocks)
    {
      mode = "n";
      key = "[[";
      action = "<Cmd>lua require'nvim-treesitter.textobjects.move'.goto_previous_start('@class.outer')<CR>";
      options = { desc = "Previous class"; };
    }
    {
      mode = "n";
      key = "]]";
      action = "<Cmd>lua require'nvim-treesitter.textobjects.move'.goto_next_start('@class.outer')<CR>";
      options = { desc = "Next class"; };
    }

    # Node incremental/decremental
    {
      mode = "n";
      key = "+";
      action = "<Cmd>lua require'nvim-treesitter.incremental_selection'.node_incremental()<CR>";
      options = { desc = "Increment selection"; };
    }
    {
      mode = "n";
      key = "_";
      action = "<Cmd>lua require'nvim-treesitter.incremental_selection'.node_decremental()<CR>";
      options = { desc = "Decrement selection"; };
    }

    # Flash
    {
      mode = ["n" "x" "o"];
      key = "s";
      action = "<Cmd>lua require('flash').jump()<CR>";
      options = { desc = "Flash"; };
    }
    {
      mode = ["n" "x" "o"];
      key = "S";
      action = "<Cmd>lua require('flash').treesitter()<CR>";
      options = { desc = "Flash Treesitter"; };
    }
    {
      mode = "o";
      key = "r";
      action = "<Cmd>lua require('flash').remote()<CR>";
      options = { desc = "Remote Flash"; };
    }
    {
      mode = ["o" "x"];
      key = "R";
      action = "<Cmd>lua require('flash').treesitter_search()<CR>";
      options = { desc = "Treesitter Search"; };
    }
    {
      mode = "c";
      key = "<C-s>";
      action = "<Cmd>lua require('flash').toggle()<CR>";
      options = { desc = "Toggle Flash Search"; };
    }

    # Mini Surround
    {
      mode = ["n" "x"];
      key = "sa";
      action = "<Cmd>lua require('mini.surround').add('visual')<CR>";
      options = { desc = "Add surrounding"; };
    }
    {
      mode = "n";
      key = "sd";
      action = "<Cmd>lua require('mini.surround').delete()<CR>";
      options = { desc = "Delete surrounding"; };
    }
    {
      mode = "n";
      key = "sr";
      action = "<Cmd>lua require('mini.surround').replace()<CR>";
      options = { desc = "Replace surrounding"; };
    }
    {
      mode = "n";
      key = "sh";
      action = "<Cmd>lua require('mini.surround').highlight()<CR>";
      options = { desc = "Highlight surrounding"; };
    }
    {
      mode = "n";
      key = "sf";
      action = "<Cmd>lua require('mini.surround').find('right')<CR>";
      options = { desc = "Find right surrounding"; };
    }
    {
      mode = "n";
      key = "sF";
      action = "<Cmd>lua require('mini.surround').find('left')<CR>";
      options = { desc = "Find left surrounding"; };
    }

    # Comment Toggle
    {
      mode = "n";
      key = "gcc";
      action = "<Cmd>lua require('Comment.api').toggle.linewise()<CR>";
      options = { desc = "Toggle line comment"; };
    }
    {
      mode = "n";
      key = "gbc";
      action = "<Cmd>lua require('Comment.api').toggle.blockwise()<CR>";
      options = { desc = "Toggle block comment"; };
    }
    {
      mode = "x";
      key = "gc";
      action = "<Cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>";
      options = { desc = "Toggle line comment"; };
    }
    {
      mode = "x";
      key = "gb";
      action = "<Cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<CR>";
      options = { desc = "Toggle block comment"; };
    }

    # Persistence
    {
      mode = "n";
      key = "<leader>qs";
      action = "<Cmd>lua require('persistence').load()<CR>";
      options = { desc = "Load current session"; };
    }
    {
      mode = "n";
      key = "<leader>qS";
      action = "<Cmd>lua require('persistence').select()<CR>";
      options = { desc = "Select session"; };
    }
    {
      mode = "n";
      key = "<leader>ql";
      action = "<Cmd>lua require('persistence').load({ last = true })<CR>";
      options = { desc = "Load last session"; };
    }
    {
      mode = "n";
      key = "<leader>qd";
      action = "<Cmd>lua require('persistence').stop()<CR>";
      options = { desc = "Disable session persistence"; };
    }

    # Tmux Navigator
    {
      mode = "n";
      key = "<C-h>";
      action = "<Cmd>TmuxNavigateLeft<CR>";
      options = { noremap = true; silent = true; };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<Cmd>TmuxNavigateDown<CR>";
      options = { noremap = true; silent = true; };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<Cmd>TmuxNavigateUp<CR>";
      options = { noremap = true; silent = true; };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<Cmd>TmuxNavigateRight<CR>";
      options = { noremap = true; silent = true; };
    }
    {
      mode = "n";
      key = "<C-\\>";
      action = "<Cmd>TmuxNavigatePrevious<CR>";
      options = { noremap = true; silent = true; };
    }

      # Note: Keymaps handled by supermaven.nix settings, not here
    # These are for reference/documentation
    # <C-a> - Accept suggestion (configured in supermaven.nix)
    # <C-e> - Dismiss suggestion (configured in supermaven.nix)
    # <C-j> - Accept next word (configured in supermaven.nix)
    ];
    }


