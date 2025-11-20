{ pkgs }:
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
        keymaps = {
          init_selection = "<leader>vv";
          node_incremental = "+";
          scope_incremental = false;
          node_decremental = "_";
        };
      };
    };

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash
      c
      html
      javascript
      json
      lua
      luadoc
      markdown
      markdown_inline
      python
      query
      regex
      tsx
      typescript
      vue
      vim
      vimdoc
      yaml
      rust
      go
      gomod
      gowork
      gosum
      terraform
      zig
      nix
    ];
  };

  plugins.treesitter-textobjects = {
    enable = true;
    select = {
      enable = true;
      lookahead = true;
      keymaps = {
        "af" = "@function.outer";
        "if" = "@function.inner";
        "ac" = "@class.outer";
        "ic" = "@class.inner";
        "ai" = "@conditional.outer";
        "ii" = "@conditional.inner";
        "al" = "@loop.outer";
        "il" = "@loop.inner";
        "ap" = "@parameter.outer";
        "ip" = "@parameter.inner";
      };
      selectionModes = {
        "@parameter.outer" = "v";
        "@parameter.inner" = "v";
        "@function.outer" = "v";
        "@conditional.outer" = "V";
        "@loop.outer" = "V";
        "@class.outer" = "<c-v>";
      };
      includeSurroundingWhitespace = false;
    };
    move = {
      enable = true;
      setJumps = true;
      gotoPreviousStart = {
        "[f" = "@function.outer";
        "[c" = "@class.outer";
        "[p" = "@parameter.inner";
      };
      gotoNextStart = {
        "]f" = "@function.outer";
        "]c" = "@class.outer";
        "]p" = "@parameter.inner";
      };
    };
    swap = {
      enable = true;
      swapNext = {
        "<leader>a" = "@parameter.inner";
      };
      swapPrevious = {
        "<leader>A" = "@parameter.inner";
      };
    };
  };
}
