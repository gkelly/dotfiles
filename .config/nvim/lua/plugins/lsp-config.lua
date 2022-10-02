local lspconfig = require("lspconfig")

local on_attach = function(_, bufnr)
  local opts = {noremap = true, silent = true}

  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gre", ":lua vim.lsp.buf.references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gtd", ":lua vim.lsp.buf.type_definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>", opts)

  vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opts)
end

-- go
lspconfig.gopls.setup {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true
      },
      staticcheck = false
    }
  },
  filetypes = {"go", "gomod"},
  on_attach = on_attach,
}

-- rust
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
}

vim.api.nvim_exec(
  [[
augroup FormatSyncAutogroup
  autocmd!
  autocmd BufWritePre *.go,*.py,*.rs lua vim.lsp.buf.formatting_sync(nil, 2000)
augroup END
]], true)
