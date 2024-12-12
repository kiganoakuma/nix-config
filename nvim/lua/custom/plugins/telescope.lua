-- telecope
return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { "nvim-telescope/telescope-file-browser.nvim" },
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      --variables
      local telescope = require("telescope.builtin")

      --config   
      require('telescope').setup{
        pickers = {
          find_files = {
            theme = "ivy"
          },
          git_files = {
            theme = "ivy"
          },
        },
        extensions = {
          fzf = {}
        },
      }

      require('telescope').load_extension('fzf')
      -- keymaps
      local keymap = vim.keymap
      keymap.set('n', '<LEADER>ff', telescope.find_files)
      keymap.set('n', '<LEADER>fg', telescope.git_files)
      keymap.set('n', '<LEADER>gr', telescope.live_grep)
      keymap.set('n', '<LEADER>en', function()
        telescope.find_files {
          cwd = vim.fn.stdpath("config")
        }
      end)
      keymap.set('n', '<LEADER>ep', function()
        telescope.find_files {
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
        }
      end)
    end,
  },
}
