local status, mason = pcall(require, "mason")
if not status then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if not status2 then return end

local null_ls_status, null_ls = pcall(require, "mason-null-ls")
if not null_ls_status then
 return 
end

mason.setup({})
lspconfig.setup({
  ensure_installed = {
    "tsserver",
    "html",
    "jsonls",
    "jdtls",
    "solargraph",
    "ocamllsp",
    "clangd",
    "ember",
    "eslint",
    "emmet_ls",
    "pyright",
    "gopls",
    "tailwindcss",
    "sumneko_lua",
    "yamlls"

  }
})

null_ls.setup({
  ensure_installed = {
    "prettier",
    "rubocop",
    "stylua",
    "eslint_d",
    "erb_lint",
    "haml_lint",
    "sqlfluff",
    "cpplint",
    "hadolint"
  }
})
