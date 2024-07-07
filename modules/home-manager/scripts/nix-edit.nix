{ pkgs, ... }:

pkgs.writeShellScriptBin "nix-edit" ''
  set -e
  pushd ~/Projects/nix-config
  nvim .
  git diff -U0 *.nix
  git add -A
  echo "NixOS - rebuilding..."
  sudo nixos-rebuild switch --flake .#default

  gen=$(nixos-rebuild list-generations --flake .#default | grep current)
  git commit -m "$gen"

  echo "NixOS - build finished"

  echo "Should I push the changes? [y/n]"

  read -r answer

  if [ "$answer" = "y" ]; then
    git push
  fi

  popd
''
