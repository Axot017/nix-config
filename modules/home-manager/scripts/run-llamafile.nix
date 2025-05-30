{ pkgs, ... }:
let
  rocmtoolkit_joined = pkgs.symlinkJoin {
    name = "rocm-merged";

    paths = with pkgs.rocmPackages; [ rocblas hipblas clr ];
  };
in pkgs.writeShellScriptBin "run-llamafile" ''
  if [ $# -eq 0 ] ; then
    echo "Usage: $0 wizardcoder.llamafile -ngl 9999"
    exit 2
  fi

  export PATH=${rocmtoolkit_joined}/bin
  export PATH=$PATH:${pkgs.clang}/bin
  export PATH=$PATH:${pkgs.coreutils}/bin
  export PATH=$PATH:${pkgs.gzip}/bin

  export HIPCC_COMPILE_FLAGS_APPEND="-I${rocmtoolkit_joined}/include -I${rocmtoolkit_joined}/include/rocblas"
  export HIPCC_LINK_FLAGS_APPEND="-L${rocmtoolkit_joined}/lib"

  export ROCM_PATH=${rocmtoolkit_joined}
  export ROCM_SOURCE_DIR=${rocmtoolkit_joined}

  /home/axot/Projects/zeta/zeta.llamafile --gpu amd
''
