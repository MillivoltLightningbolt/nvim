-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- BOOTSTRAPPING (automatically install packer to any machine this config is cloned to)
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end



-- SETUP
return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'	-- plugin manager
  use 'neovim/nvim-lspconfig'	-- configuration for language server
  use 'hrsh7th/nvim-compe'	-- autocomplete
  use 'kyazdani42/nvim-web-devicons'	-- file icons in file explorer
  use 'kyazdani42/nvim-tree.lua'	-- file explorer
end)
