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
  mcphub-nvim = (pkgs.vimUtils.buildVimPlugin {
    name = "mcphub.nvim";
    dependencies = with pkgs.vimPlugins; [ plenary-nvim ];
    src = pkgs.fetchFromGitHub {
      owner = "ravitemer";
      repo = "mcphub.nvim";
      rev = "v5.6.0";
      sha256 = "sha256-wA+1F6gYddRa25q7csi4h48KD4xDtR406Cy/pXoxe6w=";
    };
    nvimSkipModules = [
      "bundled_build"
      "mcphub.extensions.lualine"
      "mcphub.extensions.codecompanion.xml_tool"
    ];
  });
in {
  home.packages = [ mcphub ];
  home.file.".config/mcphub/servers.json".text = let
    serverConfig = {
      mcpServers = {
        context7 = {
          command = "${pkgs.nodejs_24}/bin/npx";
          args = [ "-y" "@upstash/context7-mcp" ];
        };
      };
    };
  in builtins.toJSON serverConfig;
  programs.nixvim.extraPlugins = [ mcphub-nvim ];
  programs.nixvim.extraConfigLua = ''
    require("mcphub").setup({
        cmd = "${mcphub-nvim}/bin/mcp-hub"
    })
  '';
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
                  default = "google/gemini-2.5-flash-preview-05-20",
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
      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion";
          opts = {
            show_result_in_chat = true;
            make_vars = true;
            make_slash_commands = true;
          };
        };
      };
    };
  };
}
