{ pkgs, config, inputs, ... }:

let
  mcphub = (pkgs.buildNpmPackage {
    name = "mcp-hub";
    src = pkgs.fetchFromGitHub {
      owner = "ravitemer";
      repo = "mcp-hub";
      rev = "v3.3.0";
      sha256 = "sha256-IIgV3GLdKUW2rG2DFKt8pUKdbGyr604C3EmpuhOL++Y=";
    };
    npmDepsHash = "sha256-nALbWyVz78fiX6fFcrnlg2roF62qNzs4iclrvdSvhu8=";
  });
in {
  home.packages = [ mcphub ];
  programs.nixvim.plugins.codecompanion = {
    enable = true;
    settings = {
      adapters = {
        anthropic.__raw = ''
          function()
            return require("codecompanion.adapters").extend("anthropic", {
              env = {
                api_key = "cmd:cat ~/.config/.secret/anthropic | tr -d '\n'",
              },
            })
          end
        '';
        openrouter.__raw = ''
          function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              env = {
                api_key = "cmd:cat ~/.config/.secret/openrouter | tr -d '\n'",
                url = "https://openrouter.ai/api",
                chat_url = "/v1/chat/completions",
              },
              schema = {
                model = {
                  gemini = "google/gemini-2.5-flash-preview-05-20",
                },
              },
            })
          end
        '';
      };
      strategies = {
        agent.adapter = "anthropic";
        chat.adapter = "anthropic";
        inline.adapter = "anthropic";
      };
    };
  };
}
