local sumneko_root_path = "/home/milton/.config/nvim/language-servers/lua-ls/main.lua"
local sumneko_binary = "/home/milton/.config/nvim/language-servers/lua-ls/bin/Linux/lua-language-server"

local luadev = require("lua-dev").setup({
  -- add any options here, or leave empty to use the default settings
  library = {
    vimruntime = true, -- runtime path
    types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
    plugins = true, -- installed opt or start plugins in packpath
    -- you can also specify the list of plugins to make available as a workspace library
    -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
  },
  lspconfig = {
    -- cmd = {"lua-language-server"}
    cmd = {sumneko_binary, "-E", sumneko_root_path }; --.. "/main.lua"};
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          -- path = runtime_path,
          path = '/usr/bin/lua',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  },
})

local lspconfig = require('lspconfig')
lspconfig.sumneko_lua.setup(luadev)




---- ##################################################
---- setting up language-servers
--local lsp = require 'lspconfig'
--lsp.pyright.setup{}   -- python language-server
--lsp.vimls.setup{}     -- vimscript language-server
--lsp.bashls.setup{}    -- bash language-server

---- -- for lua development (source/settings: https://github.com/folke/lua-dev.nvim)
---- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
