# My Nvim Configuration

This repository contains my custom configuration for NvChad. It uses the main NvChad repository as a plugin and extends its functionality.

## Structure

### Core Files

- `init.lua` - Main entry point for Neovim configuration
- `lua/options.lua` - Custom Vim options (extends NvChad defaults)
- `lua/mappings.lua` - Custom key mappings
- `lua/chadrc.lua` - NvChad theme and UI configurations

### Plugin Management

- `lua/plugins/init.lua` - Plugin declarations and configurations using lazy.nvim
- `lua/configs/lazy.lua` - Lazy plugin manager settings and optimizations

### LSP Configuration

- `lua/configs/lspconfig.lua` - Language Server Protocol configurations
- `lua/configs/mason-lspconfig.lua` - Automatic LSP server installation management

### Code Quality Tools

- `lua/configs/formatting.lua` - Consolidated formatting configurations (conform.nvim and mason-conform)
- `lua/configs/lint.lua` - Linting configurations with nvim-lint
- `lua/configs/mason-lint.lua` - Automatic linter installation management

### Syntax Highlighting

- `lua/configs/treesitter.lua` - Treesitter configurations for better syntax highlighting

## Key Features

1. **Formatting Support** via conform.nvim for:

   - Lua (stylua)
   - Go (gofumpt, goimports-reviser, golines)
   - JavaScript/TypeScript (prettier, eslint_d)
   - HTML/CSS (prettier)
   - JSON/YAML (prettier, jq)
   - Shell scripts (shellcheck)
   - Kubernetes (helm_ls, yamlls)
   - Terraform (terraformls)
   - Docker (dockerls)
   - Helm templates (helmfmt)
   - YAML (yamlfmt, kubeconform)
   - Terraform (terraform_fmt)
   - And more...

2. **LSP Support** for multiple languages:

   - Lua (lua_ls)
   - Go (gopls)
   - TypeScript (ts_ls)
   - Python (pyright)
   - C/C++ (clangd)
   - HTML/CSS
   - Bash (bashls)
   - AWK (awk_ls)

3. **Linting Integration** with nvim-lint:

   - Lua (luacheck)
   - Automatic linter installation via mason-nvim-lint

4. **Automatic Tool Management** via Mason for:

   - LSP servers (mason-lspconfig)
   - Formatters (mason-conform)
   - Linters (mason-nvim-lint)

5. **Editor Features**:
   - Telescope integration with file ignore patterns
   - Custom key mappings (including `;` for command mode)
   - Block cursor in all modes
   - 4-space indentation
   - Line numbers enabled

## Installation

1. Ensure you have Neovim >= 0.9.0 installed
2. Clone this repository to your Neovim configuration directory:
   ```bash
   git clone https://github.com/yourusername/nvim-config ~/.config/nvim
   ```
3. Delete the .git directory or fork it for your own use:
   ```bash
   rm -rf ~/.config/nvim/.git
   ```
4. Start Neovim and let it install the plugins

## Requirements

- Neovim >= 0.9.0
- Git
- A C compiler for Treesitter
- Node.js for LSP servers
- Various language-specific tools (will be installed automatically by Mason)
- Kubernetes-specific tools:

  ```bash
  # Docker formatting
  go install github.com/jessfraz/dockfmt@latest

  # Kubescape
  brew install kubescape

  # Kubeconform
  brew install kubeconform

  # Helm (v3.8+ required for fmt command)
  brew install helm
  ```

## Credits

1. NvChad - Base configuration framework
2. LazyVim starter - Inspiration for configuration structure

## License

This project is released into the public domain. See the LICENSE file for details.

Note: This configuration requires NvChad as a base. Make sure you have NvChad properly installed.
