vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
  { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"},
  { src = "https://github.com/jvgrootveld/telescope-zoxide"},


  { src = "https://github.com/stevearc/oil.nvim"},
})


require("telescope").setup({
  pickers = {
    colorscheme = {
      enable_preview = true
    }
  },
  extensions = {
    ["ui-select"] = require("telescope.themes").get_dropdown({}),
  },
})

require("telescope").load_extension("ui-select")
require("telescope").load_extension("zoxide")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope: find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope: live grep' })
vim.keymap.set('n', '<leader>fb', builtin.builtin, { desc = 'Telescope: builtin' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope: help tags' })
vim.keymap.set('n', '<leader>?', builtin.keymaps, { desc = 'Telescope: keymaps' })

vim.keymap.set("n", "<leader>cd", require("telescope").extensions.zoxide.list, { desc = "Telescope: zoxide" })

require("oil").setup()
vim.keymap.set("n", "-", function ()
  require("oil").open_float()
end, { desc = "Open parent directory" })
