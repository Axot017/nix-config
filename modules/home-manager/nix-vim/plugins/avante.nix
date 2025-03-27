{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins.avante = {
    enable = true;
    settings = {
      provider = "claude";
      file_selector = { provider = "snacks"; };
    };
    luaConfig.pre = ''
      function get_secret(vendor)
        local path = os.getenv("HOME") .. "/.config/.secret/" .. vendor
        local f = io.open(path, "r")
        if f == nil then
          return ""
        end
        local key = f:read("*all")
        f:close()

        return string.gsub(key, "\n", "")
      end

      os.setenv("GEMINI_API_KEY", get_secret("gemini"))
      os.setenv("ANTHROPIC_API_KEY", get_secret("anthropic"))
    '';
  };
}
