{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      palette = "dracula";

      palettes.dracula = {
        background = "#282a36";
        current_line = "#44475a";
        foreground = "#f8f8f2";
        comment = "#6272a4";
        red = "#ff5555";
        orange = "#ffb86c";
        yellow = "#f1fa8c";
        green = "#50fa7b";
        cyan = "#8be9fd";
        blue = "#bd93f9";
        purple = "#ff79c6";
      };

      format = "$os$directory$git_branch$git_status$aws$buf$bun$c$cpp$cmake$conda$crystal$dart$deno$docker_context$elixir$elm$fennel$fortran$fossil_branch$gcloud$golang$gradle$guix_shell$haskell$haxe$hg_branch$java$julia$kotlin$lua$memory_usage$meson$nim$nix_shell$nodejs$ocaml$package$perl$php$pijul_channel$pixi$python$rlang$ruby$rust$scala$swift$xmake$zig$cmd_duration$jobs$battery $character ";

      add_newline = false;

      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
        vimcmd_symbol = "[❮](bold cyan)";
      };

      directory = {
        style = "fg:foreground bg:background";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
        read_only = " 󰌾";
        substitutions = {
          "~" = "";
          "Documents" = " ";
          "Desktop" = " ";
          "Downloads" = " ";
          "Music" = " ";
          "Pictures" = " ";
        };
      };

      git_branch = {
        symbol = "";
        style = "fg:purple bg:background";
      };

      git_status = {
        style = "fg:red bg:background";
        ahead = "⇡$\{count\}";
        behind = "⇣$\{count\}";
        diverged = "⇕⇡$\{ahead_count\}⇣$\{behind_count\}";
        renamed = "↩$\{count\}";
        deleted = "x$\{count\}";
      };

      fill.symbol = "";

      time = {
        disabled = false;
        format = "[ $time ]($style)";
        style = "fg:foreground bg:background";
        time_format = "%R";
      };

      aws.symbol = " ";
      buf.symbol = " ";
      bun.symbol = " ";
      c.symbol = " ";
      cpp.symbol = " ";
      cmake.symbol = " ";
      conda.symbol = " ";
      crystal.symbol = " ";
      dart.symbol = " ";
      deno.symbol = " ";
      docker_context.symbol = " ";
      elixir.symbol = " ";
      elm.symbol = " ";
      fennel.symbol = " ";
      fortran.symbol = " ";
      fossil_branch.symbol = " ";
      gcloud.symbol = " ";
      golang.symbol = " ";
      gradle.symbol = " ";
      guix_shell.symbol = " ";
      haskell.symbol = " ";
      haxe.symbol = " ";
      hg_branch.symbol = " ";
      hostname = {
        ssh_only = false;
        style = "fg:foreground bg:background";
        format = "[$hostname ]($style)";
        ssh_symbol = " ";
      };
      java.symbol = " ";
      julia.symbol = " ";
      kotlin.symbol = " ";
      lua.symbol = " ";
      memory_usage = {
        symbol = "";
        style = "fg:blue bg:background";
      };
      meson.symbol = "󰔷 ";
      nim.symbol = "󰆥 ";
      nix_shell.symbol = " ";
      nodejs.symbol = " ";
      ocaml.symbol = " ";
      package = {
        symbol = "󰏗 ";
        style = "fg:yellow bg:background";
      };
      perl.symbol = " ";
      php.symbol = " ";
      pijul_channel.symbol = " ";
      pixi.symbol = "󰏗 ";
      python.symbol = " ";
      rlang.symbol = "󰟔 ";
      ruby.symbol = " ";
      rust.symbol = "󱘗 ";
      scala.symbol = " ";
      swift.symbol = " ";
      xmake.symbol = " ";
      zig.symbol = " ";

      os = {
        format = "[$symbol$os]($style)";
        style = "fg:foreground bg:background";
        symbols = {
          AIX = " ";
          AlmaLinux = " ";
          Alpaquita = " ";
          Alpine = " ";
          Amazon = " ";
          Android = " ";
          AOSC = " ";
          Arch = " ";
          Artix = " ";
          Bluefin = " ";
          CachyOS = " ";
          CentOS = " ";
          Cygwin = " ";
          Debian = " ";
          DragonFly = " ";
          Emscripten = " ";
          EndeavourOS = " ";
          Fedora = " ";
          FreeBSD = " ";
          Garuda = " ";
          Gentoo = " ";
          HardenedBSD = " ";
          Illumos = " ";
          Kali = " ";
          Linux = " ";
          Mabox = " ";
          Macos = " ";
          Manjaro = " ";
          Mariner = " ";
          MidnightBSD = " ";
          Mint = " ";
          NetBSD = " ";
          NixOS = " ";
          Nobara = " ";
          OpenBSD = " ";
          OpenCloudOS = " ";
          openEuler = " ";
          openSUSE = " ";
          OracleLinux = " ";
          Pop = " ";
          Raspbian = " ";
          Redhat = " ";
          RedHatEnterprise = " ";
          Redox = " ";
          RockyLinux = " ";
          Solus = " ";
          SUSE = " ";
          Ubuntu = " ";
          Ultramarine = " ";
          Uos = " ";
          Void = " ";
          Unknown = " ";
          Windows = " ";
        };
      };

      status = {
        disabled = false;
        symbol = "✖";
        style = "fg:red bg:background";
        format = "[$symbol$status]($style) ";
      };

      cmd_duration = {
        format = "[$duration]($style) ";
        style = "fg:orange bg:background";
      };

      jobs = {
        symbol = "";
        style = "fg:yellow bg:background";
        format = "[$symbol$number]($style) ";
      };

      username = {
        show_always = true;
        style_user = "fg:foreground bg:background";
        style_root = "fg:red bg:background";
        format = "[$user ]($style)";
      };

      line_break = {
        disabled = false;
      };

      battery = {
        full_symbol = "⚡";
        charging_symbol = " ";
        discharging_symbol = " ";
        display = [
          {
            threshold = 25;
            style = "bold red";
          }
        ];
      };
    };
  };
}
