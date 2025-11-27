# Which-key - Keymap helper
# Docs: https://github.com/folke/which-key.nvim
# Shows available keybindings when <leader> pressed. Load at startup for immediate availability.

{
  plugins.which-key = {
    enable = true;
    lazyLoad.enable = false;

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
          max = 9999;
        };
      };

      spec = [
        # Navigation & Movement
        {
          __unkeyed-1 = "[";
          group = "Previous";
          icon = " ";
        }
        {
          __unkeyed-1 = "]";
          group = "Next";
          icon = " ";
        }
        {
          __unkeyed-1 = "g";
          group = "Goto";
          icon = " ";
        }

        # Leader Groups
        {
          __unkeyed-1 = "<leader>?";
          group = "Which-Key";
          icon = "?";
          hidden = true;
        }

        # Find/Search
        {
          __unkeyed-1 = "<leader>f";
          group = "Find";
          icon = "󰈞 ";
        }
        {
          __unkeyed-1 = "<leader>ff";
          desc = "Files";
        }
        {
          __unkeyed-1 = "<leader>fw";
          desc = "Word (grep)";
        }
        {
          __unkeyed-1 = "<leader>fb";
          desc = "Buffers";
        }
        {
          __unkeyed-1 = "<leader>fh";
          desc = "Help";
        }

        # LSP
        {
          __unkeyed-1 = "<leader>c";
          group = "LSP";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>cf";
          group = "Format";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>cl";
          group = "References";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>cs";
          group = "Symbols";
          icon = " ";
        }

        # File Navigation
        {
          __unkeyed-1 = "<leader>e";
          group = "File Explorer";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>h";
          group = "Harpoon";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>h1";
          desc = "File 1";
        }
        {
          __unkeyed-1 = "<leader>h2";
          desc = "File 2";
        }
        {
          __unkeyed-1 = "<leader>h3";
          desc = "File 3";
        }
        {
          __unkeyed-1 = "<leader>h4";
          desc = "File 4";
        }
        {
          __unkeyed-1 = "<leader>ha";
          desc = "Add file";
        }
        {
          __unkeyed-1 = "<leader>hm";
          desc = "Menu";
        }

        # Code Navigation
        {
          __unkeyed-1 = "<leader>nb";
          group = "Navbuddy";
          icon = " ";
        }

        # Testing
        {
          __unkeyed-1 = "<leader>t";
          group = "Testing";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>tr";
          desc = "Run nearest";
        }
        {
          __unkeyed-1 = "<leader>tf";
          desc = "Run file";
        }
        {
          __unkeyed-1 = "<leader>ts";
          desc = "Summary";
        }

        # Debugging
        {
          __unkeyed-1 = "<leader>D";
          group = "Debugger";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>Db";
          desc = "Toggle Breakpoint";
        }
        {
          __unkeyed-1 = "<leader>Dc";
          desc = "Continue";
        }
        {
          __unkeyed-1 = "<leader>Dsi";
          desc = "Step Into";
        }
        {
          __unkeyed-1 = "<leader>Dso";
          desc = "Step Over";
        }
        {
          __unkeyed-1 = "<leader>Du";
          desc = "DAP UI";
        }

        # Git (Gitsigns)
        {
          __unkeyed-1 = "<leader>G";
          group = "Git (Gitsigns)";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>Gk";
          desc = "Previous Hunk";
        }
        {
          __unkeyed-1 = "<leader>Gl";
          desc = "Blame Line";
        }
        {
          __unkeyed-1 = "<leader>Gp";
          desc = "Preview Hunk";
        }
        {
          __unkeyed-1 = "<leader>Gr";
          desc = "Reset Hunk";
        }
        {
          __unkeyed-1 = "<leader>GR";
          desc = "Reset Buffer";
        }
        {
          __unkeyed-1 = "<leader>Gj";
          desc = "Next Hunk";
        }
        {
          __unkeyed-1 = "<leader>Gs";
          desc = "Stage Hunk";
        }
        {
          __unkeyed-1 = "<leader>Gu";
          desc = "Undo Stage";
        }
        {
          __unkeyed-1 = "<leader>Gd";
          desc = "Diff HEAD";
        }
        {
          __unkeyed-1 = "<leader>GU";
          desc = "Undo Tree";
        }

        # Git (LazyGit)
        {
          __unkeyed-1 = "<leader>g";
          group = "LazyGit";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>gg";
          desc = "Open";
        }

        # Diagnostics/Trouble
        {
          __unkeyed-1 = "<leader>x";
          group = "Diagnostics";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>xx";
          desc = "All Diagnostics";
        }
        {
          __unkeyed-1 = "<leader>xX";
          desc = "Buffer Diagnostics";
        }
        {
          __unkeyed-1 = "<leader>xL";
          desc = "Location List";
        }


        # Code Viewing
        {
          __unkeyed-1 = "<leader>v";
          group = "View/Inspect";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>vv";
          desc = "Init Selection";
        }

        # UI Toggles
        {
          __unkeyed-1 = "<leader>u";
          group = "Toggle";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>us";
          desc = "Spelling";
        }
        {
          __unkeyed-1 = "<leader>uw";
          desc = "Wrap";
        }
        {
          __unkeyed-1 = "<leader>uL";
          desc = "Relative Line Numbers";
        }
        {
          __unkeyed-1 = "<leader>ul";
          desc = "Line Numbers";
        }
        {
          __unkeyed-1 = "<leader>ud";
          desc = "Diagnostics";
        }
        {
          __unkeyed-1 = "<leader>uc";
          desc = "Conceal Level";
        }
        {
          __unkeyed-1 = "<leader>uT";
          desc = "Treesitter";
        }
        {
          __unkeyed-1 = "<leader>ub";
          desc = "Dark Background";
        }
        {
          __unkeyed-1 = "<leader>uh";
          desc = "Inlay Hints";
        }
        {
          __unkeyed-1 = "<leader>ug";
          desc = "Indent";
        }
        {
          __unkeyed-1 = "<leader>uD";
          desc = "Dim";
        }

        # Treesitter Text Objects
        {
          __unkeyed-1 = "a";
          group = "Text Objects (outer)";
          mode = ["o" "x"];
        }
        {
          __unkeyed-1 = "i";
          group = "Text Objects (inner)";
          mode = ["o" "x"];
        }

        # Supermaven (AI Completion)
        {
          __unkeyed-1 = "<C-a>";
          group = "Supermaven";
          mode = ["i"];
          hidden = true;
        }
      ];
    };
  };
}
