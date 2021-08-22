-- local system_name
-- if vim.fn.has("mac") == 1 then
--   system_name = "macOS"
-- elseif vim.fn.has("unix") == 1 then
--   system_name = "Linux"
-- elseif vim.fn.has('win32') == 1 then
--   system_name = "Windows"
-- else
--   print("Unsupported system for sumneko")
-- end

local lsp = require("lspconfig")
-- local coq = require "coq" -- or coq_lsp

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
-- local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'

-- local sumneko_root_path = "/home/milton/.config/nvim/language-servers/lua-ls"   -- NOTE: ~ and $HOME are not expanded, see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#sumneko_lua
-- local sumneko_binary = sumneko_root_path .. "bin/" .. system_name .. "/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")


local luadev = require("lua-dev").setup({
  -- add any options here, or leave empty to use the default settings
  library = {
    vimruntime = true,  -- runtime path
    types = true,       -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others

    -- you can also specify the list of plugins to make available as a workspace library
    plugins = true,     -- installed opt or start plugins in packpath
    -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
  },
  lspconfig = {
    cmd = {"lua-language-server"};
    -- cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    -- available settings: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#sumneko_lua
    -- better explanation: https://github.com/josa42/coc-lua
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          path = runtime_path,
          -- path = '/usr/bin/lua',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),

          -- bugfix (3 annoying popups when opening lua file) TODO: find better solution?
          maxPreload = 2500,        -- Max nr of preloaded files
          preloadFileSize = 500,    -- Skip files larger than this value (KB) when preloading.
          checkThirdParty = false,  -- Automatic detection and adaptation of third-party libraries

        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },

        -- TODO: testing hints
        hint = {
          enable = true,
        },

      },
    },
  },
})

lsp.sumneko_lua.setup(luadev)
-- lsp.sumneko_lua.setup(coq.lsp_ensure_capabilities(luadev)) -- or with coq_lsp

