local use = require('packer').use

require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'

  use 'mattn/vim-goimports'

  use 'RRethy/nvim-base16'

  use {
      'nvim-treesitter/nvim-treesitter',
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  use 'preservim/nerdtree'

	use {
    "nvim-telescope/telescope.nvim",
    requires = {{"nvim-lua/plenary.nvim"}}
  }
  use {"nvim-telescope/telescope-file-browser.nvim"}
  use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
end)
