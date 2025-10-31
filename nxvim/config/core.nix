{
  # Globals
  globals = {
    mapleader = " ";
    maplocalleader = " ";
    loaded_netrw = 1;
    loaded_netrwPlugin = 1;
  };

  # Options from your nvim/lua/config/options.lua
  opts = {
    incsearch = true;
    autochdir = true;
    backup = false;
    clipboard = "unnamedplus";
    cmdheight = 1;
    completeopt = ["menu" "menuone" "noselect"];
    conceallevel = 0;
    fileencoding = "utf-8";
    hlsearch = true;
    ignorecase = true;
    mouse = "a";
    pumheight = 10;
    showmode = false;
    showtabline = 0;
    smartcase = true;
    smartindent = true;
    splitbelow = true;
    splitright = true;
    swapfile = false;
    termguicolors = true;
    timeoutlen = 1000;
    undofile = true;
    updatetime = 100;
    writebackup = false;
    expandtab = true;
    shiftwidth = 2;
    cursorline = false;
    number = true;
    breakindent = true;
    relativenumber = true;
    numberwidth = 4;
    signcolumn = "yes:1";
    wrap = false;
    showcmd = false;
    ruler = true;
    title = true;
    confirm = true;
    winborder = "single";
  };

  # Filetype associations
  filetype = {
    extension = {
      env = "dotenv";
    };
    filename = {
      ".env" = "dotenv";
      env = "dotenv";
    };
    pattern = {
      "[jt]sconfig.*.json" = "jsonc";
      "%.env%.[%w_.-]+" = "dotenv";
    };
  };

  # Keymaps from your nvim/lua/config/keymaps.lua
  keymaps = [
    # Telescope
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
    # Visual mode moves
    {
      mode = "v";
      key = "J";
      action = ":m '>+1<CR>gv=gv";
      options = { silent = true; };
    }
    {
      mode = "v";
      key = "K";
      action = ":m '<-2<CR>gv=gv";
      options = { silent = true; };
    }
    # Better indenting
    {
      mode = "v";
      key = "<";
      action = "<gv";
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
    }
    # Paste without yanking
    {
      mode = "v";
      key = "p";
      action = "\"_dp";
    }
    {
      mode = "v";
      key = "P";
      action = "\"_dP";
    }
    # Insert mode exit
    {
      mode = "i";
      key = "jj";
      action = "<ESC>";
      options = { silent = true; };
    }
    {
      mode = "i";
      key = "jk";
      action = "<ESC>";
      options = { silent = true; };
    }
    # Start/end of line
    {
      mode = ["n" "x" "o"];
      key = "H";
      action = "^";
      options = { silent = true; };
    }
    {
      mode = ["n" "x" "o"];
      key = "L";
      action = "g_";
      options = { silent = true; };
    }
    # Buffer navigation
    {
      key = "<Right>";
      action = ":bnext<CR>";
      options = { silent = true; };
    }
    {
      key = "<Left>";
      action = ":bprevious<CR>";
      options = { silent = true; };
    }
    # Pane resizing
    {
      key = "+";
      action = ":vertical resize +5<CR>";
    }
    {
      key = "_";
      action = ":vertical resize -5<CR>";
    }
    {
      key = "=";
      action = ":resize +5<CR>";
    }
    {
      key = "-";
      action = ":resize -5<CR>";
    }
    # Search centering
    {
      key = "n";
      action = "nzzv";
      options = { silent = true; };
    }
    {
      key = "N";
      action = "Nzzv";
      options = { silent = true; };
    }
    {
      key = "*";
      action = "*zzv";
      options = { silent = true; };
    }
    {
      key = "#";
      action = "#zzv";
      options = { silent = true; };
    }
    {
      key = "g*";
      action = "g*zz";
      options = { silent = true; };
    }
    {
      key = "g#";
      action = "g#zz";
      options = { silent = true; };
    }
    # Other
    {
      key = "X";
      action = ":keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>";
      options = { silent = true; };
    }
    {
      key = "<C-x>";
      action = "dd";
      options = { silent = true; };
    }
    {
      key = "<C-a>";
      action = "ggVG";
      options = { silent = true; };
    }
    {
      key = "<Esc>";
      action = ":nohlsearch<CR>";
      options = { silent = true; };
    }
  ];

  # AutoCmds from your nvim/lua/config/autocmds.lua
  autoCmd = [
    {
      event = "BufEnter";
      command = "set formatoptions-=cro";
    }
    {
      event = "VimResized";
      command = "wincmd =";
    }
  ];

  # Extra config
  extraConfigLua = ''
    -- Additional Lua config
    vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
    vim.opt.fillchars = { eob = " " }

    -- Autocmds with callbacks
    local api = vim.api

    -- wrap words in mail buffer
    api.nvim_create_autocmd("Filetype", {
      pattern = "mail",
      callback = function()
        vim.opt.textwidth = 0
        vim.opt.wrapmargin = 0
        vim.opt.wrap = true
        vim.opt.linebreak = true
        vim.opt.columns = 80
        vim.opt.colorcolumn = "80"
      end,
    })

    -- Highlight on yank
    api.nvim_create_autocmd("TextYankPost", {
      callback = function()
        vim.highlight.on_yank()
      end,
    })

    -- go to last loc when opening a buffer
    api.nvim_create_autocmd("BufReadPost", {
      callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
          pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
      end,
    })

    -- show cursor line only in active window
    local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })
    api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
      pattern = "*",
      command = "set cursorline",
      group = cursorGrp,
    })
    api.nvim_create_autocmd(
      { "InsertEnter", "WinLeave" },
      { pattern = "*", command = "set nocursorline", group = cursorGrp }
    )

    -- Enable spell checking for certain file types
    api.nvim_create_autocmd(
      { "BufRead", "BufNewFile" },
      {
        pattern = { "*.txt", "*.md", "*.tex" },
        callback = function()
          vim.opt.spell = true
          vim.opt.spelllang = "en"
        end,
      }
    )

    -- close some filetypes with <q>
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
      pattern = {
        "PlenaryTestPopup",
        "help",
        "lspinfo",
        "man",
        "notify",
        "qf",
        "spectre_panel",
        "startuptime",
        "tsplayground",
        "neotest-output",
        "checkhealth",
        "neotest-summary",
        "neotest-output-panel",
      },
      callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
      end,
    })

    -- fix terraform and hcl comment string
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("FixTerraformCommentString", { clear = true }),
      callback = function(ev)
        vim.bo[ev.buf].commentstring = "# %s"
      end,
      pattern = { "terraform", "hcl" },
    })

    -- LSP attach (simplified)
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("gl", vim.diagnostic.open_float, "Open Diagnostic Float")
        map("K", vim.lsp.buf.hover, "Hover Documentation")
        map("gs", vim.lsp.buf.signature_help, "Signature Documentation")
        map("gD", vim.lsp.buf.declaration, "Goto Declaration")

        map("<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Goto Definition in Vertical Split")

        -- Simplified which-key (if available)
        -- Assuming which-key is added later
      end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  '';
}
