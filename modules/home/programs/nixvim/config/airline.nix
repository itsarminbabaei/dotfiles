# Vim-airline - Statusline
# Docs: https://github.com/vim-airline/vim-airline/blob/master/doc/airline.txt
# Rationale: Lean & fast status/tabline for vim that's light as air.

{
  plugins.airline = {
    enable = true;
    settings = {
      # Sections (a-z)
      section_a = null;
      section_b = null;
      section_c = null;
      section_x = null;
      section_y = "";
      section_z = null;

      # Experimental
      experimental = 1;

      # Separators
      left_sep = "";
      right_sep = "";

      # Detection
      detect_modified = 1;
      detect_paste = 1;
      detect_crypt = 1;
      detect_spell = 1;
      detect_spelllang = 1;
      detect_iminsert = 0;

      # Inactive windows
      inactive_collapse = 1;
      inactive_alt_sep = 1;

      # Theme
      theme = "dracula";
      theme_patch_func = null;

      # Fonts and symbols
      powerline_fonts = 0;
      symbols_ascii = 0;
      symbols = {
        branch = "branch ";
        linenr = "☰";
        colnr = " Col:";
      };

      # Mode and filetype
      mode_map = null;
      exclude_filenames = null;
      exclude_filetypes = null;
      filetype_overrides = null;

      # Windows
      exclude_preview = 0;

      # Statusline and tabline
      disable_statusline = 0;
      skip_empty_sections = 1;
      stl_path_style = "short";
      statusline_ontop = 0;

      # Display
      section_c_only_filename = 1;

      # Performance
      highlighting_cache = 0;
      focuslost_inactive = 0;
    };
  };
}
