{ config, pkgs, ... }: {
  stylix = { targets = { nixvim = { enable = false; }; }; };
}
