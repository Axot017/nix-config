{ config, pkgs, lib, ... }:
{
  programs.zsh = {
    enable = true;
    plugins = [
      {
        name = "zsh-autosuggestions";
	src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
	  repo = "zsh-autosuggestions";
	  rev = "v0.7.0";
	  sha256 = "sha256-KLUYpUu4DHRumQZ3w59m9aTW6TBKMCXl2UcKi4uMd7w=";
	};
      }
    ];
  };
}
