
{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "candy-icons-theme";
  src = pkgs.fetchurl {
    url = "https://github.com/EliverLara/candy-icons/archive/refs/heads/master.zip";
    sha256 = "sha256-Xk+kx27V3DJSdSrGLgIN4asWdTpxzqZU9PtO7tRk4SU=";
  };
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out
    ${pkgs.unzip}/bin/unzip $src -d $out/
    mv $out/candy-icons-master $out/Candy-Icons
  '';
}
