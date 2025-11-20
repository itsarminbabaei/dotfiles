{ pkgs, inputs, ... }:
{

  imports = [ inputs.self.nixosModules.host-shared ];

  nixpkgs.hostPlatform = "x86_64-linux";

  # Enable fish system-wide
  programs.fish.enable = true;
  environment.shells = with pkgs; [ fish ];

  # on nixos this either isNormalUser or isSystemUser is required to create the user.
  users.users.itsarminbabaei = {
    isNormalUser = true;
    description = "Armin Babaei";
    group = "wheel";
    extraGroups = [ "networkmanager" "docker" ];
    shell = pkgs.fish;
  };

  # for testing purposes only, remove on bootable hosts.
  boot.loader.grub.enable = pkgs.lib.mkDefault false;
  fileSystems."/".device = pkgs.lib.mkDefault "/dev/null";

  system.stateVersion = "25.05"; # initial nixos state
}
