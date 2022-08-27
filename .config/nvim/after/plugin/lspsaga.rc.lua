local saga = require("lspsaga")
local keymap = vim.keymap.set

saga.init_lsp_saga()

local opts = { silent = true }
keymap("n", "<C-j>", '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
keymap("n", "K", '<Cmd>Lspsaga hover_doc<cr>', opts)
keymap("n", "gd", '<Cmd>Lspsaga lsp_finder<cr>', opts)
keymap("i", "<C-k>", '<Cmd>Lspsaga signature_help<cr>', opts)
keymap("n", "gp", '<Cmd>Lspsaga preview_definition<cr>', opts)
keymap("n", "gr", '<Cmd>Lspsaga rename<cr>', opts)
