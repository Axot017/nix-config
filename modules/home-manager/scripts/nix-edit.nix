{ pkgs, ... }:

pkgs.writeShellApplication {
  name = "nix-edit-2";
  text = ''
    set -e
    pushd ~/Projects/nix-config
    nvim .
    git diff -U0 *.nix
    git add -A
    echo "NixOS - rebuilding..."
    sudo nixos-rebuild switch --flake .#default &>nixos-switch.log || cat nixos-switch.log

    gen=$(nixos-rebuild list-generations --flake .#default | grep current)
    git commit -m "$gen"

    echo "NixOS - build finished"

    popd
  '';
}
