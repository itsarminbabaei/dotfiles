{ pkgs, inputs, ... }:
{

  imports = [ inputs.self.nixosModules.host-shared ];

  nixpkgs.hostPlatform = "aarch64-darwin";

  # Enable fish system-wide
  programs.fish.enable = true;
  environment.shells = with pkgs; [ fish ];

  users.users.itsarminbabaei = {
    home = /Users/itsarminbabaei;
    uid = 501;
  };

  system.stateVersion = 6; # initial nix-darwin state
}
