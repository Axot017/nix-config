{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "sweet-theme";
  src = pkgs.fetchFromGitHub {
    owner = "EliverLara";
    repo = "Sweet";
    rev = "0f79dedc505d946f8c1c57e0ce0c7da16a7bdee0";
    sha256 = "sha256-v6aXcCDHGcoj/BOkQJ1xQdOsKvJvXkrrc7pIxgVkJX8=";
  };
  installPhase = ''
    mkdir -p $out
    cp -r $src $out/Sweet-Ambar-Blue-Dark
  '';
}
