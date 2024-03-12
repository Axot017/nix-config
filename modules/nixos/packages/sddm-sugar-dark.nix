{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "sugar-dark";
  src = pkgs.fetchurl {
    url = "https://github.com/MarianArlt/sddm-sugar-dark/archive/refs/tags/v1.2.zip";
    sha256 = "sha256-ICT8EmjxgIMhjergi0/VdunE5Rw4kPzLPVeFfao0xY4=";
  };
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out
    ${pkgs.unzip}/bin/unzip $src -d $out/tmp
    cp "$out/tmp/sddm-sugar-dark-1.2/*" $out
    rm -r "$out/tmp"
  '';
}
