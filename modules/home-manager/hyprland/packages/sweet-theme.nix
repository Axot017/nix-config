{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "sweet-theme";
  src = pkgs.fetchurl {
    url = "https://github.com/EliverLara/Sweet/releases/download/v4.0/Sweet-Ambar-Blue-Dark.zip";
    sha256 = "";
  };
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out
    ${pkgs.unzip}/bin/unzip $src -d $out/
  '';
}
