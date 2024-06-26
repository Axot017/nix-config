{ config, pkgs, lib, ... }: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      character = {
        success_symbol = "[λ](bold cyan)";
        error_symbol = "[λ](bold red)";
        vimcmd_symbol = "[V](bold cyan)";
        vimcmd_replace_one_symbol = "[V](bold purple)";
        vimcmd_replace_symbol = "[V](bold purple)";
        vimcmd_visual_symbol = "[V](bold yellow)";
      };
      aws.format =
        "\\[[$symbol($profile)(\\($region\\))(\\[$duration\\])]($style)\\]";
      cmake.format = "\\[[$symbol($version)]($style)\\]";
      cmd_duration.format = "\\[[⏱ $duration ]($style)\\]";
      conda.format = "\\[[$symbol$environment]($style)\\]";
      crystal.format = "\\[[$symbol($version)]($style)\\]";
      dart.format = "\\[[$symbol($version)]($style)\\]";
      deno.format = "\\[[$symbol($version)]($style)\\]";
      docker_context.format = "\\[[$symbol$context]($style)\\]";
      dotnet.format = "\\[[$symbol($version)(🎯 $tfm)]($style)\\]";
      elixir.format =
        "\\[[$symbol($version \\(OTP $otp_version\\))]($style)\\]";
      elm.format = "\\[[$symbol($version)]($style)\\]";
      erlang.format = "\\[[$symbol($version)]($style)\\]";
      gcloud.format =
        "\\[[$symbol$account(@$domain)(\\($region\\))]($style)\\]";
      git_branch.format = "\\[[$symbol$branch]($style)\\]";
      git_status.format = "([\\[$all_status$ahead_behind\\]]($style))";
      golang.format = "\\[[$symbol($version)]($style)\\]";
      helm.format = "\\[[$symbol($version)]($style)\\]";
      hg_branch.format = "\\[[$symbol$branch]($style)\\]";
      java.format = "\\[[$symbol($version)]($style)\\]";
      julia.format = "\\[[$symbol($version)]($style)\\]";
      kotlin.format = "\\[[$symbol($version)]($style)\\]";
      kubernetes.format = "\\[[$symbol$context( \\($namespace\\))]($style)\\]";
      lua.format = "\\[[$symbol($version)]($style)\\]";
      memory_usage.format = "\\[$symbol[$ram( | $swap)]($style)\\]";
      nim.format = "\\[[$symbol($version)]($style)\\]";
      nix_shell.format = "\\[[$symbol$state( \\($name\\))]($style)\\]";
      nodejs.format = "\\[[$symbol($version)]($style)\\]";
      ocaml.format =
        "\\[[$symbol($version)(\\($switch_indicator$switch_name\\))]($style)\\]";
      openstack.format = "\\[[$symbol$cloud(\\($project\\))]($style)\\]";
      package.format = "\\[[$symbol$version]($style)\\]";
      perl.format = "\\[[$symbol($version)]($style)\\]";
      php.format = "\\[[$symbol($version)]($style)\\]";
      purescript.format = "\\[[$symbol($version)]($style)\\]";
      python.format =
        "\\[[$symbol$pyenv_prefix($version)(\\($virtualenv\\))]($style)\\]";
      red.format = "\\[[$symbol($version)]($style)\\]";
      ruby.format = "\\[[$symbol($version)]($style)\\]";
      rust.format = "\\[[$symbol($version)]($style)\\]";
      scala.format = "\\[[$symbol($version)]($style)\\]";
      swift.format = "\\[[$symbol($version)]($style)\\]";
      terraform.format = "\\[[$symbol$workspace]($style)\\]";
      time.format = "\\[[$time]($style)\\]";
      username.format = "\\[[$user]($style)\\]";
      vagrant.format = "\\[[$symbol($version)]($style)\\]";
      vlang.format = "\\[[$symbol($version)]($style)\\]";
      zig.format = "\\[[$symbol($version)]($style)\\]";
      format = lib.concatStrings [
        "[┌](bold cyan) $username"
        "$hostname"
        "$shlvl"
        "$kubernetes"
        "$directory"
        "$vcsh"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_metrics"
        "$git_status"
        "$hg_branch"
        "$docker_context"
        "$package"
        "$cmake"
        "$dart"
        "$deno"
        "$dotnet"
        "$elixir"
        "$elm"
        "$erlang"
        "$golang"
        "$helm"
        "$java"
        "$julia"
        "$kotlin"
        "$nim"
        "$nodejs"
        "$ocaml"
        "$perl"
        "$php"
        "$purescript"
        "$python"
        "$red"
        "$ruby"
        "$rust"
        "$scala"
        "$swift"
        "$terraform"
        "$vlang"
        "$vagrant"
        "$zig"
        "$nix_shell"
        "$conda"
        "$memory_usage"
        "$aws"
        "$openstack"
        "$env_var"
        "$crystal"
        "$custom"
        "$cmd_duration"
        "$line_break"
        "$lua"
        "$jobs"
        "$battery"
        "$time"
        "$status"
        "$shell"
        "[└](bold cyan) $character"
      ];
    };
  };
}
