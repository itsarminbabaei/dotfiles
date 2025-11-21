# Zellij - Terminal multiplexer and layout engine
# Docs: https://zellij.dev/
# Rationale: Modern multiplexer alternative with Dracula theme

{
  programs.zellij = {
    enable = true;
    settings = {
      theme = "dracula";
      themes.dracula = {
        fg = [248 248 242];
        bg = [40 42 54];
        black = [33 34 44];
        red = [255 85 85];
        green = [80 250 123];
        yellow = [241 250 140];
        blue = [189 147 249];
        magenta = [255 121 198];
        cyan = [139 233 253];
        white = [248 248 242];
      };
    };
  };
}
