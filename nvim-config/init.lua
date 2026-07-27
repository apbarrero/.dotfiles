-- ~/.dotfiles/nvim-config/init.lua
-- Portable personal Neovim settings.
--
-- IMPORTANT: the leader key must be set AFTER the distro's defaults but BEFORE
-- plugins map their `<leader>...` keys. Source point depends on your setup:
--
--   * LazyVim: add to the END of `lua/config/options.lua` (runs after LazyVim's
--     own space-leader default, before lazy.setup maps keys):
--         dofile(vim.fn.expand("~/.dotfiles/nvim-config/init.lua"))
--
--   * Plain lazy.nvim: source near the top of init.lua, before
--     `require("lazy").setup(...)`.

-- Set `,` as the <leader> key.
vim.g.mapleader = ","
-- Local leader too, so buffer-local mappings stay consistent.
vim.g.maplocalleader = ","
