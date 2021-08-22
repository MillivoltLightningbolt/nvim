-----------------------------------------------------------
-- Setting up language-servers
-----------------------------------------------------------

require('nvim-lspconfig/lsp_lua')       -- lua
require('nvim-lspconfig/lsp_python')    -- python

-- lsp.vimls.setup(coq.lsp_ensure_capabilities())     -- vimscript language-server
-- lsp.bashls.setup(coq.lsp_ensure_capabilities())    -- bash language-server

-- -- for lua development (source/settings: https://github.com/folke/lua-dev.nvim)
-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)




-- `Lua.workspace.maxPreload`: set to `2000` ;  -- TODO: temporarily here for bughunt
