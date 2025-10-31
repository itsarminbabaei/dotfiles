{ config, pkgs, username, ... }:

{
  imports = [ ../shared/home.nix ];

  # macOS-specific overrides/additions
  home.homeDirectory = "/Users/${username}";

  home.file = {
    "Brewfile".source = ./Brewfile;
  };

  # macOS-specific environment
  # home.sessionVariables = config.home.sessionVariables // {
  #   MACOS_SPECIFIC_VAR = "value";
  # };
}
