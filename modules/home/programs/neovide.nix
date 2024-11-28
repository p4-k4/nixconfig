{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    neovide
  ];

  xdg.configFile."neovide/config.toml" = {
    text = ''
      # Frame rate
      frame-rate = 75

      # Font configuration
      font-family = "JetBrainsMono Nerd Font"
      font-size = 13

      # Window configuration
      window-decorations = true
      window-transparency = 0.95

      # Animations
      animation-length = 0.03
      cursor-animation-length = 0.03
      cursor-trail-length = 0.1
      cursor-trail-size = 0.5
      cursor-vfx-mode = "railgun"
      cursor-vfx-opacity = 200.0
      cursor-vfx-particle-lifetime = 0.3
      cursor-vfx-particle-density = 10.0
      cursor-vfx-particle-speed = 10.0
      cursor-vfx-particle-phase = 2.0
      cursor-vfx-particle-curl = 1.0

      # Padding
      window-padding-x = 5
      window-padding-y = 5

      # Performance
      vsync = true
      no-idle = true
      refresh-rate = 75
    '';
  };

  # Add Neovide-specific settings to init.lua
  xdg.configFile."nvim/lua/config/neovide.lua" = {
    text = ''
      -- Neovide configuration
      if vim.g.neovide then
        -- Tokyo Night colors
        vim.g.neovide_transparency = 0.95
        vim.g.neovide_background_color = "#1a1b26"
        vim.g.neovide_cursor_animation_length = 0.03
        vim.g.neovide_cursor_trail_length = 0.1
        vim.g.neovide_cursor_trail_size = 0.5
        vim.g.neovide_cursor_vfx_mode = "railgun"
        vim.g.neovide_cursor_vfx_opacity = 200.0
        vim.g.neovide_cursor_vfx_particle_lifetime = 0.3
        vim.g.neovide_cursor_vfx_particle_density = 10.0
        vim.g.neovide_cursor_vfx_particle_speed = 10.0
        vim.g.neovide_cursor_vfx_particle_phase = 2.0
        vim.g.neovide_cursor_vfx_particle_curl = 1.0
        vim.g.neovide_refresh_rate = 75
        vim.g.neovide_refresh_rate_idle = 5
        vim.g.neovide_no_idle = true
        vim.g.neovide_confirm_quit = true
        vim.g.neovide_remember_window_size = true
        vim.g.neovide_profiler = false
        vim.g.neovide_input_use_logo = true  -- enable use of the logo (cmd) key
        vim.g.neovide_input_macos_alt_is_meta = true
        vim.g.neovide_touch_deadzone = 6.0
        vim.g.neovide_scroll_animation_length = 0.3
        vim.g.neovide_floating_blur_amount_x = 2.0
        vim.g.neovide_floating_blur_amount_y = 2.0

        -- Set padding
        vim.g.neovide_padding_top = 5
        vim.g.neovide_padding_bottom = 5
        vim.g.neovide_padding_right = 5
        vim.g.neovide_padding_left = 5

        -- Font configuration
        vim.o.guifont = "JetBrainsMono Nerd Font:h13"
      end
    '';
  };
}
