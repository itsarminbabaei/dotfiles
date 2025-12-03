# Bufferline - Tab bar
# Docs: https://github.com/akinsho/bufferline.nvim
# Shows open buffers as tabs at the top

{
  plugins.bufferline = {
    enable = true;
    settings = {
      options = {
        offsets = [
          {
            filetype = "oil";
            text = "File Explorer";
            separator = true;
          }
        ];
        exclude_ft = [ "oil" ];
      };
    };
  };
}
