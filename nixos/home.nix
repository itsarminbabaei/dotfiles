{ config, pkgs, username, ... }:

{
  imports = [ ../shared/home.nix ];

  # NixOS-specific overrides/additions
  # Add NixOS-only packages or configs here
  # For example:
  # home.packages = config.home.packages ++ [ pkgs.some-linux-package ];

  # NixOS-specific environment
  # home.sessionVariables = config.home.sessionVariables // {
  #   NIXOS_SPECIFIC_VAR = "value";
  # };
}
