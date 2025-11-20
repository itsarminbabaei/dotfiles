{
  keymaps = [
    # === Core Keybinds ===
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

    # === Telescope ===
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

    # === Harpoon ===
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

    # === Oil ===
    {
      mode = "n";
      key = "-";
      action = "<Cmd>Oil<CR>";
      options = { desc = "Open parent directory"; };
    }

    # === Conform ===
    {
      mode = ["n" "v"];
      key = "<leader>cf";
      action = "<Cmd>lua require('conform').format({ async = true })<CR>";
      options = { desc = "Format buffer"; };
    }

    # === Mason ===
    {
      mode = "n";
      key = "<leader>cm";
      action = "<Cmd>Mason<CR>";
      options = { desc = "Mason"; };
    }

    # === Neotest ===
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

    # === Navbuddy ===
    {
      mode = "n";
      key = "<leader>nb";
      action = "<Cmd>Navbuddy<CR>";
      options = { desc = "Navbuddy"; };
    }

    # === Twilight ===
    {
      mode = "n";
      key = "<leader>uT";
      action = "<Cmd>Twilight<CR>";
      options = { desc = "Toggle Twilight"; };
    }

    # === DAP ===
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

    # === Which-Key ===
    {
      mode = "n";
      key = "<leader>?";
      action = "<Cmd>lua require('which-key').show({ global = false })<CR>";
      options = { desc = "Buffer Local Keymaps (which-key)"; };
    }

    # === Avante ===
    {
      mode = "n";
      key = "<leader>aa";
      action = "<Cmd>AvanteAsk<CR>";
      options = { desc = "Avante Ask"; };
    }
    {
      mode = "v";
      key = "<leader>aa";
      action = "<Cmd>AvanteAsk<CR>";
      options = { desc = "Avante Ask"; };
    }

    # === Linter ===
    {
      mode = "n";
      key = "<leader>ll";
      action = "<Cmd>lua require('lint').try_lint()<CR>";
      options = { desc = "Trigger linting for current file"; };
    }

    # === LazyGit ===
    {
      mode = "n";
      key = "<leader>gg";
      action = "<Cmd>LazyGit<CR>";
      options = { desc = "LazyGit"; };
    }
  ];
}
