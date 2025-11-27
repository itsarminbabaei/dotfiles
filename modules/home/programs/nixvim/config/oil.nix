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
      default_file_explorer = false;
      columns = [
        "icon"
      ];
      skip_confirm_for_simple_edits = false;
      prompt_save_on_select_new_write = true;
      cleanup_delay_ms = 2000;
      lsp_file_methods = {
        enabled = true;
        autosave_changes = "unmodified";
      };
      constrain_cursor_to_editable = true;
      watch_for_changes = true;
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
      keymaps = {
        # Opens file in vertical split
        "<CR>" = {
          __unkeyed-1 = "actions.select";
          opts = {
            vertical = true;
          };
        };
      };
    };
  };
}
