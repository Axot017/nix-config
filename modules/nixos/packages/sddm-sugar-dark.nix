{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "sugar-dark";
  src = pkgs.fetchurl {
    url = "https://github.com/MarianArlt/sddm-sugar-dark/archive/refs/tags/v1.2.zip";
    sha256 = "";
  };
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out
    ${pkgs.unzip}/bin/unzip -j $src -d $out/
  '';
}
