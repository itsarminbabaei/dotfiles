# Blink-cmp - Modern completion framework
# Docs: https://cmp.saghen.dev/
# Aggregates sources (LSP, snippets, AI, paths, buffer) into one menu.
# 0.5-4ms async, typo-resistant fuzzy matching. Integrates Supermaven via blink-compat.

{
  plugins.blink-cmp = {
    enable = true;
    settings = {
      snippets.preset = "luasnip";
      signature.enabled = true;
      appearance = {
        use_nvim_cmp_as_default = false;
        nerd_font_variant = "mono";
      };

      sources = {
        default = ["lsp" "path" "snippets" "buffer" "supermaven"];
        providers = {
          supermaven = {
            name = "supermaven";
            module = "blink.compat.source";
          };
          cmdline.min_keyword_length = 2;
        };
      };

      keymap."<C-f>" = [];
      cmdline.enabled = false;

      completion = {
        menu = {
          scrolloff = 1;
          scrollbar = false;
          draw = {
            columns = [
              [ "kind_icon" ]
              [ "label" "label_description" ]
              [ "kind" ]
            ];
          };
        };
        documentation = {
          auto_show = true;
          auto_show_delay_ms = 500;
        };
      };
    };
  };

  # LuaSnip - Snippet engine
  # Docs: https://github.com/L3MON4D3/LuaSnip
  # Provides code templates/snippets used by blink-cmp.
  plugins.luasnip.enable = true;

  # Blink-compat - Compatibility layer for nvim-cmp sources
  # Docs: https://github.com/saghen/blink.compat
  # Allows blink-cmp to use nvim-cmp sources like supermaven-nvim.
  plugins.blink-compat = {
    enable = true;
  };
}
