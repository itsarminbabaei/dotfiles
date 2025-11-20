{ pkgs, osConfig, inputs, ... }:
{

  # only available on linux, disabled on macos
  services.ssh-agent.enable = pkgs.stdenv.isLinux;

  # Nixvim configuration
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./programs/ghostty.nix
    ./programs/starship.nix
    ./programs/fish.nix
    ./programs/git.nix
  ];
  programs.nixvim = {
    enable = true;
  };

  home.packages =
    [ 
      pkgs.ripgrep
      
      # Terminal/shell tools
      pkgs.tmux
      pkgs.zellij
      pkgs.starship
      pkgs.lazygit
      pkgs.lazydocker
      
      # CLI utilities
      pkgs.fzf
      pkgs.fd
      pkgs.bat
      pkgs.eza
      pkgs.btop
      pkgs.jq
      pkgs.zoxide
      pkgs.yazi
      
      # AI tools (from nix-ai-tools flake)
      inputs.nix-ai-tools.packages.${pkgs.stdenv.system}.amp
      inputs.nix-ai-tools.packages.${pkgs.stdenv.system}.catnip
      inputs.nix-ai-tools.packages.${pkgs.stdenv.system}.claude-code
      inputs.nix-ai-tools.packages.${pkgs.stdenv.system}.droid
      inputs.nix-ai-tools.packages.${pkgs.stdenv.system}.forge
      inputs.nix-ai-tools.packages.${pkgs.stdenv.system}.gemini-cli
      inputs.nix-ai-tools.packages.${pkgs.stdenv.system}.goose-cli
      inputs.nix-ai-tools.packages.${pkgs.stdenv.system}.qwen-code
    ]
    ++ (
      # you can access the host configuration using osConfig.
      pkgs.lib.optionals (osConfig.programs.vim.enable && pkgs.stdenv.isDarwin) [ pkgs.skhd ]
    );

  home.stateVersion = "24.11"; # initial home-manager state
}
