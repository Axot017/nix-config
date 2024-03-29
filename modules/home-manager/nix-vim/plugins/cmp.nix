{ pkgs, config, inputs, ... }: {
  programs.nixvim.plugins = {
    cmp-buffer = { enable = true; };
    cmp = {
      enable = true;
      cmdline = {
        ":" = { sources = [{ name = "cmdline"; }]; };
        "/" = { sources = [{ name = "buffer"; }]; };
      };
      settings = {
        sources =
          [ { name = "nvim_lsp"; } { name = "path"; } { name = "luasnip"; } ];
        snippet.expand = ''
          function(args)
            require('luasnip').lsp_expand(args.body)
          end
        '';
        mapping = {
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = ''
            cmp.mapping(function(fallback)
                        local luasnip = require("luasnip")
                        local check_backspace = function()
                          local col = vim.fn.col(".") - 1
                          return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
                        end

                        if cmp.visible() then
                          cmp.select_next_item()
                        elseif luasnip.expandable() then
                          luasnip.expand()
                        elseif luasnip.expand_or_jumpable() then
                          luasnip.expand_or_jump()
                        elseif check_backspace() then
                          fallback()
                        else
                          fallback()
                        end
                      end, {
                        "i",
                        "s",
                        "c",
                      })'';
          "<S-Tab>" = ''
            cmp.mapping(function(fallback)
                        if cmp.visible() then
                          cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                          luasnip.jump(-1)
                        else
                          fallback()
                        end
                      end, {
                        "i",
                        "s",
                        "c",
                      })'';
        };
        formatting = {
          fields = [ "kind" "abbr" "menu" ];
          format = ''
            function(entry, vim_item)
              local kind_icons = {
                Text = "󰉿",
                Method = "󰆧",
                Function = "󰊕",
                Constructor = "",
                Field = " ",
                Variable = "󰀫",
                Class = "󰠱",
                Interface = "",
                Module = "",
                Property = "󰜢",
                Unit = "󰑭",
                Value = "󰎠",
                Enum = "",
                Keyword = "󰌋",
                Snippet = "",
                Color = "󰏘",
                File = "󰈙",
                Reference = "",
                Folder = "󰉋",
                EnumMember = "",
                Constant = "󰏿",
                Struct = "",
                Event = "",
                Operator = "󰆕",
                TypeParameter = "",
                Misc = "", 
              }
              vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
              vim_item.menu = ({
                nvim_lsp = "[LSP]",
                nvim_lua = "[NVIM_LUA]",
                luasnip = "[Snippet]",
                buffer = "[File]",
                path = "[Path]",
              })[entry.source.name]
              return vim_item
            end
          '';
        };
      };
    };
  };
}
