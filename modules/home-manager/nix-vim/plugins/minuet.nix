{ pkgs, config, inputs, ... }:
let
  tree-sitter-yaml = (pkgs.python3Packages.buildPythonPackage rec {
    pname = "tree-sitter-yaml";
    version = "0.7.0";
    format = "wheel";
    src = pkgs.python3Packages.fetchPypi {
      inherit version format;
      pname = "tree_sitter_yaml";
      sha256 = "sha256-nRsmg3glT3W7Jzltg8ltiGzL/Npr2MJ3jpTj4dJFkIU=";
      abi = "abi3";
      python = "cp39";
      dist = "cp39";
      platform =
        "manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64";
    };
  });
  tree-sitter-embedded-template = (pkgs.python3Packages.buildPythonPackage rec {
    pname = "tree-sitter-embedded-template";
    version = "0.23.2";
    format = "wheel";
    src = pkgs.python3Packages.fetchPypi {
      inherit version format;
      pname = "tree_sitter_embedded_template";
      sha256 = "sha256-vPoB9iuI1Q28tzbMI7rsjdv+CNqs/cYT7ujASrZe/Qk=";
      abi = "abi3";
      python = "cp39";
      dist = "cp39";
      platform =
        "manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64";
    };
  });
  tree-sitter-c-sharp = (pkgs.python3Packages.buildPythonPackage rec {
    pname = "tree-sitter-c-sharp";
    version = "0.23.1";
    format = "wheel";
    src = pkgs.python3Packages.fetchPypi {
      inherit version format;
      pname = "tree_sitter_c_sharp";
      sha256 = "sha256-qAJORmsvVhHG3JAyHyMthYSJPH+4i3XkqDGZL4d2FtI=";
      abi = "abi3";
      python = "cp39";
      dist = "cp39";
      platform =
        "manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64";
    };
  });
  tree-sitter-language-pack = (pkgs.python3Packages.buildPythonPackage rec {
    pname = "tree-sitter-language-pack";
    version = "0.6.1";
    format = "wheel";
    propagatedBuildInputs = with pkgs.python3Packages; [
      tree-sitter
      tree-sitter-yaml
      tree-sitter-c-sharp
      tree-sitter-embedded-template
    ];
    src = pkgs.python3Packages.fetchPypi {
      inherit version format;
      pname = "tree_sitter_language_pack";
      sha256 = "sha256-JA8JMO8dtoYAksgXSBOb9Rkvjt38wOqKXm9WjLi7cOY=";
      abi = "abi3";
      python = "cp39";
      dist = "cp39";
      platform = "manylinux2014_x86_64";
    };
  });
  chromadb = (pkgs.python3Packages.buildPythonPackage rec {
    pname = "chromadb";
    version = "0.6.3";
    format = "wheel";
    propagatedBuildInputs = with pkgs.python3Packages; [
      bcrypt
      build
      chroma-hnswlib
      fastapi
      grpcio
      httpx
      importlib-resources
      kubernetes
      mmh3
      numpy
      onnxruntime
      opentelemetry-api
      opentelemetry-exporter-otlp-proto-grpc
      opentelemetry-instrumentation-fastapi
      opentelemetry-sdk
      orjson
      overrides
      posthog
      pulsar-client
      pydantic
      pypika
      pyyaml
      requests
      tenacity
      tokenizers
      tqdm
      typer
      typing-extensions
      uvicorn
    ];
    src = pkgs.python3Packages.fetchPypi {
      inherit pname version format;
      python = "py3";
      dist = "py3";
      sha256 = "sha256-SFElhImjYStVhIjZjQmuD+CijVyta9G6ZLlv3EGdwOU=";
    };
    # Make sure Python can find the modules
    postInstall = ''
      export PYTHONPATH="$out/${pkgs.python3.sitePackages}:$PYTHONPATH"
    '';
  });
  vectorcode = (pkgs.python3Packages.buildPythonApplication rec {
    pname = "vectorcode";
    version = "0.4.12";
    format = "wheel";
    propagatedBuildInputs = with pkgs.python3Packages; [
      chromadb
      sentence-transformers
      pathspec
      tabulate
      shtab
      numpy
      psutil
      httpx
      tree-sitter
      tree-sitter-language-pack
      pygments
    ];
    src = pkgs.python3Packages.fetchPypi {
      inherit pname version format;
      python = "py3";
      dist = "py3";
      sha256 = "sha256-QzrgyKTMDKwo5X9A4eM3IHpWQRkDiQvfZT4g5d181yA=";
    };
    # Make sure vectorcode can find the chromadb module
    makeWrapperArgs = [
      "--set PYTHONPATH ${chromadb}/${pkgs.python3.sitePackages}:$PYTHONPATH"
    ];
  });
in {
  home = { packages = [ vectorcode ]; };
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.minuet-ai-nvim ];
    extraConfigLua = ''
      require('minuet').setup({
        cmp = {
          enable_auto_complete = false,
        },
        blink = {
          enable_auto_complete = false,
        },
        virtualtext = {
          show_on_completion_menu = true,
          auto_trigger_ft = {},
          keymap = {
            accept = '<C-y>',
          },
        },
        provider = "gemini",
        throttle = 0,
        debounce = 150,
        n_completions = 1,
        provider_options = {
          gemini = {
            api_key = function()
              local path = os.getenv("HOME") .. "/.config/.secret/gemini"
              local f = io.open(path, "r")
              if f == nil then
                return ""
              end
              local key = f:read("*all")
              f:close()

              return string.gsub(key, "\n", "")
            end,
            optional = {},
          },
        }
      })

      vim.cmd[[
        Minuet virtualtext enable
      ]]
    '';
  };
}
