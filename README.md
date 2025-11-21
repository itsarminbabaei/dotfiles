# Blueprint - A Nix-Based Development Environment

**Blueprint** is a declarative, reproducible development environment built on [Nix](https://nixos.org) and [NixOS](https://nixos.org). It's based on [Numtide's Blueprint](https://github.com/numtide/blueprint), adapted and extended with personal configurations.

## What is Nix?

Nix is a purely functional package manager and programming language created by **Eelco Dolstra** in 2003. It treats packages and configurations as immutable, reproducible artifacts, enabling developers to describe their entire system state in code.

**Why Nix matters:**
- **Reproducibility**: Define your environment once, deploy it identically everywhere (laptop, server, team)
- **Declarative**: System state is explicit code, not imperative commands
- **Atomic Operations**: Updates and rollbacks are instant and safe
- **Dependency Management**: No "dependency hell" — strict isolation and versioning
- **Culture**: A vibrant community building the future of package management and system configuration

I'm deeply committed to the Nix ecosystem because it fundamentally changes how we think about software environments. Rather than "it works on my machine," you get "it works everywhere, guaranteed."

## Current Status

- **darwin**: Fully configured (x86_64 and arm64 support)
- **nixos**: Work in progress

## Quick Start

### Darwin (macOS)

Rebuild your system with:
```bash
darwin-rebuild switch --flake .#darwin
```

Unlike traditional home-manager approaches, Blueprint uses [Nix Darwin](https://github.com/LnL7/nix-darwin) for macOS system configuration, providing deeper integration with macOS while maintaining Nix's declarative philosophy.

### NixOS

Coming soon. Current setup is validated on Darwin.

## Environment Overview

### Terminal & Shell
- **Terminal**: [Ghostty](https://github.com/ghostty-org/ghostty) — A modern, GPU-accelerated terminal
- **Shell**: [Fish](https://github.com/fish-shell/fish-shell) — Friendly interactive shell with smart completions
- **Prompt**: [Starship](https://github.com/starship/starship) — Minimal, blazing-fast cross-shell prompt
- **Multiplexer**: [tmux](https://github.com/tmux/tmux) — Terminal multiplexer (primary)
- **Alternative**: [Zellij](https://github.com/zellij-org/zellij) — User-friendly multiplexer (exploring)

### Editor
- **Editor**: [NixVim](https://github.com/nix-community/nixvim) — Neovim configured entirely in Nix
- **Theme**: [Dracula](https://github.com/dracula/dracula-theme) (current)
- **Custom Theme**: [Denim](https://arminbabaei.com/theme) (work in progress)

The Denim theme is a personal tribute to denim culture — inspired by raw denim, salvage denim heritage, Japanese denim craftsmanship, and the intricate details of the Kapital brand. It's more than aesthetics; it's about bringing that timeless, worn-in quality to the dev environment.

### Typography
- **Primary Font**: [Geist Mono](https://vercel.com/font) — Clean, readable monospace font
- **Enhancement**: [Nerd Fonts](https://www.nerdfonts.com/) — Extended icons and symbols

### Project Management & AI Tools
- **Backlog Tool**: [Backlog.md](https://github.com/MrLesk/Backlog.md) — Git-native collaboration between humans and AI agents
- **AI Tools**: [Nix AI Tools](https://github.com/numtide/nix-ai-tools) (Numtide) — AI-powered utilities for the Nix ecosystem

## NixVim Configuration

Blueprint fully leverages [NixVim](https://github.com/nix-community/nixvim) for Neovim configuration. All settings are declarative, version-controlled, and reproducible.

### Completion Stack

**Core Integration**: blink-cmp (framework) + lspconfig (6 LSP servers) + supermaven (AI) + luasnip (snippets)

The completion system is built on [blink-cmp](https://cmp.saghen.dev/), a modern, performant completion framework that aggregates multiple sources into a single, unified menu:

- **LSP**: Real-time diagnostics and completions from language servers
- **Paths**: File system path completion
- **Snippets**: Code templates via luasnip
- **Buffer**: Words from open buffers
- **AI**: Supermaven AI-powered suggestions (free tier available)

All sources are merged into a single menu with async fuzzy matching (0.5-4ms), typo resistance, and contextual awareness.

**Keymaps**:
- `<C-space>` — Open completion menu
- `<Tab>` / `<S-Tab>` — Navigate completions
- `<CR>` — Accept selected completion
- `<C-a>` — Accept AI suggestion (Supermaven)
- `<C-e>` — Dismiss completion menu
- `<C-j>` — Accept AI word suggestion (Supermaven)

**First-time setup**:
```
:SupermavenUseFree
:LspInfo
```

### Project Structure

```
blueprint/
├── modules/
│   ├── home/
│   │   ├── home-shared.nix          (Shell, LSP, fonts, packages)
│   │   ├── programs/
│   │   │   ├── nixvim/
│   │   │   │   └── config/
│   │   │   │       ├── default.nix          (Plugin imports)
│   │   │   │       ├── blink.nix            (Completion framework + luasnip)
│   │   │   │       ├── lspconfig.nix        (Language servers)
│   │   │   │       ├── supermaven.nix       (AI completion)
│   │   │   │       ├── keymaps.nix          (All keybindings)
│   │   │   │       ├── which-key.nix        (Keymap groups & help)
│   │   │   │       ├── colorscheme.nix      (Theme configuration)
│   │   │   │       └── [28 other plugins]
│   │   │   ├── fish.nix              (Shell configuration)
│   │   │   ├── ghostty.nix           (Terminal settings)
│   │   │   ├── starship.nix          (Prompt configuration)
│   │   │   ├── tmux.nix              (Multiplexer config)
│   │   │   ├── zellij.nix            (Zellij config)
│   │   │   ├── git.nix               (Git settings)
│   │   └── home-darwin.nix
│   ├── darwin/
│   └── nixos/
├── hosts/
│   ├── darwin/
│   │   └── default.nix              (Darwin system config)
│   └── nixos/
├── flake.nix
├── flake.lock
├── cz.json
└── README.md (this file)
```

### Installed Plugins (38 total)

**Completion**: blink-cmp, blink-compat, luasnip, lspconfig, supermaven

**UI**: alpha, bufferline, lualine, noice, which-key, snacks, fidget

**Navigation**: telescope, harpoon, oil, tmux-navigator, flash, navbuddy

**Git**: gitsigns, diffview, fugitive, lazygit, undotree

**Code Quality**: conform, trouble, neotest, dap (+ dap-ui, dap-go, dap-virtual-text)

**Treesitter**: treesitter, treesitter-textobjects, treesitter-context, twilight

**Text Editing**: comment, mini (ai, surround, pairs), spectre, render-markdown

**Other**: editorconfig, sleuth, persistence, arrow, lazydev, pbcopy

### Language Servers

Configured in `modules/home/home-shared.nix` under `programs.nixvim.lsp.servers`.

| Server | Languages | Features |
|--------|-----------|----------|
| gopls | Go | Completion, diagnostics, inlay hints, refactoring |
| ts_ls | TypeScript/JavaScript | Type checking, imports, completions |
| lua_ls | Lua | Vim API awareness, completions |
| bashls | Bash | Linting, diagnostics, completions |
| jsonls | JSON | Schema validation, completions |
| nil_ls | Nix | Formatter awareness, completions |

### Keymaps & Command Groups

All keybindings are documented via [which-key](https://github.com/folke/which-key.nvim) (press `<leader>?` to view).

**Core Navigation**:
- `H` / `L` — Start/end of line
- `j` / `k` — Smart vertical navigation (respects line wraps)
- `J` / `K` (visual) — Move selection up/down
- `<Left>` / `<Right>` — Previous/next buffer
- `<C-h/j/k/l>` — tmux pane navigation
- `<C-\>` — tmux previous pane

**Search & Find** (`<leader>f`):
- `ff` — Find files (Telescope)
- `fw` — Find word (live grep)
- `fb` — Find buffers
- `fh` — Find help tags

**File Navigation**:
- `-` — Oil file explorer (parent directory)
- `<leader>e` — Snacks file explorer
- `<leader>h` + {a/m/1/2/3/4} — Harpoon bookmarks

**LSP** (`<leader>c`):
- `cf` — Format buffer
- `cl` — LSP references
- `cs` — Symbols
- `gd` — Go to definition (Trouble)
- `gr` — Go to references (Trouble)
- `gi` — Go to implementation (Trouble)
- `gy` — Go to type definition (Trouble)

**Debugging** (`<leader>D`):
- `b` — Toggle breakpoint
- `c` — Continue
- `si` — Step into
- `so` — Step over
- `u` — DAP UI toggle

**Testing** (`<leader>t`):
- `r` — Run nearest test
- `f` — Run file tests
- `s` — Toggle test summary

**Git**:
- `<leader>G` — Gitsigns (hunks, blame, staging)
  - `k/j` — Previous/next hunk
  - `p` — Preview hunk
  - `s/u` — Stage/unstage
  - `r/R` — Reset hunk/buffer
  - `l` — Blame line
  - `d` — Diff against HEAD
- `<leader>g` — LazyGit
- `<leader>GU` — Undo tree

**Diagnostics** (`<leader>x`):
- `x` — All diagnostics
- `X` — Buffer diagnostics
- `l` — LSP definitions/references
- `L` — Location list
- `Q` — Quickfix list

**UI Toggles** (`<leader>u`):
- `s` — Spelling
- `w` — Line wrap
- `L` — Relative line numbers
- `l` — Line numbers
- `d` — Diagnostics
- `c` — Conceal level
- `T` — Treesitter
- `b` — Dark background
- `h` — Inlay hints
- `g` — Indent guides
- `D` — Dim

**Code Inspection** (`<leader>v`):
- `v` — Init treesitter selection

**Treesitter Text Objects** (outer/inner):
- `af/if` — Function
- `ac/ic` — Class
- `ai/ii` — Conditional
- `al/il` — Loop
- `ap/ip` — Parameter
- `[f/]f` — Previous/next function
- `[c/]c` — Previous/next class
- `[p/]p` — Previous/next parameter
- `<leader>a/A` — Swap parameter with next/previous

**Motion** (Flash):
- `s` — Flash jump to character
- `S` — Flash treesitter scope
- `r` — Remote flash (operator pending)
- `R` — Treesitter search
- `<C-s>` (command mode) — Toggle flash search

**Find & Replace** (`<leader>R`):
- `r` — Open spectre
- `w` — Replace word
- `f` — Replace in buffer

**Session Management** (`<leader>q`):
- `s` — Load current session
- `S` — Select session
- `l` — Load last session
- `d` — Disable persistence

**Code Navigation**:
- `<leader>nb` — Navbuddy (code structure browser)

### Core Settings

- **Leader key**: Space (`<space>`)
- **Completion**: Async with typo tolerance
- **Snippets**: luasnip preset
- **Nerd Font**: Mono variant with full icon support
- **Theme**: Dracula (with Denim WIP alternative)

### Configuration Philosophy

- **Declarative**: All config in Nix files
- **Documented**: Each file has rationale and source links
- **Minimal**: No external setup scripts needed
- **Composable**: Plugins import cleanly, no conflicts
- **Reproducible**: Exact environment guaranteed across machines
- **Discoverable**: Keymaps documented with which-key and descriptions

## Installed Packages

From `home-shared.nix`:

**Terminal & Shell**: tmux, zellij, starship, lazygit, lazydocker, gh

**CLI Utilities**: ripgrep, fzf, fd, bat, eza, btop, jq, zoxide, yazi

**Fonts**: Geist Mono, JetBrains Mono, Nerd Fonts symbols-only

**AI Tools** (from nix-ai-tools): amp, catnip, claude-code, droid, forge, gemini-cli, goose-cli, qwen-code

## Key References

### Nix Ecosystem
- [Nix Manual](https://nixos.org/manual/nix/stable/)
- [NixOS Manual](https://nixos.org/manual/nixos/stable/)
- [Nix Darwin](https://github.com/LnL7/nix-darwin)

### NixVim & Editor
- [NixVim Docs](https://nix-community.github.io/nixvim/)
- [blink-cmp](https://cmp.saghen.dev/)
- [LSPConfig](https://github.com/neovim/nvim-lspconfig)
- [Supermaven](https://github.com/supermaven-inc/supermaven-nvim)
- [which-key](https://github.com/folke/which-key.nvim)
- [Trouble](https://github.com/folke/trouble.nvim)

### Source Projects
- [Numtide Blueprint](https://github.com/numtide/blueprint) — The original template this is based on
- [Numtide Nix AI Tools](https://github.com/numtide/nix-ai-tools) — AI integrations

## Next Steps

1. Run `:SupermavenUseFree` in NixVim to activate AI completion
2. Check `:LspInfo` to verify all language servers are running
3. Press `<leader>?` to view all keybindings organized by group
4. Review plugin configs in `modules/home/programs/nixvim/config/` for customization
5. Customize Fish shell in `modules/home/programs/fish.nix`
6. Check out the Denim theme preview at [arminbabaei.com/theme](https://arminbabaei.com/theme)
7. Monitor NixOS configuration progress in `modules/nixos/`
