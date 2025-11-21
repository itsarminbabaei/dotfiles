# Git - Gitsigns, Diffview, Fugitive, Undotree
# Gitsigns: https://github.com/lewis6991/gitsigns.nvim
# Shows git status in line decorations. Includes diffview, fugitive, undotree for diffs/history.

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
}
