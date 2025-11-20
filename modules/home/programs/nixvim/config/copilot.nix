{
  plugins.copilot-lua = {
    enable = true;
    settings = {
      suggestion = {
        enabled = true;
        auto_trigger = false;
        debounce = 75;
        keymap = {
          accept = "<M-l>";
          accept_word = false;
          accept_line = false;
          next = "<M-]>";
          prev = "<M-[>";
          dismiss = "<C-]>";
        };
      };
      panel = {
        enabled = false;
      };
    };
  };
}
