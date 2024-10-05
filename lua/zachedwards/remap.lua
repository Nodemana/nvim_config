-- Set leader key to space
vim.g.mapleader = " "

-- Open file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move selected lines up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Join lines and keep cursor in place
vim.keymap.set("n", "J", "mzJ`z")

vim.opt.backspace = { 'indent', 'eol', 'start' }
-- Scroll half page up/down and center cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep search terms in the middle when cycling
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Restart LSP server
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- Start and stop "Vim With Me" (likely a plugin)
vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- Paste over selection without copying replaced text
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete without copying to register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Make Ctrl+C act as Escape in insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Disable Q in normal mode
vim.keymap.set("n", "Q", "<nop>")

-- Open tmux sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Format buffer using LSP
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Navigate quickfix list
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Navigate location list
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Search and replace word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Insert error checking snippet (Go-specific)
vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

-- Open Packer configuration file
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");

-- Trigger "make it rain" animation (fun plugin)
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- Source current file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)


local themes = {
    "tokyonight",
    "gruvbox",
    "rose-pine",
    "catppuccin", -- Catppuccin theme
    "kanagawa", -- Kanagawa theme
    "nightfox", -- Nightfox theme
    "onedark",  -- OneDark theme
}

local current_theme_index = 1

local function cycle_theme(direction)
    if direction == "next" then
        current_theme_index = (current_theme_index % #themes) + 1
    elseif direction == "prev" then
        current_theme_index = ((current_theme_index - 2) % #themes) + 1
    end

    local new_theme = themes[current_theme_index]
    ColorMyPencils(new_theme)
    print("Switched to theme: " .. new_theme)
end
-- Theming
vim.keymap.set("n", "<leader>tn", function() cycle_theme("next") end, { desc = "Next theme" })
vim.keymap.set("n", "<leader>tp", function() cycle_theme("prev") end, { desc = "Previous theme" })

vim.keymap.set('i', '<BS>', '<BS>', { noremap = true, desc = "Ensure Backspace works in insert mode" })

-- ChatGPT remap
vim.keymap.set("n", "<leader>cc", ":ChatGPT<CR>", { desc = "ChatGPT" })
vim.keymap.set("n", "<leader>ce", ":ChatGPTEditWithInstruction<CR>", { desc = "Edit with instruction" })
vim.keymap.set("n", "<leader>cg", ":ChatGPTRun grammar_correction<CR>", { desc = "Grammar Correction" })
vim.keymap.set("n", "<leader>ct", ":ChatGPTRun translate<CR>", { desc = "Translate" })
vim.keymap.set("n", "<leader>ck", ":ChatGPTRun keywords<CR>", { desc = "Keywords" })
vim.keymap.set("n", "<leader>cd", ":ChatGPTRun docstring<CR>", { desc = "Docstring" })
vim.keymap.set("n", "<leader>ca", ":ChatGPTRun add_tests<CR>", { desc = "Add Tests" })
vim.keymap.set("n", "<leader>co", ":ChatGPTRun optimize_code<CR>", { desc = "Optimize Code" })
vim.keymap.set("n", "<leader>cs", ":ChatGPTRun summarize<CR>", { desc = "Summarize" })
vim.keymap.set("n", "<leader>cf", ":ChatGPTRun fix_bugs<CR>", { desc = "Fix Bugs" })
vim.keymap.set("n", "<leader>cx", ":ChatGPTRun explain_code<CR>", { desc = "Explain Code" })
