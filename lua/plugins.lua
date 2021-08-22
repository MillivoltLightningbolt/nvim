-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- BOOTSTRAPPING (automatically install packer to any machine this config is cloned to)
local execute = vim.api.nvim_command
local fn = vim.fn

local stdpath = fn.stdpath('data') -- ~/.local/share/nvim
local install_path = stdpath .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end


-----------------------------------------------------------
-- Plugins setup
-----------------------------------------------------------
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'        -- (this) plugin manager
  use 'neovim/nvim-lspconfig'         -- configuration for language server

  use 'hrsh7th/nvim-compe'            -- autocomplete
  -- use 'ms-jpq/coq_nvim'               -- fast autocomplete

  use 'kyazdani42/nvim-web-devicons'  -- file icons in file explorer
  use 'kyazdani42/nvim-tree.lua'      -- file explorer
  use 'folke/lua-dev.nvim'            -- lua lsp setup
  use 'rafamadriz/neon'               -- color scheme
  use 'savq/melange'                  -- color scheme
  use 'tpope/vim-commentary'          -- toggle comments
  use 'tpope/vim-surround'            -- surround stuff with "'{[]}'" etc
  use 'tpope/vim-repeat'              -- make vim-surround (and some other plugins) repeatable
  use 'windwp/nvim-autopairs'         -- autopair "'{[( etc
  use 'tpope/vim-capslock'            -- software capslock
  use {                               -- treesitter
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'                 -- We recommend updating the parsers on update
  }
  use {                               -- telescope
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'hrsh7th/vim-vsnip'             -- snippets
  use 'hrsh7th/vim-vsnip-integ'       -- snippets

  use {                               -- shows options once key is pressed
    "folke/which-key.nvim",           -- run `:checkhealth which_key` to see any conflicts with which-key
    config = function()
      require("which-key").setup {
      }
    end
  }

end
)

-- NOTE: this was removed from nvim, reason: big and complex:
-- use 'kabouzeid/nvim-lspinstall'	-- easy language installation
