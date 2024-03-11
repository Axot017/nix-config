{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "chili";
  src = pkgs.fetchurl {
    url = "https://github.com/MarianArlt/sddm-chili/archive/refs/tags/0.1.5.zip";
    sha256 = "";
  };
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out
    ${pkgs.unzip}/bin/unzip $src -d $out/
  '';
}
