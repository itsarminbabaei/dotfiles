{ pkgs, perSystem }:
pkgs.mkShellNoCC {
  packages = [
    # Core tools
    pkgs.nix
    pkgs.home-manager
    pkgs.git

    # AI coding agents from nix-ai-tools
    perSystem.nix-ai-tools.amp
    perSystem.nix-ai-tools.backlog-md
    perSystem.nix-ai-tools.catnip
    perSystem.nix-ai-tools.claude-code
    perSystem.nix-ai-tools.crush
    perSystem.nix-ai-tools.droid
    perSystem.nix-ai-tools.forge
    perSystem.nix-ai-tools.gemini-cli
    perSystem.nix-ai-tools.goose-cli
    perSystem.nix-ai-tools.qwen-code
    perSystem.nix-ai-tools.spec-kit
  ];
}
