{ config, pkgs, ... }: {
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
      control-center-margin-right = 8;
      control-center-margin-top = 8;
      control-center-margin-bottom = 8;
      notification-icon-size = 64;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
      timeout = 10;
      timeout-low = 5;
      timeout-critical = 0;
      fit-to-screen = true;
      control-center-width = 500;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = true;
      hide-on-action = true;
      script-fail-notify = true;
      widgets = [ "title" "notifications" "volume" "mpris" "buttons-grid" ];
      widget-config = {
        title = {
          text = "Notification Center";
          clear-all-button = true;
          button-text = "󰆴 Clear";
        };
        mpris = {
          image-size = 64;
          image-radius = 8;
        };
        volume = { label = "󰕾"; };
        buttons-grid = {
          actions = [
            {
              label = "󰐥";
              command = "systemctl poweroff";
            }
            {
              label = "󰜉";
              command = "systemctl reboot";
            }
            {
              label = "󰌾";
              command = "";
            }
            {
              label = "󰖩";
              command = "alacritty -e nmtui";
            }
            {
              label = "󰜉";
              command = "";
            }
          ];
        };
      };
    };
    style = ''
      @define-color bg ${config.lib.stylix.colors.withHashtag.base00};
      @define-color border-color ${config.lib.stylix.colors.withHashtag.base0D};
      @define-color fg-light ${config.lib.stylix.colors.withHashtag.base08};
      @define-color warning ${config.lib.stylix.colors.withHashtag.base0E};
      @define-color error ${config.lib.stylix.colors.withHashtag.base0F};
      @define-color text-color ${config.lib.stylix.colors.withHashtag.base05};
      @define-color text-color-disabled ${config.lib.stylix.colors.withHashtag.base04};

      * {
        font-family: JetBrainsMonoNL Nerd Font Mono;
      }

      .notification-group {
        padding: 8px;
      }

      .notification-row {
        outline: none;
        margin: 0px;
        padding: 0px;
      }

      .notification {
        background: @bg;
        border-top-left-radius: 8px;
        border-top-right-radius: 8px;

        border-bottom-left-radius: 32px;
        border-bottom-right-radius: 8px;

        border: 1px solid @border-color;
        margin: 3px -2px 3px 0px;

        padding-left: 24px;
        padding-top: 4px;
        padding-bottom: 4px;
        padding-right: 4px;
      }

      .notification-content {
        background: @bg;
      }

      .close-button {
        color: @warning;
        background: @bg;
        text-shadow: none;
        padding: 0px;
        border-radius: 0px;
        margin-top: 5px;
        margin-right: 5px;
      }

      .notification-action {
        color: @text-color;
      }
      .notification-default-action:hover,
      .notification-action:hover {
        background: transparent;
        color: @warning;
      }

      .inline-reply {
        margin-top: 8px;
      }

      .inline-reply-entry {
        background: @noti-bg-darker;
        color: @text-color;
        caret-color: @text-color;
        border: 1px solid @border-color;
        border-radius: 5px;
      }

      .inline-reply-button {
        margin-left: 4px;
        background: @noti-bg;
        border: 1px solid @border-color;
        border-radius: 5px;
        color: @text-color;
      }

      .inline-reply-button:disabled {
        background: initial;
        color: @text-color-disabled;
        border: 1px solid transparent;
      }

      .inline-reply-button:hover {
        background: @noti-bg-hover;
      }

      .image {
        border-radius: 0px;
        margin-right: 10px;
      }

      .summary {
        font-size: 16px;
        font-weight: 700;
        background: transparent;
        color: rgba(158, 206, 106, 1);
        text-shadow: none;
      }

      .body {
        font-size: 15px;
        font-weight: 400;
        background: transparent;
        color: @text-color;
        text-shadow: none;
      }

      .control-center {
        background: @bg;
        border: 2px solid @border-color;
        border-radius: 8px;
      }

      .control-center-list {
        background: transparent;
      }

      .control-center-list-placeholder {
        opacity: 0.5;
      }

      .floating-notifications {
        background: transparent;
      }

      .blank-window {
        background: alpha(black, 0.1);
      }

      .widget-title {
        color: @text-color;
        background: transparent;
        margin-top: 24px;
        margin-bottom: 16px;
        font-size: 1.3rem;
      }

      .widget-title > button {
        font-size: 1rem;
        color: @text-color;
        background: transparent;
        border: 1px solid @text-color-disabled;
        text-shadow: none;
        box-shadow: none;
      }

      .widget-title > button:hover {
        color: @error;
        border: 1px solid @error;
      }

      .widget-label {
        margin: 10px 10px 5px 10px;
      }

      .widget-label > label {
        font-size: 1rem;
        color: @text-color;
      }

      .widget-mpris {
        color: @text-color;
        border-radius: 8px;
      }

      .widget-mpris > box > button {
        border-radius: 8px;
      }

      .widget-mpris-player {
        padding: 8px 16px;
        margin: 18px;
      }

      .widget-mpris-title {
        font-weight: 700;
        font-size: 1.25rem;
      }

      .widget-mpris-subtitle {
        font-size: 1.1rem;
      }

      .widget-buttons-grid {
        font-size: x-large;
        margin-top: 16px;
        margin-bottom: 16px;
        background: transparent;
      }

      .widget-buttons-grid > flowbox > flowboxchild > button {
        margin: 3px;
        background: @bg;
        border: 1px solid @text-color;
        color: @text-color;
      }

      .widget-buttons-grid > flowbox > flowboxchild > button:hover {
        border: 1px solid @warning;
        color: @warning;
      }

      .widget-buttons-grid > flowbox > flowboxchild > button:checked {
        border: 1px solid @warning;
        color: @warning;
      }

      .widget-menubar > box > .menu-button-bar > button {
        border: none;
        background: transparent;
      }

      .topbar-buttons > button {
        border: none;
        background: transparent;
      }

      .widget-volume {
        background: transparent;
        border-radius: 0px;
        font-size: 2rem;
        color: @warning;
      }

      scale trough {
        background: @text-color;
      }

      scale trough highlight {
        background: @warning;
      }
    '';
  };
}
