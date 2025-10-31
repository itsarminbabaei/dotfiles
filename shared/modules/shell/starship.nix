{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;

    # Source your starship.toml
    settings = builtins.fromTOML (builtins.readFile ./starship.toml);
  };
}
