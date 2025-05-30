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
          command = "docker";
          args = [ "run" "-i" "--rm" "mcp/context7" ];
        };
      };
    };
  in builtins.toJSON serverConfig;
  programs.nixvim.extraPlugins = [ mcphub-nvim ];
  programs.nixvim.extraConfigLua = ''
    require("mcphub").setup({
        cmd = "${mcphub}/bin/mcp-hub"
    })
  '';

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>ca";
      action = "<cmd>CodeCompanionActions<cr>";
      options = { silent = true; };
    }
    {
      mode = "n";
      key = "<leader>cc";
      action = "<cmd>CodeCompanionChat Toggle<cr>";
      options = { silent = true; };
    }
    {
      mode = "v";
      key = "<leader>ci";
      action = "<cmd>CodeCompanionChat Add<cr>";
      options = { silent = true; };
    }
    {
      mode = "v";
      key = "<leader>ci";
      action.__raw = ''
        function()
          vim.ui.input({ prompt = "Enter prompt: " }, function(input)
            if input then
              vim.cmd("CodeCompanion " .. input)
            end
          end)
        end
      '';
      options = { silent = true; };
    }
  ];
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
