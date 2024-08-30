{ config, pkgs, ... }: {
  programs = {
    oh-my-posh = {
      enable = true;
      enableZshIntegration = true;
      # useTheme = "the-unnamed";
      settings = {
        # {
        #   "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
        #   "console_title_template": " {{ .Folder }} :: {{if .Root}}Admin{{end}}",
        #   "palette": {
        #     "main-bg": "#24283b",
        #     "terminal-red": "#f7768e",
        #     "pistachio-green": "#9ece6a",
        #     "terminal-green": "#73daca",
        #     "terminal-yellow": "#e0af68",
        #     "terminal-blue": "#7aa2f7",
        #     "celeste-blue": "#b4f9f8",
        #     "light-sky-blue": "#7dcfff",
        #     "terminal-white": "#c0caf5",
        #     "white-blue": "#a9b1d6",
        #     "blue-bell": "#9aa5ce",
        #     "pastal-grey": "#cfc9c2",
        #     "terminal-magenta": "#bb9af7",
        #     "blue-black": "#565f89",
        #     "terminal-black": "#414868",
        #     "t-background": "p:main-bg"
        #   },
        #   "blocks": [
        #     {
        #       "alignment": "left",
        #       "segments": [
        #         {
        #           "type": "text",
        #           "style": "plain",
        #           "background": "transparent",
        #           "foreground": "p:terminal-blue",
        #           "template": "\u279c "
        #         },
        #         {
        #           "type": "path",
        #           "style": "plain",
        #           "foreground": "p:terminal-magenta",
        #           "properties": {
        #             "style": "folder"
        #           },
        #           "template": "<b>{{ .Path }}</b> <p:light-sky-blue>\u26a1</>"
        #         },
        #         {
        #           "type": "git",
        #           "style": "plain",
        #           "foreground": "p:light-sky-blue",
        #           "foreground_templates": [
        #             "{{ if or (.Working.Changed) (.Staging.Changed) }}p:terminal-red{{ end }}",
        #             "{{ if and (gt .Ahead 0) (gt .Behind 0)}}p:light-sky-blue {{ end }}",
        #             "{{ if gt .Ahead 0 }}p:terminal-blue{{ end }}",
        #             "{{ if gt .Behind 0 }}p:celeste-blue{{ end }}"
        #           ],
        #           "template": "({{ .HEAD}})",
        #           "properties": {
        #             "fetch_status": true,
        #             "branch_icon": "\ue725 "
        #           }
        #         },
        #         {
        #           "type": "status",
        #           "style": "plain",
        #           "foreground": "p:terminal-red",
        #           "template": " \uf00d"
        #         }
        #       ],
        #       "type": "prompt"
        #     },
        #     {
        #       "alignment": "right",
        #       "overflow": "hide",
        #       "segments": [
        #         {
        #           "type": "node",
        #           "style": "plain",
        #           "foreground": "p:pistachio-green",
        #           "template": "\ue718 {{ .Full }} "
        #         },
        #         {
        #           "type": "php",
        #           "style": "plain",
        #           "foreground": "p:terminal-blue",
        #           "template": "\ue73d {{ .Full }} "
        #         },
        #         {
        #           "type": "python",
        #           "style": "plain",
        #           "foreground": "p:terminal-yellow",
        #           "template": "\uE235 {{ .Full }}"
        #         },
        #         {
        #           "type": "julia",
        #           "style": "plain",
        #           "foreground": "p:terminal-magenta",
        #           "template": "\uE624 {{ .Full }}"
        #         },
        #         {
        #           "type": "ruby",
        #           "style": "plain",
        #           "foreground": "p:terminal-red",
        #           "template": "\uE791 {{ .Full}}"
        #         },
        #         {
        #           "type": "go",
        #           "style": "plain",
        #           "foreground": "p:light-sky-blue",
        #           "template": "\uFCD1 {{ .Full}}"
        #         },
        #         {
        #           "type": "command",
        #           "style": "plain",
        #           "foreground": "p:white-blue",
        #           "properties": {
        #             "command": "git log --pretty=format:%cr -1 || date +%H:%M:%S",
        #             "shell": "bash"
        #           }
        #         }
        #       ],
        #       "type": "prompt"
        #     },
        #     {
        #       "alignment": "left",
        #       "newline": true,
        #       "segments": [
        #         {
        #           "foreground": "p:pistachio-green",
        #           "style": "plain",
        #           "template": "\u25b6",
        #           "type": "text"
        #         }
        #       ],
        #       "type": "prompt"
        #     }
        #   ],
        #   "secondary_prompt": {
        #     "background": "transparent",
        #     "foreground": "p:terminal-blue",
        #     "template": "\u279c "
        #   },
        #   "transient_prompt": {
        #     "background": "p:t-background",
        #     "foreground": "p:terminal-blue",
        #     "template": "\u279c "
        #   },
        #   "final_space": true,
        #   "version": 2,
        #   "terminal_background": "p:t-background"
        # }
        version = 2;
        terminal_background = "p:main-bg";
      };
    };
  };
}
