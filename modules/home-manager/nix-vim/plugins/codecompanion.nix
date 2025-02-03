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
}
