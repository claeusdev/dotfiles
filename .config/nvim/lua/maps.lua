local keymap = vim.keymap

vim.g.mapleader = " "
-- Do not yank with x
keymap.set("n", "x", "'_x")

-- clear search text
keymap.set("n", "cs", ":nohl<CR>")

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", "vb'_d")
--
-- Select All
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Tabs
keymap.set("n", "te", ":tabedit<Return>", { silent = true }) -- new tab with insert mode
keymap.set("n", "tx", ":tabclose<CR>", { silent = true }) -- close current tab
keymap.set("n", "tn", ":tabn<CR>", { silent = true }) -- close current tab
keymap.set("n", "tp", ":tabp<CR>", { silent = true }) -- close current tab

-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w", { silent = true }) -- horizontal split
keymap.set("n", "sv", ":vsplit<Return><C-w>w", { silent = true }) -- vertical split

-- make split windows equal width
keymap.set("n", "se", "<C-w>=", { silent = true }) -- horizontal split

-- Close current split window
keymap.set("n", "se", ":close<CR>", { silent = true }) -- horizontal split

-- Move window
keymap.set("n", "<Space>", "<C-w>w")
keymap.set("", "s<left>", "<C-w>h")
keymap.set("", "s<up>", "<C-w>k")
keymap.set("", "s<down>", "<C-w>j")
keymap.set("", "s<right>", "<C-w>l")
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- MAximizer
keymap.set("n", "sm", ":MaximizerToggle<CR>")

-- tree-view
keymap.set("n", "tf", ":NvimTreeToggle<CR>")
