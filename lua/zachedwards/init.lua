require("zachedwards.set")
require("zachedwards.remap")
require("zachedwards.lazy_init")

-- DO.not
-- DO NOT INCLUDE THIS

-- If i want to keep doing lsp debugging
-- function restart_htmx_lsp()
--     require("lsp-debug-tools").restart({ expected = {}, name = "htmx-lsp", cmd = { "htmx-lsp", "--level", "DEBUG" }, root_dir = vim.loop.cwd(), });
-- end

-- DO NOT INCLUDE THIS
-- DO.not
vim.opt.backspace = { "indent", "eol", "start" }

vim.cmd('set backspace=indent,eol,start')
local augroup = vim.api.nvim_create_augroup
local ZachGroup = augroup('ZachEdwards', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = ZachGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
vim.env.OPENAI_API_KEY = "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"
autocmd('LspAttach', {
    group = ZachGroup,
    callback = function(e)
        local opts = { buffer = e.buf }

        -- Go to definition of symbol under cursor
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)

        -- Show hover information about symbol under cursor
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)

        -- Search for workspace symbols
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)

        -- Open floating diagnostic window
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)

        -- Show available code actions
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)

        -- Find all references to symbol under cursor
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)

        -- Rename symbol under cursor
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)

        -- Show signature help (function parameters, etc.) in insert mode
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

        -- Go to next diagnostic in current buffer
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)

        -- Go to previous diagnostic in current buffer
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})
ColorMyPencils()
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
