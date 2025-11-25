{ pkgs, osConfig, inputs, ... }:
{

  # only available on linux, disabled on macos
  services.ssh-agent.enable = pkgs.stdenv.isLinux;

  # Enable fontconfig for Nerd Fonts
  fonts.fontconfig.enable = true;

  # Nixvim configuration
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./programs/ghostty.nix
    ./programs/starship.nix
    ./programs/fish.nix
    ./programs/git.nix
    ./programs/tmux.nix
    ./programs/zellij.nix
  ];
  programs.nixvim = {
    enable = true;
    globals.mapleader = " ";
    imports = [ ./programs/nixvim/config/default.nix ];

    lsp.servers = {
      gopls.enable = true;
      ts_ls.enable = true;
      lua_ls.enable = true;
      bashls.enable = true;
      jsonls.enable = true;
      nil_ls.enable = true;
    };
  };

  home.packages =
    [ 
      pkgs.home-manager
      pkgs.ripgrep
      
      # Terminal/shell tools
      pkgs.tmux
      pkgs.zellij
      pkgs.starship
      pkgs.lazygit
      pkgs.lazydocker
      pkgs.gh
      
      # Development tools
      pkgs.rustup
      pkgs.bun
      pkgs.pnpm
      
      # CLI utilities
      pkgs.fzf
      pkgs.fd
      pkgs.bat
      pkgs.eza
      pkgs.btop
      pkgs.jq
      pkgs.jnv
      pkgs.zoxide
      pkgs.yazi
      pkgs.trash-cli
      pkgs.curl
      pkgs.wget
      pkgs.httpie
      pkgs.httpstat
      pkgs.npkill
      
      # Cloud & Infrastructure
      pkgs.awscli2
      pkgs.amazon-q-cli
      pkgs.google-cloud-sdk
      pkgs.openssh
      pkgs.sshpass
      pkgs.autossh
      
      # Fonts
      pkgs.nerd-fonts.geist-mono
      pkgs.nerd-fonts.symbols-only

      # AI tools (from nix-ai-tools flake)
      inputs.nix-ai-tools.packages.${pkgs.stdenv.system}.amp
      inputs.nix-ai-tools.packages.${pkgs.stdenv.system}.claude-code
      inputs.nix-ai-tools.packages.${pkgs.stdenv.system}.droid
      inputs.nix-ai-tools.packages.${pkgs.stdenv.system}.gemini-cli
      inputs.nix-ai-tools.packages.${pkgs.stdenv.system}.goose-cli
    ]
    ++ (
      # you can access the host configuration using osConfig.
      pkgs.lib.optionals (osConfig.programs.vim.enable && pkgs.stdenv.isDarwin) [ pkgs.skhd ]
    );

  home.stateVersion = "24.11"; # initial home-manager state
}
