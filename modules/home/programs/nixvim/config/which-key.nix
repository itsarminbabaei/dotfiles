{
  plugins.which-key = {
    enable = true;
    settings = {
      preset = "helix";
      delay = 300;
      icons = {
        rules = false;
        breadcrumb = " ";
        separator = "󱦰  ";
        group = "󰹍 ";
      };
      plugins = {
        spelling = {
          enabled = false;
        };
      };
      win = {
        height = {
          max = "math.huge";
        };
      };
      spec = [
        {
          mode = ["n" "v"];
          __unkeyed-1 = {
            "<leader>f" = {group = "Find";};
            "<leader>G" = {group = "Git";};
            "<leader>g" = {group = "Gitsigns";};
            "<leader>R" = {group = "Replace";};
            "<leader>l" = {group = "LSP";};
            "<leader>c" = {group = "LSP (Trouble)";};
            "<leader>t" = {group = "Test";};
            "<leader>D" = {group = "Debugger";};
            "<leader>s" = {group = "Search";};
            "<leader>x" = {group = "diagnostics/quickfix (Trouble)";};
            "<leader>u" = {group = "Toggle Features";};
            "<leader>W" = {group = "Workspace";};
            "[" = {group = "prev";};
            "]" = {group = "next";};
            "g" = {group = "goto";};
          };
        }
      ];
    };
  };
}
