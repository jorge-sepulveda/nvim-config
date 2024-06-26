-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==
  -- customize alpha options
  { "goolord/alpha-nvim",
    opts = function(_, opts)

    -- setting the color  highlights
    -- vim.api.nvim_set_hl(0, "NeovimDashboardLogo1", { fg = "#DA4939" })
    -- vim.api.nvim_set_hl(0, "NeovimDashboardLogo2", { fg = "#FF875F" })
    -- vim.api.nvim_set_hl(0, "NeovimDashboardLogo3", { fg = "#FFC66D" })
    -- vim.api.nvim_set_hl(0, "NeovimDashboardLogo4", { fg = "#00FF03" })
    -- vim.api.nvim_set_hl(0, "NeovimDashboardLogo5", { fg = "#00AFFF" })
    -- vim.api.nvim_set_hl(0, "NeovimDashboardLogo6", { fg = "#8800FF" })

    vim.api.nvim_set_hl(0, "AmericaRed", { fg= "#FF0000"})
    vim.api.nvim_set_hl(0, "AmericaBlue", { fg= "#0000FF" })
    vim.api.nvim_set_hl(0, "AmericaWhite", { fg= "#FFFFFF" })


      -- customize the dashboard header
      opts.section.header.type = "group"
      opts.section.header.val = {
        { type = "text", val = " █████╗ ███████╗████████╗██████╗  ██████╗ ", opts = { hl = "AmericaRed", shrink_margin = false, position = "center" } },
        { type = "text", val = "██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██╔═══██╗", opts = { hl = "AmericaRed", shrink_margin = false, position = "center" } },
        { type = "text", val = "███████║███████╗   ██║   ██████╔╝██║   ██║", opts = { hl = "AmericaWhite", shrink_margin = false, position = "center" } },
        { type = "text", val = "██╔══██║╚════██║   ██║   ██╔══██╗██║   ██║", opts = { hl = "AmericaWhite", shrink_margin = false, position = "center" } },
        { type = "text", val = "██║  ██║███████║   ██║   ██║  ██║╚██████╔╝", opts = { hl = "AmericaBlue", shrink_margin = false, position = "center" } },
        { type = "text", val = "╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ", opts = { hl = "AmericaBlue", shrink_margin = false, position = "center" } },
        { type = "text", val = "    ███╗   ██╗██╗   ██╗██╗███╗   ███╗     ", opts = { hl = "AmericaRed", shrink_margin = false, position = "center" } },
        { type = "text", val = "    ████╗  ██║██║   ██║██║████╗ ████║     ", opts = { hl = "AmericaRed", shrink_margin = false, position = "center" } },
        { type = "text", val = "    ██╔██╗ ██║██║   ██║██║██╔████╔██║     ", opts = { hl = "AmericaWhite", shrink_margin = false, position = "center" } },
        { type = "text", val = "    ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║     ", opts = { hl = "AmericaWhite", shrink_margin = false, position = "center" } },
        { type = "text", val = "    ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║     ", opts = { hl = "AmericaBlue", shrink_margin = false, position = "center" } },
        { type = "text", val = "    ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝     ", opts = { hl = "AmericaBlue", shrink_margin = false, position = "center" } },
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
}
