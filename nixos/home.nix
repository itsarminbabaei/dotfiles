{ config, pkgs, username, ... }:

{
  imports = [ ../shared/home.nix ./modules/desktop/hyprland.nix ];

  # NixOS-specific overrides/additions
  home.homeDirectory = "/home/${username}";

  # Add NixOS-only packages or configs here
  # For example:
  # home.packages = config.home.packages ++ [ pkgs.some-linux-package ];

  home.file = {
    ".config/hypr".source = ./config/hypr;
  };

  # NixOS-specific environment
  # home.sessionVariables = config.home.sessionVariables // {
  #   NIXOS_SPECIFIC_VAR = "value";
  # };
}
