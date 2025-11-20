{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      palette = "salvage_denim";

      palettes.salvage_denim = {
        light_faded = "#DEDEE6";
        silver = "#C3C3C3";
        stonewashed = "#7C8594";
        vintage = "#2E4566";
        deep_indigo = "#1D3456";
        midnight = "#152C4C";
        navy = "#12253F";
        dark_wash = "#091C38";
        black_denim = "#061930";
      };

      format = ''
        [╭────](bold light_faded) $os$directory$git_branch$git_status$aws$buf$bun$c$cpp$cmake$conda$crystal$dart$deno$docker_context$elixir$elm$fennel$fortran$fossil_branch$gcloud$golang$gradle$guix_shell$haskell$haxe$hg_branch$java$julia$kotlin$lua$memory_usage$meson$nim$nix_shell$nodejs$ocaml$package$perl$php$pijul_channel$pixi$python$rlang$ruby$rust$scala$swift$xmake$zig$os$cmd_duration$jobs$battery
        [╰─](bold light_faded) $character
      '';

      add_newline = false;

      character = {
        success_symbol = "[❯](bold light_faded)";
        error_symbol = "[❯](bold stonewashed)";
        vimcmd_symbol = "[❮](bold light_faded)";
      };

      directory = {
        style = "fg:light_faded bg:black_denim";
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
        style = "fg:vintage bg:black_denim";
      };

      git_status = {
        style = "fg:deep_indigo bg:black_denim";
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
        style = "fg:light_faded bg:black_denim";
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
        style = "fg:silver bg:black_denim";
        format = "[$hostname ]($style)";
        ssh_symbol = " ";
      };
      java.symbol = " ";
      julia.symbol = " ";
      kotlin.symbol = " ";
      lua.symbol = " ";
      memory_usage = {
        symbol = "";
        style = "fg:navy bg:black_denim";
      };
      meson.symbol = "󰔷 ";
      nim.symbol = "󰆥 ";
      nix_shell.symbol = " ";
      nodejs.symbol = " ";
      ocaml.symbol = " ";
      package = {
        symbol = "󰏗 ";
        style = "fg:dark_wash bg:black_denim";
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
        style = "fg:light_faded bg:black_denim";
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
        style = "fg:stonewashed bg:black_denim";
        format = "[$symbol$status]($style) ";
      };

      cmd_duration = {
        format = "[$duration]($style) ";
        style = "fg:stonewashed bg:black_denim";
      };

      jobs = {
        symbol = "";
        style = "fg:midnight bg:black_denim";
        format = "[$symbol$number]($style) ";
      };

      username = {
        show_always = true;
        style_user = "fg:silver bg:black_denim";
        style_root = "fg:vintage bg:black_denim";
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
