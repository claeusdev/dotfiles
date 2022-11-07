local status, null_ls = pcall(require, "null_ls")
if not status then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_command [[augroup Format]]
      vim.api.nvim_command [[autocmd! * <buffer>]]
      vim.api.nvim_command [[autocmd * BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
      vim.api.nvim_command [[augroup END]]
    end
    if client.supports_method("textDocument/formatting") then
     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr}) 
     vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function ()
          vim.lsp.buf.format({
            filter = function (current_client)
              return current_client.name == "null-ls"
            end,
            bufnr = bufnr
          })
        end
      })
    end
  end,
  sources = {
    formatting.prettier,
    formatting.stylua,
    formatting.rubocop,
    formatting.erb_lint,
    formatting.jq,
    formatting.sqlfluff,
    diagnostics.eslint_d,
      }
})
