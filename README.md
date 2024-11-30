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
   - User-specific packages and tools
   - XDG directory structure
   - Neovim configuration
   - WezTerm configuration
   - Aerospace window management

### Key Features

- Declarative system configuration using Nix Flakes
- Automated package management through Nix and Homebrew
- LazyVim configuration maintained in config/nvim
- WezTerm terminal emulator with Tokyo Night theme
- Aerospace tiling window manager with custom workspace rules
- Reproducible builds that work in air-gapped environments
- Modular configuration structure
- Elixir development environment with:
  - Elixir and Erlang via Nix
  - ElixirLS language server via Homebrew
  - Mix2nix for dependency management

## Directory Structure

```
nixconfig/
├── config/
│   ├── nvim/          # LazyVim configuration
│   │   ├── init.lua
│   │   └── lua/
│   │       ├── config/  # Core LazyVim config
│   │       └── plugins/ # Plugin configurations
│   └── wezterm/       # WezTerm configuration
│       └── wezterm.lua
├── modules/
│   ├── home/          # Home-manager configurations
│   │   ├── default.nix
│   │   ├── shell.nix
│   │   └── programs/
│   │       ├── neovim.nix    # Neovim package & integration
│   │       ├── wezterm.nix   # WezTerm configuration
│   │       └── aerospace.nix # Window management
│   └── system/        # System configurations
│       └── darwin.nix
└── flake.nix         # Main flake configuration
```

## Initial Setup

### Prerequisites

1. Install Nix using the Determinate Systems installer:
```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

2. Enable Flakes and Nix Command:
```sh
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

3. Install Homebrew:
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### First-Time Setup

1. Clone this repository:
```sh
git clone https://github.com/p4-k4/nixconfig.git ~/nixconfig
```

2. Build and activate the configuration:
```sh
cd ~/nixconfig && nix build .#darwinConfigurations.paka.system && ./result/sw/bin/darwin-rebuild switch --flake .#paka
```

## Components

### Neovim Configuration

The system uses LazyVim with a configuration maintained in `config/nvim`. This setup:

1. **Configuration Structure**:
   - Maintains LazyVim's natural directory structure in `config/nvim`
   - All lua files are kept in their standard locations
   - Easy to edit and maintain like a normal LazyVim setup

2. **Integration with Nix**:
   - Configuration is symlinked by home-manager
   - LSP servers and tools installed through nix
   - Plugins managed by lazy.nvim for flexibility
   - System dependencies handled by nix

3. **Usage**:
   - Edit configuration files directly in `config/nvim`
   - Add new plugins in `config/nvim/lua/plugins`
   - Run `darwin-rebuild switch --flake .#paka` to apply changes
   - LSP servers are automatically installed and configured

4. **Key Files**:
   - `modules/home/programs/neovim.nix`: Nix integration and package management
   - `config/nvim/init.lua`: Main LazyVim entry point
   - `config/nvim/lua/config/`: Core LazyVim configuration
   - `config/nvim/lua/plugins/`: Plugin-specific configurations

### WezTerm Configuration

The terminal emulator is configured with:
- Tokyo Night color scheme for consistent theming
- JetBrainsMono Nerd Font with ligatures
- Custom key bindings for efficient workflow
- Semi-transparent background with blur effect
- WebGPU renderer for better performance

### Aerospace Window Management

Tiling window manager configured with:
- Custom workspace management
- Automatic window rules for specific applications
- Floating window support for utility apps
- Auto-start configuration for essential applications
- Specific handling for eufy Security and TP-Link Tapo apps:
  - Auto-start on login
  - Float by default
  - Automatically move to workspace 5

### Shell Environment

Configured through home-manager with:
- Zsh as the default shell
- Oh-my-zsh for enhanced functionality
- Custom plugins and themes
- Useful aliases and functions

## Managing the System

### Making Changes

1. Edit configuration files in the appropriate module:
   - System settings in `modules/system/darwin.nix`
   - User settings in `modules/home/`
   - Neovim config in `config/nvim/`
   - WezTerm config in `config/wezterm/`
   - Window management in `modules/home/programs/aerospace.nix`

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
6. Keep neovim configuration in its natural structure
7. Use nix for package management, not plugin management
8. Configure window management rules based on application behavior
9. Maintain consistent theming across all components
10. Keep repository clean by ignoring system-specific files (.DS_Store)

## License

This configuration is provided under the MIT License. Feel free to use and modify as needed.
