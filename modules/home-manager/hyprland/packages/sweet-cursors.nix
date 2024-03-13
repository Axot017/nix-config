{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "sweet-theme";
  src = pkgs.fetchurl {
    url = "https://files04.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE1OTE5OTM4NTUiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6IjVkNGFiZTUyMGFmMzllYTQ5NTNjMGRiOWViZTY1ZWY2YmMxOWYzZTllYWUwNzg0MTAzNmYxMzE0MThiYzNlZDc4Mjc5OTIxNDA1YjJkZmQxMzBlZGViMTU1YWIxYzVhNDhiNmEzYWIwODRmNjUzNWI0M2FjNmI1MDMzZDQ1YmJkIiwidCI6MTcxMDM2MzIwMywic3RmcCI6bnVsbCwic3RpcCI6bnVsbH0.-XIVv_1rJ06CvBb6mreyFnc_EKZWuhDAD6K1RHbNCdQ/Sweet-cursors.tar.xz";
    sha256 = "";
  };
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out
    tar -xf $src -C $out/
  '';
}
