{ inputs, pkgs, ... }:
{
  name = "dotfiles";

  packages = with pkgs; [
    nix
    home-manager
    git
  ] ++ (with inputs.nix-ai-tools.packages.${pkgs.system}; [
    # Main AI coding agents
    amp
    claude-code
    claude-code-router
    copilot-cli
    crush
    code
    droid
    eca
    forge
    groq-code-cli
    kilocode-cli
    nanocoder
    spec-kit

    # Related tools
    backlog-md
    catnip
    coderabbit-cli
    codex
    codex-acp
  ]);
}
