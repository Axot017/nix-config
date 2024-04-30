{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "candy-icons-theme";
  src = pkgs.fetchurl {
    url =
      "https://github.com/EliverLara/candy-icons/archive/refs/heads/master.zip";
    sha256 = "sha256-wrsRoR7Ff7lWBc7ytn8omnP9uBmrXhxjlTyf3i+l2lI=";
  };
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out
    ${pkgs.unzip}/bin/unzip $src -d $out/
    mv $out/candy-icons-master $out/Candy-Icons
  '';
}
