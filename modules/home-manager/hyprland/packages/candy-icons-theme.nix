
{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "candy-icons-theme";
  src = pkgs.fetchurl {
    url = "https://github.com/EliverLara/candy-icons/archive/refs/heads/master.zip";
    sha256 = "sha256-e9XAnP5LC6AB4oV0GU5ckz9JTo5hek35Dl2gm359y4I=";
  };
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out
    ${pkgs.unzip}/bin/unzip $src -d $out/
    mv $out/candy-icons-master $out/Candy-Icons
  '';
}
