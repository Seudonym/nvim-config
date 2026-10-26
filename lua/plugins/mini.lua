vim.pack.add({
  { src = 'https://github.com/nvim-mini/mini.ai',          version = vim.version.range('*') },
  { src = 'https://github.com/nvim-mini/mini.indentscope', version = vim.version.range('*') },
  { src = 'https://github.com/nvim-mini/mini.icons',       version = vim.version.range('*') },
  { src = 'https://github.com/nvim-mini/mini.surround',    version = vim.version.range('*') },

  { src = 'https://github.com/akinsho/bufferline.nvim',    version = vim.version.range("*") }
})

require("mini.ai").setup()
require("mini.indentscope").setup()
require("mini.surround").setup()
require("mini.icons").setup()

require("bufferline").setup()

vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', { desc = 'Bufferline: next buffer' })
vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { desc = 'Bufferline: previous buffer' })
