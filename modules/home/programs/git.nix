{
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Armin Babaei";
        email = "armin.babaei@me.com";
      };

      alias = {
        co = "checkout";
        br = "branch";
        ci = "commit";
        st = "status";
        unstage = "reset HEAD --";
        last = "log -1 HEAD";
        visual = "!gitk";
        graph = "log --oneline --graph --all -20";
      };

      core.editor = "nvim";
      credential.helper = "osxkeychain";
      filter.lfs = {
        clean = "git-lfs clean -- %f";
        smudge = "git-lfs smudge -- %f";
        process = "git-lfs filter-process";
        required = true;
      };
    };

    hooks = {
      commit-msg = "${pkgs.commitizen}/bin/cz check --commit-msg-file $1";
      pre-commit = "${pkgs.commitizen}/bin/cz check --allow-abort";
    };

    lfs.enable = true;
  };

  home.packages = with pkgs; [
    commitizen
  ];
}
