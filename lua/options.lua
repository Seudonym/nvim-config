local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.termguicolors = true

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

opt.wrap = false
opt.scrolloff = 8
opt.splitbelow = true
opt.splitright = true
opt.undofile = true
opt.updatetime = 250
opt.winborder = 'single'

opt.guifont = "Iosevka Nerd Font:h12" 

vim.keymap.set('n', '<Esc>', ":noh<CR>", { desc = 'No highlights' })
