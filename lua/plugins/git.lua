vim.pack.add({
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/neogitorg/neogit" },
}, {confirm = false})

require('gitsigns').setup({})

vim.keymap.set('n', '<leader>gg', "<CMD>Neogit<CR>", { desc = 'Show Neogit UI' })
