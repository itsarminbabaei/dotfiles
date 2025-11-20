{
  plugins.sidekick = {
    enable = true;
    settings = {
      nes = {
        debounce = 200;
      };
      cli = {
        mux = {
          backend = "tmux";
          enabled = true;
        };
        tools = {
          amp = { cmd = [ "amp" ]; };
          ollama = { cmd = [ "ollama" "run" "kimi-k2:1t-cloud" ]; };
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<Tab>";
      action = "<Cmd>lua if not require('sidekick').nes_jump_or_apply() then vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, true, true), 'n', false) end<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Goto/Apply Next Edit Suggestion";
      };
    }
    {
      mode = "n";
      key = "<leader>aa";
      action = "<Cmd>lua require('sidekick.cli').toggle()<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Sidekick Toggle CLI";
      };
    }
    {
      mode = "n";
      key = "<leader>as";
      action = "<Cmd>lua require('sidekick.cli').select()<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Select CLI";
      };
    }
    {
      mode = ["n" "x"];
      key = "<leader>at";
      action = "<Cmd>lua require('sidekick.cli').send({ msg = '{this}' })<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Send This";
      };
    }
    {
      mode = "x";
      key = "<leader>av";
      action = "<Cmd>lua require('sidekick.cli').send({ msg = '{selection}' })<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Send Visual Selection";
      };
    }
    {
      mode = ["n" "x"];
      key = "<leader>ap";
      action = "<Cmd>lua require('sidekick.cli').prompt()<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Sidekick Select Prompt";
      };
    }
    {
      mode = ["n" "x" "i" "t"];
      key = "<C-.>";
      action = "<Cmd>lua require('sidekick.cli').focus()<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Sidekick Switch Focus";
      };
    }
    {
      mode = "n";
      key = "<leader>ac";
      action = "<Cmd>lua require('sidekick.cli').toggle({ name = 'claude', focus = true })<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Sidekick Toggle Claude";
      };
    }
  ];
}
