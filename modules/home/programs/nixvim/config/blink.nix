{
  plugins.blink-cmp = {
    enable = true;
    settings = {
      snippets = {
        preset = "luasnip";
      };
      signature = {
        enabled = true;
      };
      appearance = {
        use_nvim_cmp_as_default = false;
        nerd_font_variant = "normal";
      };
      sources = {
        default = [
          "lsp"
          "path"
          "snippets"
          "lazydev"
          "buffer"
        ];
        providers = {
          lazydev = {
            name = "LazyDev";
            module = "lazydev.integrations.blink";
            score_offset = 100;
          };
          cmdline = {
            min_keyword_length = 2;
          };
        };
      };
      keymap = {
        "<C-f>" = [ ];
      };
      cmdline = {
        enabled = false;
      };
      completion = {
        menu = {
          border = null;
          scrolloff = 1;
          scrollbar = false;
          draw = {
            columns = [
              { "kind_icon" = null; }
              {
                "label" = null;
                "label_description" = null;
                gap = 1;
              }
              { "kind" = null; }
              { "source_name" = null; }
            ];
          };
        };
        documentation = {
          window = {
            border = null;
            scrollbar = false;
            winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc";
          };
          auto_show = true;
          auto_show_delay_ms = 500;
        };
      };
    };
  };

  plugins.luasnip = {
    enable = true;
  };
}
