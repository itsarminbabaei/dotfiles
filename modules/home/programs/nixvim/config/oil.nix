# Oil - File explorer
# Docs: https://github.com/stevearc/oil.nvim
# Edit filesystem as if editing text. Elegant file browsing and manipulation.

{
  # Oil - File explorer
  # Docs: https://github.com/stevearc/oil.nvim
  # Edit filesystem as if editing text. Elegant file browsing and manipulation.

  plugins.oil = {
    enable = true;
    settings = {
      # File explorer behavior
      default_file_explorer = false;
      skip_confirm_for_simple_edits = false;
      prompt_save_on_select_new_write = true;
      cleanup_delay_ms = 2000;
      constrain_cursor_to_editable = true;
      watch_for_changes = true;

      # Display columns
      columns = [
        "icon"
      ];

      # View options
      view_options = {
        show_hidden = true;
        is_hidden_file.__raw = ''
          function(name, bufnr)
            return vim.startswith(name, ".")
          end
        '';
        is_always_hidden.__raw = ''
          function(name, bufnr)
            return false
          end
        '';
      };

      # Float window customization
      float = {
        override.__raw = ''
          function(conf)
            return conf
          end
        '';
      };

      # LSP file operations
      lsp_file_methods = {
        enabled = true;
        autosave_changes = "unmodified";
      };

      # Window options
      win_options = {
        statusline = "";
        showtabline = 0;
        wrap = false;
        signcolumn = "yes:2";
        cursorcolumn = false;
        foldcolumn = "0";
        spell = false;
        list = false;
        conceallevel = 3;
        concealcursor = "nvic";
      };


    };
  };
}
