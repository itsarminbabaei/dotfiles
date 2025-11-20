{
  plugins.gitsigns = {
    enable = true;
    settings = {
      signs = {
        add = {text = "┃";};
        change = {text = "┃";};
        delete = {text = "_";};
        topdelete = {text = "‾";};
        changedelete = {text = "~";};
        untracked = {text = "┆";};
      };
      signs_staged = {
        add = {text = "┃";};
        change = {text = "┃";};
        delete = {text = "_";};
        topdelete = {text = "‾";};
        changedelete = {text = "~";};
        untracked = {text = "┆";};
      };
      signcolumn = true;
      numhl = false;
      linehl = false;
      word_diff = false;
      watch_gitdir = {
        interval = 1000;
        follow_files = true;
      };
      attach_to_untracked = true;
      current_line_blame = false;
      current_line_blame_opts = {
        virt_text = true;
        virt_text_pos = "eol";
        delay = 1000;
        ignore_whitespace = false;
      };
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>";
      sign_priority = 6;
      status_formatter = null;
      update_debounce = 200;
      max_file_length = 40000;
      preview_config = {
        border = "rounded";
        style = "minimal";
        relative = "cursor";
        row = 0;
        col = 1;
      };
    };
  };

  plugins.diffview = {
    enable = true;
  };

  plugins.fugitive = {
    enable = true;
  };

  plugins.undotree = {
    enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>Gk";
      action = "<Cmd>lua require('gitsigns').prev_hunk({ navigation_message = false })<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Prev Hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>Gl";
      action = "<Cmd>lua require('gitsigns').blame_line()<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Blame";
      };
    }
    {
      mode = "n";
      key = "<leader>Gp";
      action = "<Cmd>lua require('gitsigns').preview_hunk()<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Preview Hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>Gr";
      action = "<Cmd>lua require('gitsigns').reset_hunk()<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Reset Hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>GR";
      action = "<Cmd>lua require('gitsigns').reset_buffer()<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Reset Buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>Gj";
      action = "<Cmd>lua require('gitsigns').next_hunk({ navigation_message = false })<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Next Hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>Gs";
      action = "<Cmd>lua require('gitsigns').stage_hunk()<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Stage Hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>Gu";
      action = "<Cmd>lua require('gitsigns').undo_stage_hunk()<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Undo Stage Hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>Gd";
      action = "<Cmd>Gitsigns diffthis HEAD<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Git Diff HEAD";
      };
    }
    {
      mode = "n";
      key = "<leader>GU";
      action = "<Cmd>UndotreeToggle<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Toggle UndoTree";
      };
    }
  ];
}
