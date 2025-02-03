{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.codecompanion = {
    enable = true;
    settings = {
      strategies = {
        agent.adapter = "copilot";
        chat.adapter = "copilot";
        inline.adapter = "copilot";
      };
    };
  };
  programs.nixvim.extraConfigLua = ''
    require("codecompanion").setup({
        strategies = { agent = { adapter = "copilot" }, chat = { adapter = "copilot" }, inline = { adapter = "copilot" } },
    })
  '';
}
