require'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim', 'love' },  -- Recognize 'vim' and 'love' as global
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,  -- Ensure Lua runtime is included
          [vim.fn.expand('/Applications/love.app/Contents/MacOS/love')] = true,    -- Replace with the path to your LÖVE installation
        },
      },
      telemetry = {
        enable = false,  -- Optional: Disable telemetry
      },
    },
  },
}

