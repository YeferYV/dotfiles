-- Packer Install
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
-- nvim +PackerSync

-- colorschemes
-- vim.cmd [[ colorscheme lunar2-generated ]]
-- vim.cmd [[ colorscheme lunar2 ]]
vim.cmd [[ colorscheme leet]]

-- Lua
require "user.autocommands"
require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.bufferline"
require "user.colorizer"
require "user.cmp"
require "user.cmp-tabnine"
require "user.dap"
require "user.illuminate"
require "user.impatient"
require "user.indentline"
require "user.lsp"
require "user.lualine"
require "user.nvim-tree"
require "user.project"
require "user.telescope"
require "user.toggleterm"
require "user.treesitter"
require "user.whichkey"
