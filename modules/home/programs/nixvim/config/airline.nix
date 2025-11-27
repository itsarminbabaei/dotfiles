# Vim-airline - Statusline
# Docs: https://github.com/vim-airline/vim-airline/blob/master/doc/airline.txt
# Rationale: Lean & fast status/tabline. Replaces bufferline/lualine. Vimscript only.

{
  plugins.airline = {
    enable = true;
    settings = {
      theme = "dracula";
      powerline_fonts = 0;
      extensions = [
        "branch"
        "hunks"
        "tabline"
        "whitespace"
      ];
      tabline = {
        excludes = [ "oil" ];
      };
      symbols = {
        branch = "branch ";
        linenr = "☰";
        colnr = " Col:";
      };
      skip_empty_sections = 1;
      parts.ffenc.skip_expected_encoding = 1;
      section_y = "";
      exclude_filetypes = [ "oil" ];
    };
  };
}
