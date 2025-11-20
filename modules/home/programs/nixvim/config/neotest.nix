{
  plugins.neotest = {
    enable = true;
    adapters = {
      go = true;
      python = true;
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
