{
  plugins.oil = {
    enable = true;
    settings = {
      default_file_explorer = true;
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
    };
  };
}
