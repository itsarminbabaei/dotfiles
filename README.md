# Blueprint - NixVim Configuration

NixVim declarative configuration for Neovim on NixOS/nix.

## Completion

Core stack: blink-cmp (framework) + lspconfig (6 LSP servers) + supermaven (AI) + luasnip (snippets).

All sources merged into single menu: LSP, paths, snippets, buffer, AI.

Keymaps:
- `<C-space>` - Open menu
- `<Tab>` / `<S-Tab>` - Navigate
- `<CR>` - Accept
- `<C-a>` - Accept AI suggestion
- `<C-e>` - Dismiss

First time setup:
```
:SupermavenUseFree
:LspInfo
```

## Project Structure

```
blueprint/
├── modules/
│   ├── home/
│   │   └── programs/
│   │       └── nixvim/
│   │           └── config/
│   │               ├── default.nix          (imports all plugins)
│   │               ├── blink.nix            (completion + luasnip)
│   │               ├── lspconfig.nix        (language servers)
│   │               ├── supermaven.nix       (AI completion)
│   │               ├── keymaps.nix          (all keybindings)
│   │               ├── which-key.nix        (keymap help)
│   │               └── [37 other plugins]
│   ├── nixos/
│   └── home-shared.nix
├── hosts/
├── flake.nix
├── flake.lock
├── cz.json
└── README.md (this file)
```

## Plugins

**Completion**: blink-cmp, luasnip, lspconfig, supermaven

**UI**: alpha, bufferline, lualine, noice, which-key, snacks, fidget

**Navigation**: telescope, harpoon, oil, tmux-navigator, flash

**Git**: gitsigns, diffview, fugitive, lazygit, undotree

**Code Quality**: conform, trouble, neotest, dap (+ dap-ui, dap-go, dap-virtual-text)

**Treesitter**: treesitter, treesitter-textobjects, treesitter-context, twilight

**Text Editing**: comment, mini (ai, surround, pairs), spectre, render-markdown

**Other**: editorconfig, sleuth, persistence, arrow, lazydev

## Configuration Philosophy

- Declarative: All config in Nix files
- Documented: Each file has rationale and source links
- Minimal: No external setup scripts
- Composable: Plugins import cleanly

## Language Servers

Configured in `modules/home/home-shared.nix` under `programs.nixvim.lsp.servers`.

| Server | Languages | Features |
|--------|-----------|----------|
| gopls | Go | Completion, diagnostics, hints |
| ts_ls | TypeScript/JavaScript | Type checking, imports |
| lua_ls | Lua | Vim API awareness |
| bashls | Bash | Linting, completion |
| jsonls | JSON | Schema validation |
| nil_ls | Nix | Formatter awareness |

## Documentation

Source links in each config file. Main references:

- lspconfig: https://github.com/neovim/nvim-lspconfig
- blink-cmp: https://cmp.saghen.dev/
- supermaven: https://github.com/supermaven-inc/supermaven-nvim
- nixvim: https://nix-community.github.io/nixvim/

## Next Steps

1. Run `:SupermavenUseFree` to activate AI
2. Review remaining plugins with comments
3. Test completion in Go/TS files
4. Customize keymaps as needed
