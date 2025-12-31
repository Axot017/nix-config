{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.zsh = {
    enable = true;
    syntaxHighlighting = {
      enable = true;
    };
    autosuggestion.enable = true;
    enableCompletion = true;
    initContent = ''
      autoload -U compinit
      zstyle ':completion:*' menu select
      zmodload zsh/complist
      compinit
      _comp_options+=(globdots)

      autoload -Uz edit-command-line
      zle -N edit-command-line
      bindkey '^X^E' edit-command-line

      bindkey ' ' magic-space

      if command -v pbcopy &> /dev/null; then
          alias -g C='| pbcopy'
      elif command -v wl-copy &> /dev/null; then
          alias -g C='| wl-copy'
      elif command -v xclip &> /dev/null; then
          alias -g C='| xclip -selection clipboard'
      fi

      alias -g NE='2>/dev/null'
      alias -g NO='>/dev/null'
      alias -g NUL='>/dev/null 2>&1'
      alias -g J='| jq'

      autoload -Uz zmv

      hash -d proj=~/Projects
      hash -d nix=~/Projects/nix-config
      hash -d dl=~/Downloads

      # Use vim keys in tab complete menu:
      bindkey -M menuselect 'h' vi-backward-char
      bindkey -M menuselect 'k' vi-up-line-or-history
      bindkey -M menuselect 'l' vi-forward-char
      bindkey -M menuselect 'j' vi-down-line-or-history
      bindkey -v '^?' backward-delete-char

      source <(fzf --zsh)
    '';
  };
}
