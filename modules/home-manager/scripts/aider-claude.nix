{ pkgs, ... }:

pkgs.writeShellScriptBin "aider-claude" ''
  set -e

  # Load the Anthropic API key from the secret file
  export ANTHROPIC_API_KEY=$(cat ~/.config/.secret/anthropic)

  # Run aider with the specified model
  aider --model anthropic/claude-3-7-sonnet-latest "$@"
''
