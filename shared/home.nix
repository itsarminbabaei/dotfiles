{ config, pkgs, username, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = username;
  home.homeDirectory = "/Users/${username}";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # Add packages here
    # fish  # Managed manually via home.file
    starship
    # tmux  # Managed manually via home.file
    neovim  # For nvim
    # Add more as needed
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  # Raw configs sourced from repo
  ".config/fish".source = ./config/fish;
  ".config/nvim".source = ./config/nvim;
  ".config/mise".source = ./config/mise;
  ".config/ghostty".source = ./config/ghostty;
  ".config/fastfetch".source = ./config/fastfetch;
  ".config/nix".source = ./config/nix;
  ".hyper.js".source = ./.hyper.js;
  ".gitconfig".source = ./.gitconfig;
  ".bashrc".source = ./.bashrc;
  ".profile".source = ./.profile;
  ".gitignore".source = ./.gitignore;
  ".gitmessage".source = ./.gitmessage;
  ".gitmodules".source = ./.gitmodules;
  ".editorconfig".source = ./.editorconfig;
  ".bash_profile".source = ./.bash_profile;
  ".zshrc".source = ./.zshrc;
  ".zshenv".source = ./.zshenv;
  ".zprofile".source = ./.zprofile;

  # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
  # # symlink to the Nix store copy.
  # ".screenrc".source = dotfiles/screenrc;

  # # You can also set the file content immediately.
  # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
  EDITOR = "nvim";
  };



  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Import your tool configs here
  imports = [
    ./modules/shell/starship.nix
    # ./modules/editor/tmux.nix  # Managed manually
    # Add more as you port them
  ];
}
