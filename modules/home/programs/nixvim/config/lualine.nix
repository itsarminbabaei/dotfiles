# Lualine - Statusline
# Docs: https://github.com/nvim-lualine/lualine.nvim
# Customizable statusline at bottom showing mode, branch, diagnostics, location, etc.

{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        icons_enabled = true;
        theme = "auto";
        component_separators = {
          left = "|";
          right = "|";
        };
        section_separators = {
          left = "";
          right = "";
        };
        disabled_filetypes = [
          "NvimTree"
        ];
        always_divide_middle = true;
      };
      sections = {
        lualine_a = ["mode"];
        lualine_b = ["branch" "diff" "diagnostics"];
        lualine_c = ["filename"];
        lualine_x = ["encoding" "fileformat" "filetype"];
        lualine_y = ["progress"];
        lualine_z = ["location"];
      };
      inactive_sections = {
        lualine_a = [];
        lualine_b = [];
        lualine_c = ["filename"];
        lualine_x = ["location"];
        lualine_y = [];
        lualine_z = [];
      };
    };
  };
}
