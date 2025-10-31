{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # Hyprland settings can be configured here
      # Or left empty if using config file
    };
  };
}
