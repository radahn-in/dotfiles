-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Do things without affecting the registers
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- ThePrimeagen's essential movement and editing keymaps

-- Move lines in visual mode (ThePrimeagen classic)
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Keep cursor in place during J (join lines)
keymap.set("n", "J", "mzJ`z", opts)

-- Keep cursor centered during scrolling (game changer!)
keymap.set("n", "<C-d>", "<C-d>zz", opts)
keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Keep search terms in the middle
keymap.set("n", "n", "nzzzv", opts)
keymap.set("n", "N", "Nzzzv", opts)

-- Greatest remap ever - paste without losing register
keymap.set("x", "<leader>p", [["_dP]], opts)

-- System clipboard operations
keymap.set({ "n", "v" }, "<leader>y", [["+y]], opts)
keymap.set("n", "<leader>Y", [["+Y]], opts)

-- Delete to void register (don't pollute clipboard)
keymap.set({ "n", "v" }, "<leader>d", [["_d]], opts)

-- Disable Q (ex mode is annoying)
keymap.set("n", "Q", "<nop>", opts)

-- Project navigation (overrides your existing <leader>pv if you have it)
keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open netrw" })

-- Quickfix navigation (ThePrimeagen style)
keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", opts)
keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", opts)
keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", opts)
keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", opts)

-- Global search and replace (ThePrimeagen's favorite)
keymap.set(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Search and replace word under cursor" }
)

-- Make file executable
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

-- Source current file (for config editing)
keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end, { desc = "Source current file" })

-- Additional LSP keymaps in ThePrimeagen style
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local opts_lsp = { buffer = event.buf, remap = false }

    -- ThePrimeagen's LSP keymaps
    keymap.set("n", "gd", function()
      vim.lsp.buf.definition()
    end, opts_lsp)
    keymap.set("n", "K", function()
      vim.lsp.buf.hover()
    end, opts_lsp)
    keymap.set("n", "<leader>vws", function()
      vim.lsp.buf.workspace_symbol()
    end, opts_lsp)
    keymap.set("n", "<leader>vd", function()
      vim.diagnostic.open_float()
    end, opts_lsp)
    keymap.set("n", "[d", function()
      vim.diagnostic.goto_next()
    end, opts_lsp)
    keymap.set("n", "]d", function()
      vim.diagnostic.goto_prev()
    end, opts_lsp)
    keymap.set("n", "<leader>vca", function()
      vim.lsp.buf.code_action()
    end, opts_lsp)
    keymap.set("n", "<leader>vrr", function()
      vim.lsp.buf.references()
    end, opts_lsp)
    keymap.set("n", "<leader>vrn", function()
      vim.lsp.buf.rename()
    end, opts_lsp)
    keymap.set("i", "<C-h>", function()
      vim.lsp.buf.signature_help()
    end, opts_lsp)
  end,
})
-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "<leader>r", function()
  require("craftzdog.hsl").replaceHexWithHSL()
end)

keymap.set("n", "<leader>i", function()
  require("craftzdog.lsp").toggleInlayHints()
end)
