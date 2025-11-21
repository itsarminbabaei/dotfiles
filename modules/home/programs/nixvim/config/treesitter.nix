# Treesitter - Syntax highlighting and parsing
# Docs: https://github.com/nvim-treesitter/nvim-treesitter
# AST-based syntax highlighting, indentation, incremental selection. Includes textobjects.

{ lib, pkgs, ... }:
{
  plugins.treesitter = {
    enable = true;

    settings = {
      highlight = {
        enable = true;
        additional_vim_regex_highlighting = false;
      };
      indent = {
        enable = true;
      };
      incremental_selection = {
        enable = true;
      };
    };

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash
      json
      javascript
      typescript
      tsx
      lua
      markdown
      markdown_inline
      go
      gomod
      gowork
      gosum
      nix
    ];
  };

  plugins.treesitter-textobjects = {
    enable = true;
    settings = {
      select = {
        enable = true;
        lookahead = true;
        selection_modes = {
          "@parameter.outer" = "v";
          "@parameter.inner" = "v";
          "@function.outer" = "v";
          "@conditional.outer" = "V";
          "@loop.outer" = "V";
          "@class.outer" = "<c-v>";
        };
        include_surrounding_whitespace = false;
      };
      move = {
        enable = true;
        set_jumps = true;
      };
      swap = {
        enable = true;
      };
    };
  };
}
