{ pkgs, ... }:

pkgs.writeShellScriptBin "aider-claude" ''
  set -e

  export ANTHROPIC_API_KEY=$(cat ~/.config/.secret/anthropic)

  ${pkgs.aider-chat}/bin/aider --model anthropic/claude-3-7-sonnet-latest "$@"
''
