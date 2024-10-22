{ config, pkgs, ... }: {
  programs = {
    alacritty = {
      enable = true;
      settings = {
        keyboard.bindings = [
          {
            key = "-";
            mods = "Control";
            action = "IncreaseFontSize";
          }
          {
            key = "0";
            mods = "Control";
            action = "DecreaseFontSize";
          }
        ];
      };
    };
  };
}
