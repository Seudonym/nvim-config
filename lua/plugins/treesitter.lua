vim.pack.add({
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    version = "main",
  },
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("TreesitterHighlight", { clear = true }),
  pattern = {
    "javascript", "javascriptreact",
    "typescript", "typescriptreact",
    "html", "css", "json",
    "lua", "python", "c", "cpp",
    "bash", "markdown",
  },
  callback = function(event)
    -- Keep regular syntax highlighting until this language's parser is installed.
    local language = vim.treesitter.language.get_lang(vim.bo[event.buf].filetype)
    if not language then
      return
    end
    local ok, loaded = pcall(vim.treesitter.language.add, language)
    if not ok or not loaded then
      return
    end
    vim.treesitter.start(event.buf)
  end,
})
