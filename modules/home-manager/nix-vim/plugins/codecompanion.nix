{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.codecompanion = {
    enable = true;
    settings = {
      adapters = {
        anthropic.__raw = ''
          function()
            return require("codecompanion.adapters").extend("anthropic", {
              env = {
                api_key = "cmd:cat ~/.config/secret/anthropic | tr -d '\n'",
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
