# Noice - Message UI
# Docs: https://github.com/folke/noice.nvim
# Replaces Vim's default message and command UI with modern popup interface.

{
  plugins.noice = {
    enable = true;
    settings = {
      lsp = {
        override = {
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
          "cmp.entry.get_documentation" = true;
        };
        hover = {
          silent = true;
        };
      };
      presets = {
        bottom_search = true;
        command_palette = true;
        long_message_to_split = true;
        inc_rename = false;
        lsp_doc_border = true;
      };
    };
  };
}
