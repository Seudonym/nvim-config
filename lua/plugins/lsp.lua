vim.pack.add({
  { src = "https://github.com/saghen/blink.cmp" },
  { src = "https://github.com/saghen/blink.lib" },
  { src = 'https://github.com/saghen/blink.pairs',          version = vim.version.range('*') },
  { src = "https://github.com/rafamadriz/friendly-snippets" },

  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/github/copilot.vim" },

  { src = "https://github.com/folke/lazydev.nvim" },
})

local cmp = require('blink.cmp')
cmp.build():pwait()
cmp.setup({
  keymap = {
    preset = 'default',
    ['<Tab>'] = { 'select_next', 'fallback' },
    ['<S-Tab>'] = { 'select_prev', 'fallback' },
    ['<CR>'] = { 'accept', 'fallback' },
    ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
    ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
  },
  completion = {
    list = {
      selection = {
        preselect = false,
        auto_insert = false,
      }
    }
  },
  sources = {
    default = { "lazydev", "lsp", "path", "snippets", "buffer" },
    providers = {
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
      },
    },
  }
})

if vim.g.neovide then
  vim.api.nvim_create_autocmd('User', {
    pattern = 'BlinkCmpMenuOpen',
    group = vim.api.nvim_create_augroup('NeovideBlinkCmdline', { clear = true }),
    callback = function()
      if vim.fn.mode() ~= 'c' then return end
      -- Blink's default zindex (1001) can obscure Neovide's command-line layer.
      local menu = require('blink.cmp.completion.windows.menu')
      if menu.win:is_open() then menu.win:set_win_config({ zindex = 100 }) end
    end,
  })
end


require('blink.pairs').download():pwait(60000)
require('blink.pairs').setup({})

vim.lsp.enable({
  'lua_ls',
  'pyright',
  'clangd',
  'tinymist'
})

vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, { desc = 'Go to definition' })
vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, { desc = 'Go to declaration' })
vim.keymap.set('n', '<leader>fm', function() vim.lsp.buf.format() end, { desc = 'Format buffer' })
vim.keymap.set('i', '<M-l>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true
