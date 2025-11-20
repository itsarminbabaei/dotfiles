{
  plugins.trouble = {
    enable = true;
    settings = {
      mode = "workspace_diagnostics";
      position = "bottom";
      height = 15;
      padding = false;
      action_keys = {
        close = "q";
        cancel = "<esc>";
        refresh = "r";
        jump = ["<cr>" "<tab>"];
        open_split = ["<c-x>"];
        open_vsplit = ["<c-v>"];
        open_tab = ["<c-t>"];
        jump_close = ["o"];
        toggle_mode = "m";
        toggle_preview = "P";
        hover = "K";
        preview = "p";
        close_folds = ["zM"];
        open_folds = ["zR"];
        toggle_fold = ["za"];
      };
      auto_jump = {};
      use_diagnostic_signs = true;
    };
  };

  keymaps = [
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
  ];
}
