# DAP - Debug Adapter Protocol
# Docs: https://github.com/mfussenegger/nvim-dap
# Debug support with adapters for Go (dap-go), UI, virtual text display of variables.

{
  plugins.dap = {
    enable = true;
  };

  plugins.dap-go = {
    enable = true;
  };

  plugins.dap-ui = {
    enable = true;
    settings = {
      expand_lines = true;
      force_buffers = true;
    };
  };

  plugins.dap-virtual-text = {
    enable = true;
  };
}
