# Supermaven - AI code completion
# Docs: https://github.com/supermaven-inc/supermaven-nvim
# Fast AI completion. Free tier available. Run :SupermavenUseFree first time.

{
  plugins.supermaven = {
    enable = true;
    settings = {
      keymaps = {
        accept_suggestion = "<C-a>";
        clear_suggestion = "<C-e>";
        accept_word = "<C-j>";
      };
      ignore_filetypes = {
        markdown = false;
        vim = false;
      };
      color = {
        suggestion_color = "#ffffff";
        cterm = 244;
      };
      disable_inline_completion = false;
      disable_keymaps = false;
    };
  };
}
