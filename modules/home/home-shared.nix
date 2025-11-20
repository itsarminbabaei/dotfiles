{ pkgs, osConfig, inputs, ... }:
{

  # only available on linux, disabled on macos
  services.ssh-agent.enable = pkgs.stdenv.isLinux;

  # Nixvim configuration
  programs.nixvim = {
    enable = true;
    # Import nixvim config from dedicated module
    imports = [ inputs.nixvim.homeManagerModules.nixvim ./programs/nixvim/config ];
  };

  home.packages =
    [ pkgs.ripgrep ]
    ++ (
      # you can access the host configuration using osConfig.
      pkgs.lib.optionals (osConfig.programs.vim.enable && pkgs.stdenv.isDarwin) [ pkgs.skhd ]
    );

  home.stateVersion = "24.11"; # initial home-manager state
}
