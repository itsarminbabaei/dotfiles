{ config, pkgs, ... }:

{
  # NixOS system config for ARM VM

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "nixos-vm";
  networking.networkmanager.enable = true;

  # Time zone
  time.timeZone = "America/Los_Angeles";  # Adjust as needed

  # Locale
  i18n.defaultLocale = "en_US.UTF-8";

  # User account
  users.users.itsarminbabaei = {
    isNormalUser = true;
    description = "Armin Babaei";
    extraGroups = [ "networkmanager" "wheel" ];
    # Set a password hash (generate with `mkpasswd -m sha-512`)
    # For now, set initialPassword for first boot
    initialPassword = "changeme";  # Change this to your desired password
    # Or use hashedPassword = "$6$...";  # From mkpasswd
  };

  # Allow sudo without password for wheel group (optional, remove for security)
  security.sudo.wheelNeedsPassword = false;

  # System packages
  environment.systemPackages = with pkgs; [
    vim
    git
    curl
  ];

  # Enable services
  services.openssh.enable = true;

  # Nix settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Home Manager (integrated above, but can add system-wide here if needed)

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
