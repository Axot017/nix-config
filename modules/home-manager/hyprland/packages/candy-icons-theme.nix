{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "candy-icons-theme";
  src = pkgs.fetchFromGitHub {
    owner = "EliverLara";
    repo = "candy-icons";
    rev = "3b36e89485daab8845f5793f9cbd2bc2ae2e303d";
    sha256 = "sha256-v6aXcCDHGcoj/BOkQJ1xQdOsKvJvXkrrc7pIxgVkJX8=";
  };
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out
    ${pkgs.unzip}/bin/unzip $src -d $out/
    mv $out/candy-icons-master $out/Candy-Icons
  '';
}
