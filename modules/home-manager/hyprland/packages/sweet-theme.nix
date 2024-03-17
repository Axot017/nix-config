{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "sweet-theme";
  src = pkgs.fetchFromGitHub {
    owner = "EliverLara";
    repo = "Sweet";
    rev = "0f79dedc505d946f8c1c57e0ce0c7da16a7bdee0";
    sha256 = "sha256-e9XAnP5LC6AB4oV0GU5ckz9JTo5hek35Dl2gm359y4I=";
  };
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out
    cp -r $src $out
  '';
}
