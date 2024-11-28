# Nix Darwin System Configuration

This repository contains a complete system configuration for macOS using nix-darwin and home-manager. The setup provides a reproducible, declarative system configuration that can be easily deployed to new machines or kept in sync across multiple systems.

## System Overview

The system uses two main components:

1. **nix-darwin**: Manages system-level configuration and packages
   - System packages and dependencies
   - System settings and defaults
   - Homebrew formulae and casks
   - System-wide program configurations

2. **home-manager**: Manages user-level configurations
   - Shell environment (zsh with oh-my-zsh)
   - Neovim with LazyVim configuration
   - XDG directory structure
   - User-specific packages and tools

### Key Features

- Declarative system configuration using Nix Flakes
- Automated package management through Nix and Homebrew
- LazyVim-based Neovim configuration with Nix-managed plugins
- Reproducible builds that work in air-gapped environments
- Modular configuration structure

## Initial Setup

### Prerequisites

1. Install Nix using the Determinate Systems installer:
```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

2. Install Homebrew:
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### First-Time Setup

1. Clone this repository:
```sh
git clone <repository-url> ~/nixconfig
```

2. Build and activate the configuration:
```sh
cd ~/nixconfig && nix build .#darwinConfigurations.paka.system && ./result/sw/bin/darwin-rebuild switch --flake .#paka
```

## System Components

### Directory Structure

```
nixconfig/
├── flake.nix              # Main flake configuration
├── modules/
│   ├── home/             # Home-manager configurations
│   │   ├── default.nix   # Main home-manager config
│   │   ├── shell.nix     # Shell configuration
│   │   └── programs/     # Program-specific configs
│   │       └── neovim.nix
│   └── system/           # System configurations
│       └── darwin.nix    # Darwin-specific settings
```

### Neovim Configuration

The system uses LazyVim with plugins managed through nixpkgs for reproducibility:
- LSP servers and development tools
- Treesitter integration
- Telescope for fuzzy finding
- Git integration
- Modern UI components

### Shell Environment

Configured through home-manager with:
- Zsh as the default shell
- Oh-my-zsh for enhanced functionality
- Custom plugins and themes
- Useful aliases and functions

## Managing the System

### Making Changes

1. Edit configuration files in the appropriate module
2. Rebuild the system:
```sh
cd ~/nixconfig && darwin-rebuild switch --flake .#paka
```

### System Updates

To update all packages and configurations:
```sh
cd ~/nixconfig && nix flake update && darwin-rebuild switch --flake .#paka
```

## Best Practices

1. Keep configurations modular and organized
2. Test changes before committing
3. Document system-specific customizations
4. Regularly update flake inputs
5. Maintain clear separation between system and user configurations

## License

This configuration is provided under the MIT License. Feel free to use and modify as needed.
