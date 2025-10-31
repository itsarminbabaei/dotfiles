{ config, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;

    # Import your configuration modules
    imports = [
      ./config/default.nix
    ];
  };
}
