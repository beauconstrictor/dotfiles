-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- settings

local opt = vim.opt

opt.clipboard = "unnamedplus"

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.number = true
opt.relativenumber = true
opt.laststatus = 0
opt.mouse = ""

vim.g.mapleader = " "
local map = vim.keymap.set

opt.termguicolors = true

opt.modeline = true
opt.modelines = 5

-- plugins

require("lazy").setup({
  { "zah/nim.vim" },
  { "morhetz/gruvbox" },
  { "wincent/terminus" },
  { "vim-utils/vim-man" },
  { "stevearc/oil.nvim" },
  { "folke/zen-mode.nvim" },
  { "maxbane/vim-asm_ca65" },
  { "karb94/neoscroll.nvim" },
  { "neovim/nvim-lspconfig" },
  { "nvim-lua/plenary.nvim" },
  { "norcalli/nvim-colorizer.lua" },
  { "nvim-telescope/telescope.nvim" },
})

require("telescope").setup({
  defaults = {
    layout_strategy = "horizontal",
    file_ignore_patterns = { "__pycache__", "%.git/" },
  },
})

require("zen-mode").setup({
  window = {
    width = 70,
  },
})

require('neoscroll').setup({
  mappings = {
    '<C-u>', '<C-d>',
    '<C-f>', '<C-b>',
    'zt', 'zz', 'zb',
  },
  hide_cursor = true,
  respect_scrolloff = false,
  cursor_scrolls_alone = true,
  duration_multiplier = 0.5,
  easing = 'cubic',
  pre_hook = nil,
  post_hook = nil,
  performance_mode = false,
  ignored_events = {
      'WinScrolled', 'CursorMoved'
  },
})

require('colorizer').setup()

require('oil').setup({
  columns = {
    "permissions",
    "size",
    "mtime"
  },
  skip_confirm_for_simple_edits = true,
  view_options = {
    show_hidden = true
  }
})

-- lsp

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.lsp.enable("basedpyright")
vim.lsp.enable("ruff")
vim.lsp.enable("clangd")

-- keybinds

map("n", ":", "q:i")

map("n", "<leader>z", "<cmd>bprev<CR>")
map("n", "<leader>x", "<cmd>bdelete<CR>")
map("n", "<leader>c", "<cmd>bnext<CR>")

map("n", "<leader>a", "<cmd>ZenMode<CR>") 
map("n", "-", "<cmd>Oil .<CR>") 

map("n", "<leader>o", "<cmd>Telescope find_files<CR>") 

map("n", "<leader>h", "<cmd>noh<CR>")
map("n", "<leader>w", "<cmd>w<CR>")
map("n", "<leader>f", "<cmd>Telescope current_buffer_fuzzy_find<CR>") 

map("n", "<C-m>", ":Vman ")

map("n", "<leader>t", "<cmd>tab terminal fish<CR>i")

map("n", "<leader>m", "<cmd>tab terminal make -B<CR>")
map("n", "<leader>r", "<cmd>tab terminal make run<CR>")
map("n", "<leader>g", "<cmd>tab terminal make dbg<CR>")

map("i", "<S-Tab>", "<C-d>")

map("n", "<leader>d", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
map("n", "<leader>q", vim.diagnostic.setloclist)

-- filetypes

local augroup = vim.api.nvim_create_augroup

-- assembly
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup("extension_filetypes", { clear = true }),
  pattern = { "*.s", "*.inc" },
  command = "set ft=asm_ca65",
})

-- indentation
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("language_indentation", { clear = true }),
  pattern = { "asm_ca65", "c", "nim" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.textwidth = 0
vim.opt.list = false

-- python
-- vim.api.nvim_create_autocmd("FileType", {
--   group = augroup("py_build", { clear = true }),
--   pattern = "python",
--   callback = function()
--     vim.keymap.set("n", "<leader>m",
--       "<cmd>tab terminal source ./build.sh<CR>",
--       { buffer = true })
-- 
--     vim.keymap.set("n", "<leader>r",
--       "<cmd>tab terminal source ./run.sh<CR>",
--       { buffer = true })
--   end,
-- })

-- aliases

vim.cmd("cabbrev lang Filetypes")
vim.cmd("cabbrev search Lines")

-- appearance

if vim.g.neovide then
  vim.opt.guifont = "JetBrainsMono Nerd Font"
  vim.g.neovide_scale_factor = 0.85
end

opt.background = "dark"
vim.cmd("colorscheme gruvbox")

opt.colorcolumn = "70"

opt.shortmess:append("sI")
