{
  # Basic Neovim settings
  opts = {
    number = true;
    relativenumber = true;
    shiftwidth = 2;
    tabstop = 2;
    expandtab = true;
    smartindent = true;
    termguicolors = true;
  };

  # Keymaps
  keymaps = [
    {
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<cr>";
      options.desc = "Find files";
    }
    {
      key = "<leader>fg";
      action = "<cmd>Telescope live_grep<cr>";
      options.desc = "Live grep";
    }
    {
      key = "<leader>fb";
      action = "<cmd>Telescope buffers<cr>";
      options.desc = "Find buffers";
    }
  ];

  # Colorscheme
  colorschemes.catppuccin.enable = true;

  # Filetype associations
  filetype = {
    extension = {
      tf = "terraform";
      terraform = "terraform";
    };
  };
}
