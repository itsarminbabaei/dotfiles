# Trouble - Diagnostics viewer
# Docs: https://github.com/folke/trouble.nvim
# Pretty diagnostics list. Workspace/buffer diagnostics with navigation and previews.

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
      auto_jump = false;
      use_diagnostic_signs = true;
    };
  };
}
