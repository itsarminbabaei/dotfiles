# Render-markdown - Markdown rendering
# Docs: https://github.com/MeanderingProgrammer/markdown.nvim
# Renders markdown with proper formatting. Displays headers, links, code blocks styled.

{
  plugins.render-markdown = {
    enable = true;
    settings = {
      file_types = ["markdown" "Avante"];
      latex = {
        enabled = false;
      };
      yaml = {
        enabled = false;
      };
    };
  };
}
