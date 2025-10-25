# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository managed with GNU Stow for symlink management. The repository contains configuration files for a macOS development environment with a focus on terminal-based workflows.

## Repository Structure

The repository uses GNU Stow's standard directory structure where each top-level directory represents a "package" that can be independently stowed:

- `nvim/` - Neovim configuration with Lazy.nvim plugin manager
- `zsh/` - Zsh shell configuration with Oh-My-Zsh and Powerlevel10k
- `aerospace/` - AeroSpace window manager configuration
- `ghostty/` - Ghostty terminal emulator configuration
- `wezterm/` - WezTerm terminal emulator configuration
- `yabai/` - Yabai window manager configuration (older setup)
- `skhd/` - Simple Hotkey Daemon configuration
- `yazi/` - Yazi file manager configuration
- `zellij/` - Zellij terminal multiplexer configuration

Each package directory contains the same structure as would appear in `$HOME` (e.g., `nvim/.config/nvim/` mirrors `~/.config/nvim/`).

## Installation & Management

**Installing/linking configurations:**
```bash
# Link all configurations
stow */

# Link specific package
stow nvim

# Unlink a package
stow -D nvim

# Re-link after changes (unlink then link)
stow -R nvim
```

**After modifying configs:** Always test in the actual config locations (`~/.config/`, `~/`, etc.) since stow creates symlinks.

## Neovim Configuration Architecture

### Plugin Manager & Loading

The Neovim config uses **Lazy.nvim** for plugin management with a modular structure:

- Entry point: `nvim/.config/nvim/init.lua` loads core settings and lazy.nvim
- Plugin specs: Auto-loaded from `lua/shaley/plugins/` and `lua/shaley/plugins/lsp/`
- Core settings: `lua/shaley/core/options.lua` defines editor options
- Leader key: `<Space>` (defined in `lua/shaley/core/options.lua:3`)

### Key Plugin Groups

**LSP & Language Support:**
- Mason (`lsp/mason.lua`) - LSP/tool installer with auto-install for: ts_ls, html, cssls, tailwindcss, lua_ls, graphql, emmet_ls, pyright
- LSP Config (`lsp/lspconfig.lua`) - LSP keybindings and server configurations
- Rustaceanvim (`rustaceanvim.lua`) - Rust-specific tooling (rust_analyzer handled separately)
- CMP (`nvim-cmp.lua`) - Autocompletion engine
- Treesitter (`treesitter.lua`) - Advanced syntax highlighting

**Formatting & Linting:**
- Conform.nvim (`formatting.lua`) - Code formatting with format-on-save enabled
  - Uses prettier for JS/TS/web, stylua for Lua, isort+black for Python
  - Manual format: `<leader>mp` in normal or visual mode
- Linting (`linting.lua`) - Code linting with eslint_d, pylint

**Navigation & Search:**
- Telescope (`telescope.lua`) - Fuzzy finder with keybindings under `<leader>f`
- Nvim-tree (`nvim-tree.lua`) - File explorer
- Smart-splits (`smart-splits.lua`) - Window/pane navigation
- Hop (`hop.lua`) - Jump to any location with motion commands
- Yazi (`yazi.lua`) - File manager integration

**Git Integration:**
- Neogit (`neogit.lua`) - Git interface
- Blame (`blame.lua`) - Git blame annotations

**Testing & Debugging:**
- Neotest (`neotest.lua`) - Test runner with language adapters
- DAP (`lsp/nvim-dap.lua`, `lsp/nvim-dap-ui.lua`) - Debug Adapter Protocol
  - Breakpoint signs configured in `core/options.lua:52-71`

**UI Enhancements:**
- Which-key (`which-key.lua`) - Keybinding hints (groups: a=avante, b=buffer, c=lsp, e=neotree, f=telescope, g=git, j=hop, k=dap, m=format, s=session, t=neotest, w=window, x=trouble)
- Lualine (`lualine.lua`) - Status line
- Alpha/Dashboard - Start screens
- Barbecue (`barbecue.lua`) - Context breadcrumbs

### LSP Keybindings

Standard LSP keybindings (defined in `lsp/lspconfig.lua:21-68`):
- `gR` - Show references (Telescope)
- `gD` - Go to declaration
- `gd` - Show definitions (Telescope)
- `gi` - Show implementations (Telescope)
- `gt` - Show type definitions (Telescope)
- `<leader>ca` - Code actions
- `<leader>cr` - Rename symbol
- `<leader>D` - Show buffer diagnostics
- `<leader>d` - Show line diagnostics
- `[d` / `]d` - Navigate diagnostics
- `K` - Show hover documentation
- `<leader>cx` - Restart LSP

## Zsh Configuration

The zsh config (`zsh/.zshrc`) uses:
- **Oh-My-Zsh** framework with plugins: git, appup, kubectl
- **Powerlevel10k** theme (config in `zsh/.p10k.zsh`)
- **Syntax highlighting** and **autosuggestions** via Homebrew packages
- **Zoxide** for smart directory jumping (aliased to `cd`)

Key aliases defined in `.zshrc:114-120`:
- `vim` → `nvim`
- `ls` → `eza --icons=always`
- `lg` → `lazygit`
- `tt` → `taskwarrior-tui`
- `cd` → `z` (zoxide)

Environment:
- Editor: `vim` (aliased to nvim)
- Notes directory: `$HOME/Dropbox (Dialexa)/Notes`
- Path includes: RVM, Go bin, personal bin, Krew, Rancher Desktop

## AeroSpace Window Manager

Configuration: `aerospace/.config/aerospace/aerospace.toml`

The setup uses tiling window management with custom keybindings supporting both standard keyboard and Moonlander keyboard layouts (alt-shift-ctrl-cmd combinations).

Key workspace assignments:
- Workspace `T` - Terminal apps (wezterm auto-assigned)
- Workspace `A` - Frequent apps (Todoist, Messages)
- Workspaces 1-5 - General purpose
- Workspace `S` - Side monitor

Navigation uses vim-style `hjkl` keys with various modifier combinations for focus, move, and resize operations.

## Development Tools

**Installed via Mason (nvim):**
- Formatters: prettier, stylua, isort, black
- Linters: eslint_d, pylint
- Debugger: codelldb

**Shell tools (via Homebrew/system):**
- nvm (Node version manager)
- bun (JavaScript runtime)
- zoxide (smart cd)
- eza (modern ls)
- lazygit (Git TUI)
- yazi (file manager with `y()` function in zshrc for cd integration)

## Common Workflows

**Adding a new Neovim plugin:**
1. Create new file in `nvim/.config/nvim/lua/shaley/plugins/` or add to existing
2. Use Lazy.nvim spec format (see existing plugins for examples)
3. Run `:Lazy sync` in Neovim to install
4. Plugin will auto-load on next nvim start due to `lua/shaley/lazy.lua:14`

**Modifying LSP/formatter config:**
- LSP servers: Edit `lsp/mason.lua` (ensure_installed) and `lsp/lspconfig.lua` (handlers)
- Formatters: Edit `formatting.lua` (formatters_by_ft)
- Mason auto-installs on next nvim start

**Working with which-key groups:**
All custom keybinding groups are defined in `which-key.lua:9-22`. When adding keybindings under `<leader>`, ensure they follow the established group prefixes.

## System Information

- Platform: macOS (Darwin)
- Package manager: Homebrew
- Dotfile manager: GNU Stow
- Primary terminal: Ghostty (with WezTerm as alternative)
- Window manager: AeroSpace (previously yabai/skhd)
