local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
  return
end

local keymap = vim.keymap
local on_attach = function(client, buffer)
  local opts = { noremap = true, silent = true, buffer = buffer }
  keymap.set("n", "K", '<Cmd>Lspsaga hover_doc<cr>', opts)
  keymap.set("n", "gf", '<Cmd>Lspsaga lsp_finder<cr>', opts)
  keymap.set("i", "<C-k>", '<Cmd>Lspsaga signature_help<cr>', opts)
  keymap.set("n", "gd", '<Cmd>Lspsaga peek_definition<cr>', opts)
  keymap.set("n", "gD", '<Cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  keymap.set("n", "gi", '<Cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  keymap.set("n", "rn", '<Cmd>Lspsaga rename<cr>', opts)
  keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
  keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
  keymap.set("n", "ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
  if client.name == "tsserver" then
    keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>")
    keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
    keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
  end
end

-- enables lsp config for all servers installed
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig["solargraph"].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach
  }
})

-- configure css server
lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure tailwindcss server
lspconfig["tailwindcss"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure lua server (with special settings)
lspconfig["sumneko_lua"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})
