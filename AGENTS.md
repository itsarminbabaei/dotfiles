# Agent Instructions

Blueprint NixVim configuration for AI agents to understand and modify.

## Quick Start

This is a Nix-based NixVim (Neovim) configuration. To understand it:

1. Read `README.md` for overview
2. Examine `modules/home/programs/nixvim/config/` for plugin configs
3. Each `.nix` file has comments explaining rationale and source links
4. Never modify `flake.nix` or `flake.lock` without understanding Nix
5. Plugin imports in `default.nix` - add/remove imports there

## Key Files

**Core**:
- `flake.nix` - Nix flake definition, do not modify without Nix expertise
- `modules/home/programs/nixvim/config/default.nix` - Imports all plugin configs

**Completion Stack** (critical):
- `blink.nix` - Completion framework, aggregates sources
- `lspconfig.nix` - Language servers (Go, TS, Lua, Bash, JSON, Nix)
- `supermaven.nix` - AI completion (Supermaven free tier)
- `keymaps.nix` - All keybindings including Supermaven keys
- `which-key.nix` - Keymap documentation

**User Interface**:
- `alpha.nix` - Dashboard
- `lualine.nix` - Statusline
- `bufferline.nix` - Tabs
- `noice.nix` - Message UI
- `which-key.nix` - Keymap helper

**Navigation**:
- `telescope.nix` - Fuzzy finder
- `harpoon.nix` - File bookmarks
- `oil.nix` - File explorer
- `tmux-navigator.nix` - Pane navigation

**Git**:
- `gitsigns.nix` - Line decorations
- `fugitive.nix` - Commands
- `diffview.nix` - Diff viewer
- `lazygit.nix` - TUI integration
- `undotree.nix` - Undo history

**Code Quality**:
- `lspconfig.nix` - Language servers
- `conform.nix` - Formatters
- `trouble.nix` - Diagnostics
- `neotest.nix` - Test runner
- `dap.nix` - Debugger

**Treesitter**:
- `treesitter.nix` - Syntax highlighting
- `treesitter-textobjects.nix` - AST-based text objects
- `treesitter-context.nix` - Code context header

**Text Editing**:
- `comment.nix` - Comment toggling
- `mini.nix` - ai, surround, pairs
- `spectre.nix` - Find/replace
- `flash.nix` - Motion enhancement

**Other**:
- `editorconfig.nix` - Editor settings
- `sleuth.nix` - Indent detection
- `persistence.nix` - Session restore
- `render-markdown.nix` - Markdown display

## Tasks for Agents

### Common Tasks

**Add a Plugin**:
1. Create `modules/home/programs/nixvim/config/<plugin>.nix`
2. Add plugin config with comments (2-3 lines: name, docs link, rationale)
3. Import in `default.nix`: add `./plugins-name.nix` to imports list
4. If plugin has keymaps, add to `keymaps.nix`
5. If plugin has groups, add to `which-key.nix`
6. Update `README.md` if it's a major plugin

**Remove a Plugin**:
1. Delete the .nix file
2. Remove import from `default.nix`
3. Remove keymaps from `keymaps.nix`
4. Remove which-key entries from `which-key.nix`
5. Update `README.md`

**Modify Plugin Settings**:
1. Edit the .nix file directly
2. Each setting should have brief comment explaining what it does
3. Add source link in file header if not present

**Add Keymaps**:
1. Edit `keymaps.nix` in the appropriate section
2. Include `desc` option for documentation
3. Add which-key entry in `which-key.nix` if it's a leader key

**Add LSP Server**:
1. Edit `modules/home/home-shared.nix` in `programs.nixvim.lsp.servers`
2. Format: `server-name.enable = true;`
3. Add settings under `server-name.config` if needed
4. Update `README.md` table
5. Reference: `man nixvim` → search for `lsp.servers`

## Code Structure Rules

**Nix Files**:
```nix
# Plugin Name - Brief description
# Docs: https://...
# Rationale: Why this plugin, what it does
#
# Optional: Additional context

{
  plugins.name = {
    enable = true;
    # settings...
  };
}
```

**Comments**:
- Header: 3-4 lines with name, docs, rationale
- Inline: Only for non-obvious settings
- No emojis or excessive punctuation
- Precise and concise

**File Organization**:
- One plugin per file (except blink.nix which includes luasnip)
- alphabetical in default.nix imports
- Keymaps grouped by plugin with `# === Plugin Name ===` header

## Testing Changes

After modifying configs:

1. Syntax check: `nix flake check` (optional)
2. Rebuild: `sudo darwin-rebuild switch --flake .#darwin` (macOS) or `home-manager switch --flake` (Linux)
3. Test in Neovim: `:checkhealth` and `:LspInfo`
4. Verify keymaps: `:map <leader>xx` (replace xx with your key)

## Important Notes

- Do NOT modify `flake.nix` unless adding Nix dependencies
- Do NOT create .md files except README.md
- Do NOT use emojis in any text files
- Keep comments precise, no filler text
- Every plugin config must have source documentation link
- Completion stack (blink, lspconfig, supermaven) requires all three to work properly
- Language server configs in lspconfig.nix are critical for code completion

## When You Get Stuck

1. Check `man nixvim` first (local source of truth)
2. Check existing plugin configs for examples
3. Reference nixvim docs: https://nix-community.github.io/nixvim/
4. Plugin GitHub pages have detailed options
5. Test settings in Lua with `:lua require('plugin').setup({...})`
6. Use `:messages` and `:checkhealth` for debugging

## Known Issues & Solutions

**VAM deprecation warning**: "vam attribute is deprecated. Use packages instead"
- Source: nixvim internal (not from blueprint configs)
- Status: Non-breaking, safe to ignore
- No action needed

**editorconfig.nix deprecation**: plugins.editorconfig renamed to editorconfig
- Status: File is correct (`editorconfig.enable = true;`)
- Warning persists from nixvim's deprecation layer even after fix
- No further action needed
- Apply pattern to any plugin with nixvim module rename

**which-key spec format**: key parameter not recognized
- Fixed: Changed `key =` to `__unkeyed-1 =` per nixvim which-key spec
- Reason: nixvim translates Nix to Lua table of tables format

**blink-cmp draw.columns error**: "expected a table of tables"
- Fixed: Changed from object format to array of arrays
- Format: `[ [ "kind_icon" ] [ "label" ] [ "kind" ] ]`
- Source: blink-cmp docs (not nixvim man)

**Blink-cmp + Supermaven integration**: "Requested provider supermaven has not been configured"
- Root cause: Supermaven is NOT a native blink-cmp source. It's an nvim-cmp plugin.
- Solution: Use `blink-compat` layer to bridge nvim-cmp sources into blink-cmp.
- Required configuration:
  - Enable `plugins.blink-compat` in blink.nix
  - Define supermaven provider with blink.compat.source module
  - Add supermaven to sources.default list
- Config pattern in blink.nix:
  ```nix
  sources = {
    default = ["lsp" "path" "snippets" "buffer" "supermaven"];
    providers = {
      supermaven = {
        name = "supermaven";
        module = "blink.compat.source";
      };
    };
  };
  plugins.blink-compat.enable = true;
  ```
- Docs: https://github.com/saghen/blink.compat (compatibility layer for nvim-cmp sources)

**Plugin option not recognized**: Deprecated or renamed option
- Solution: Check `man nixvim | grep plugin-name` for current structure
- Many plugins have moved from `plugins.name.*` to top-level options

## Success Criteria

A change is good if:
- Syntax is correct (no Nix errors)
- File has proper comments and documentation links
- Keymaps are added if needed
- which-key entries added if applicable
- README.md updated if it's a notable change
- Code follows existing style and organization
