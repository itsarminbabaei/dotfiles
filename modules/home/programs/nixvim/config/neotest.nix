# Neotest - Test runner
# Docs: https://github.com/nvim-neotest/neotest
# Unified interface for running tests. Includes Go adapter. Shows status/output inline.

{
  plugins.neotest = {
    enable = true;
    adapters = {
      go = { enable = true; };
    };
    settings = {
      icons = {
        expanded = "";
        collapsed = "";
        failed = "";
        passed = "";
        running = "";
        skipped = "";
      };
    };
  };
}
