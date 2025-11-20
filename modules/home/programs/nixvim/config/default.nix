{ pkgs }:
{
  # Import all your configuration modules here
  imports = [
    ./bufferline.nix
    ./pbcopy.nix
    ./colorscheme.nix
    ./keymaps.nix
    ./treesitter.nix
    ./snacks.nix
    ./trouble.nix
    ./sidekick.nix
    ./mason.nix
    ./blink.nix
    ./conform.nix
    ./lspconfig.nix
    ./which-key.nix
    ./git.nix
    ./nvim-lint.nix
    ./noice.nix
    ./arrow.nix
    ./telescope.nix
    ./harpoon.nix
    ./oil.nix
    ./lualine.nix
    ./dap.nix
    ./avante.nix
    ./render-markdown.nix
    ./neotest.nix
    ./navbuddy.nix
    ./treesitter-context.nix
    ./twilight.nix
    ./copilot.nix
    ./lazygit.nix
  ];

  # External packages for nixvim (LSPs, formatters, linters, etc.)
  extraPackages = with pkgs; [
    lua-language-server
    typescript-language-server
    stylua
    biome
    shellcheck
  ];
}
