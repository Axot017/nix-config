{ pkgs, ... }:

pkgs.writeShellScriptBin "aider-gemini" ''
  set -e

  # Load the Gemini API key from the secret file
  export GEMINI_API_KEY=$(cat ~/.config/.secret/gemini)

  # Run aider with the specified model
  aider --model gemini/gemini-2.0-flash "$@"
''
