-- automatic installation
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap =
  fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

-- Packer autocompile
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- packer options
packer.init({
  -- max_jobs = 5,
  git = {
    depth = 1,
    clone_timeout = 100,
  },
})

return require("packer").startup(function(use)
  use({ "wbthomason/packer.nvim", commit = "dcd2f380bb49ec2dfe208f186236dd366434a4d5" })

  -- Automation
  use { 'tpope/vim-commentary', commit = "e87cd90dc09c2a203e13af9704bd0ef79303d755" }
  -- use {
  --   "numToStr/Comment.nvim",
  --   commit = "5f01c1a89adafc52bf34e3bf690f80d9d726715d",
  --   config = function() require("Comment").setup() end,
  -- }
  use {
    "JoosepAlviste/nvim-ts-context-commentstring",
    commit = "32d9627123321db65a4f158b72b757bcaef1a3f4",
  }
  use {
    "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
    commit = "99f696339266c22e7313d6a85a95bd538c3fc226",
    config = function()
      require("nvim-autopairs").setup()
      require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
    end,
  }
  use {
    "windwp/nvim-ts-autotag", -- To autoclose and autorename tags
    commit = "fdefe46c6807441460f11f11a167a2baf8e4534b",
    config = function() require("nvim-ts-autotag").setup() end,
  }

  -- Bufferline/ScopeBuffer
  use { "akinsho/bufferline.nvim", tag = "v2.7.0" } -- Icon bg color linked to selected buffer color #137
  use {
    "tiagovla/scope.nvim",
    commit = "2db6d31de8e3a98d2b41c0f0d1f5dc299ee76875",
    config = function() require("scope").setup() end,
  }

  -- ColorSchemes
  use { 'olivercederborg/poimandres.nvim' }
  use { 'folke/tokyonight.nvim' }
  use { "NvChad/nvim-colorizer.lua", commit = "760e27df4dd966607e8fb7fd8b6b93e3c7d2e193" }

  -- cmp-plugins
  -- use { 'hrsh7th/nvim-cmp', branch = "border-window" } -- The completion plugin
  use { "hrsh7th/nvim-cmp", commit = "93f385c17611039f3cc35e1399f1c0a8cf82f1fb" } -- The completion plugin
  use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" } -- buffer completions
  use { "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" } -- path completions
  use { "hrsh7th/cmp-cmdline", commit = "23c51b2a3c00f6abc4e922dbd7c3b9aca6992063" } -- cmdline completions
  use { "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp", commit = "59224771f91b86d1de12570b4070fe4ad7cd1eeb" } -- lsp completions

  -- DAP
  use { "mfussenegger/nvim-dap", commit = "8f396b7836b9bbda9edd9f655f12ca377ae97676" }
  use { "rcarriga/nvim-dap-ui", commit = "54365d2eb4cb9cfab0371306c6a76c913c5a67e3" }
  use { "jay-babu/mason-nvim-dap.nvim", commit = "40c9a53c208a2d7e008b27d994ac001fadc7a5a2" }

  -- File-Explorer
  use { "nvim-neo-tree/neo-tree.nvim", commit = "7c6903b05b13c5d4c3882c896a59e6101cb51ea7" }
  use { "MunifTanjim/nui.nvim", commit = "2a6533fb798efad7dd783311315bab8dc5eb381b" }

  -- Snippets
  -- use {
  --   'SirVer/ultisnips',
  --   commit = "e99fdf15cd55a4a8e0cb0a80a6810c1867a5c401",
  --   requires = {
  --     { 'honza/vim-snippets', commit = "6173350127d56dcc5664f50320b3f522951f56e9" },
  --     { 'quangnguyen30192/cmp-nvim-ultisnips', commit = "21f02b62deb409ce69928a23406076bd0043ddbc" },
  --   },
  -- }
  use { "L3MON4D3/LuaSnip", commit = "bc9ba285be806cd8f1db9e7dbd50e33a300e11c2" } --snippet engine
  use { "rafamadriz/friendly-snippets", commit = "b4f857a1d94d05e747951b1e8cb1a6c567396898" } -- a bunch of snippets to use

  -- Intellisense
  -- use {'tzachar/cmp-tabnine', commit = "851fbcc8ee54bdb93f9482e13b5fc31b50012422", run = 'powershell ./install.ps1'}
  use { "tzachar/cmp-tabnine", commit = "851fbcc8ee54bdb93f9482e13b5fc31b50012422", run = "./install.sh" }
  -- use { "github/copilot.vim", commit = "5a411d19ce7334ab10ba12516743fc25dad363fa" }
  use { "Exafunction/codeium.vim", commit = "cf3bbfa52658fa4380ea2bb764493356f04768c3" }

  -- LSP
  use { "neovim/nvim-lspconfig", commit = "9f49f35cf04edcf11fc23d849467d51f462be141" } -- enable LSP
  use { "jose-elias-alvarez/null-ls.nvim", commit = "a67897283fdb0051ad5c72e840e1845e195b979b" } -- for formatters and linters
  use { "jay-babu/mason-null-ls.nvim", commit = "c4b4a6fe3cb8d8590b831c22b3475166dc9a894e" } -- autoconfigured formatters
  use { "b0o/SchemaStore.nvim", commit = "384af0bc8c572a4153348236a90f7e8313cad330" } -- jsonls schema completions
  use { "RRethy/vim-illuminate", commit = "49062ab1dd8fec91833a69f0a1344223dd59d643" }
  use { "glepnir/lspsaga.nvim", commit = "c5c11457c3b1c29075dd16deb2bb92340600aace" }
  use {
    "williamboman/mason.nvim",
    commit = "22129c714fcb0acd2cebba77980e6461a2c69d6b",
    config = function() require("mason").setup() end,
    requires = {
      "williamboman/mason-lspconfig.nvim",
      commit = "4674ed145fd0e72c9bfdb32b647f968b221bf2f2",
      config = function() require("mason-lspconfig").setup() end,
    },
  }

  -- Motions
  use { "machakann/vim-columnmove", commit = "21a43d809a03ff9bf9946d983d17b3a316bf7a64" }
  use { "tpope/vim-repeat", commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a" }
  use { "justinmk/vim-sneak", commit = "93395f5b56eb203e4c8346766f258ac94ea81702" }
  use {
    "phaazon/hop.nvim",
    commit = "90db1b2c61b820e230599a04fedcd2679e64bd07",
    config = function() require("hop").setup() end,
  }

  -- Status-Line
  use { "nvim-lualine/lualine.nvim", commit = "bfa0d99ba6f98d077dd91779841f1c88b7b5c165" }
  use { "nvim-tree/nvim-web-devicons", commit = "189ad3790d57c548896a78522fd8b0d0fc11be31" }
  use { "DaikyXendo/nvim-material-icon", commit = "602088c2682e61cbebd7191de7dc88bfa90c6890" }

  -- Text-Objects
  -- use { 'wellle/targets.vim', commit="8d6ff2984cdfaebe5b7a6eee8f226a6dd1226f2d", }
  -- use { "godlygeek/tabular", commit = "339091ac4dd1f17e225fe7d57b48aff55f99b23a" }
  -- use { 'nvim-treesitter/playground', commit = "1290fdf6f2f0189eb3b4ce8073d3fda6a3658376" }
  use { "paraduxos/vim-indent-object", branch = "new_branch", commit = "2408bf0d2d54f70e6cd9cfcb558bd43283bf5003" }
  use { "echasnovski/mini.nvim", commit = "c65901227e5a3671dbcb054745566a1c78f9f0c8" }
  use { "kana/vim-textobj-user", commit = "41a675ddbeefd6a93664a4dc52f302fe3086a933" }
  use { "saihoooooooo/vim-textobj-space", commit = "d4dc141aad3ad973a0509956ce753dfd0fc87114" }
  use { "nvim-treesitter/nvim-treesitter", commit = "252c1011c4bae91d25a8c54be4ed1a7b341c088c" }
  use { "nvim-treesitter/nvim-treesitter-textobjects", commit = "4b30081d2736e09f90c890a8a7adfe4df36f5b36" }
  use { "RRethy/nvim-treesitter-textsubjects", commit = "bc047b20768845fd54340eb76272b2cf2f6fa3f3" }
  use { "coderifous/textobj-word-column.vim", commit = "cb40e1459817a7fa23741ff6df05e4481bde5a33" }
  use { "mg979/vim-visual-multi", commit = "724bd53adfbaf32e129b001658b45d4c5c29ca1a" }
  use { "svermeulen/vim-easyclip", commit = "f1a3b95463402b30dd1e22dae7d0b6ea858db2df" }
  use {
    "chrisgrieser/nvim-various-textobjs",
    commit = "7915b4567dbf3542652e3ada6f9660bfa81d94f7",
    config = function() require("various-textobjs").setup { useDefaultKeymaps = false, lookForwardLines = 30 } end,
  }
  -- Surround block of codes
  -- use { 'tpope/vim-surround', commit = "3d188ed2113431cf8dac77be61b842acb64433d9" }
  -- use {
  --   "kylechui/nvim-surround",
  --   commit = "6cc6b54d3728a17e34bb5c9b9db05c7e5690813d",
  --   config = function()
  --     require("nvim-surround").setup({
  --       keymaps = {
  --         insert          = '<C-g>z',
  --         insert_line     = '<C-g>Z',
  --         normal          = 'yz',
  --         normal_cur      = 'YZ',
  --         normal_line     = 'yzz',
  --         normal_cur_line = 'YZZ',
  --         visual          = 'z',
  --         visual_line     = 'Z',
  --         delete          = 'dz',
  --         change          = 'cz',
  --       }
  --     }
  --   end
  -- }

  -- TUI
  use { "akinsho/toggleterm.nvim", commit = "3ba683827c623affb4d9aa518e97b34db2623093" }
  use { "mrjones2014/legendary.nvim", commit = "3008ed68c8f309ced07587684c8af53884791d35" }
  use { "nvim-telescope/telescope-file-browser.nvim", commit = "304508fb7bea78e3c0eeddd88c4837501e403ae8" }
  use { "AckslD/nvim-neoclip.lua", commit = "5b9286a40ea2020352280caeb713515badb03d99" }
  use { "nvim-telescope/telescope.nvim",
    commit = "dce1156ca103b8222e4abbfc63f9c6887abf5ec6",
    requires = {
      { "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" },
      { "nvim-telescope/telescope-fzf-native.nvim", commit = "ae9d95da9ff5669eb8e35f758fbf385b3e2fb7cf", run = "make" }
    }
  }

  -- UI
  -- use { "metakirby5/codi.vim", commit = "6537ba677a0c7c6c796b195f29077b57fad33716" }
  use { "stevearc/aerial.nvim", commit = "086e1904e51fc559673598afbc59842db7981501" }
  use { "goolord/alpha-nvim", commit = "21a0f2520ad3a7c32c0822f943368dc063a569fb" }
  use { "lewis6991/impatient.nvim", commit = "d3dd30ff0b811756e735eb9020609fa315bfbbcc" }
  use { "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" }
  use { "ahmedkhalf/project.nvim", commit = "685bc8e3890d2feb07ccf919522c97f7d33b94e4" }
  use { "folke/which-key.nvim", commit = "684e96c5e8477f1ee9b3f2e9a12d802fd12c5531" }
  use { "mrjones2014/smart-splits.nvim", commit = "fdd158ce7554dc830fb86e0fe952cd9476cdf726" }
  -- use { "HUAHUAI23/telescope-session.nvim", config = function() require("telescope").load_extension("xray23") end }
  -- use { "nvim-telescope/telescope-ui-select.nvim", config = function() require("telescope").load_extension("ui-select") end }
  use { "stevearc/dressing.nvim",
    commit = "db716a0f1279f79a886c0e0b6ab3c3d5ffdb42fe",
    config = function() require("dressing").setup {
        input = { win_options = { winblend = 0 } },
        select = { telescope = require('telescope.themes').get_dropdown { initial_mode = 'normal' }
        }
      }
    end
  }
  use { "Shatur/neovim-session-manager",
    commit = "e7a2cbf56b5fd3a223f2774b535499fc62eca6ef",
    config = function() require("session_manager").setup { autoload_mode = "disabled" } end
  }
  use {
    "lewis6991/gitsigns.nvim",
    commit = "d076301a634198e0ae3efee3b298fc63c055a871",
    config = function()
      require("gitsigns").setup {
        signs = {
          add          = { text = "│" },
          change       = { text = "│" },
          delete       = { text = "│" },
          topdelete    = { text = "契" },
          changedelete = { text = "~" },
          untracked    = { text = '┆' },
        },
      }
    end,
  }
  -- use { "rcarriga/nvim-notify",
  --   commit = "bdd647f61a05c9b8a57c83b78341a0690e9c29d7",
  --   config = function() require("notify").setup({ stages = "fade" })
  --     require("telescope").load_extension("notify")
  --     vim.notify = require("notify")
  --   end
  -- }
  -- use({ "folke/noice.nvim",
  --   commit = "a83b5fb9e24ecb220fa1255a9b7957dcd7b22783",
  --   config = function()
  --     require("noice").setup({
  --       messages = { view_search = false },
  --       presets = {
  --         bottom_search = true, -- use a classic bottom cmdline for search
  --         command_palette = true, -- position the cmdline and popupmenu together
  --         lsp_doc_border = true, -- add a border to hover docs and signature help
  --       },
  --     })
  --   end
  -- })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
