return {
  "folke/sidekick.nvim",
  dependencies = {
    "zbirenbaum/copilot.lua",
  },
  opts = {
    nes = {
      debounce = 200,
    },
    cli = {
      mux = {
        backend = "tmux",
        enabled = true,
      },
      tools = {
        amp = { cmd = { "amp" } },
        ollama = { cmd = { "ollama", "run", "kimi-k2:1t-cloud" } },
      },
    },
  },
  config = function(_, opts)
    require("sidekick").setup(opts)
    -- require("copilot").setup({
    --   suggestion = { enabled = false },
    --   panel = { enabled = false },
    -- })
  end,
  keys = {
    {
      "<tab>",
      function()
        if not require("sidekick").nes_jump_or_apply() then
          return "<Tab>"
        end
      end,
      expr = true,
      desc = "Goto/Apply Next Edit Suggestion",
    },
    {
      "<leader>aa",
      function() require("sidekick.cli").toggle() end,
      desc = "Sidekick Toggle CLI",
    },
    {
      "<leader>as",
      function() require("sidekick.cli").select() end,
      desc = "Select CLI",
    },
    {
      "<leader>at",
      function() require("sidekick.cli").send({ msg = "{this}" }) end,
      mode = { "x", "n" },
      desc = "Send This",
    },
    {
      "<leader>av",
      function() require("sidekick.cli").send({ msg = "{selection}" }) end,
      mode = { "x" },
      desc = "Send Visual Selection",
    },
    {
      "<leader>ap",
      function() require("sidekick.cli").prompt() end,
      mode = { "n", "x" },
      desc = "Sidekick Select Prompt",
    },
    {
      "<c-.>",
      function() require("sidekick.cli").focus() end,
      mode = { "n", "x", "i", "t" },
      desc = "Sidekick Switch Focus",
    },
    {
      "<leader>ac",
      function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end,
      desc = "Sidekick Toggle Claude",
    },
  },
}
