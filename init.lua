-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

--  For more options, you can see `:help option-list`

vim.o.number = true
vim.o.relativenumber = true

-- no wrapping
vim.opt.wrap = false

-- Ensure the statusline is always visible
vim.opt.laststatus = 2
-- Set the statusline to include the full file path
vim.opt.statusline = "%F"
--
-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-guide-options`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- KEYMAPS
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic Config & Keymaps
-- See :help vim.diagnostic.Opts
vim.diagnostic.config {
    update_in_insert = false,
    severity_sort = true,
    float = { border = 'rounded', source = 'if_many' },
    underline = { severity = vim.diagnostic.severity.ERROR },

    -- Can switch between these as you prefer
    virtual_text = true, -- Text shows up at the end of the line
    virtual_lines = false, -- Teest shows up underneath the line, with virtual lines

    -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
    jump = { float = true },
}

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<Leader>ww', '<C-w>w', { noremap = true, desc = 'Go to next window' })

vim.keymap.set('n', '<leader>wh', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<leader>wl', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<leader>wj', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<leader>wk', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>wH', '<C-w>H', { noremap = true, desc = 'Go to left window' })
vim.keymap.set('n', '<leader>wJ', '<C-w>J', { noremap = true, desc = 'Go to down window' })
vim.keymap.set('n', '<leader>wK', '<C-w>K', { noremap = true, desc = 'Go to up window' })
vim.keymap.set('n', '<leader>wL', '<C-w>L', { noremap = true, desc = 'Go to right window' })

vim.keymap.set('n', '<leader>ws', '<C-w>s', { noremap = true, desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>wv', '<C-w>v', { noremap = true, desc = 'Split window vertically' })

vim.keymap.set('n', '<leader>bn', '<cmd>bnext<CR>', { noremap = true, silent = true, desc = 'Next Buffer' })
vim.keymap.set('n', '<leader>bp', '<cmd>bprev<CR>', { noremap = true, silent = true, desc = 'Previous Buffer' })

-- [[ Basic Autocommands ]]
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function() vim.hl.on_yank() end,
})

--set theme
vim.cmd("colorscheme naysayer")

-- function to toggle line numbers
local toggle_number = function() 
 vim.o.number = not vim.o.number
 vim.o.relativenumber = not vim.o.relativenumber
end
vim.keymap.set('n', '<leader>tn', toggle_number)

-- When jumping to the end of the file (G), automatically center the screen (zz)
vim.keymap.set('n', 'G', 'Gzz', { noremap = true })

-- When doing half-page jumps down (<C-d>) or up (<C-u>), center the screen
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })

-- When moving to the next search result (n) or previous (N), center the screen
vim.keymap.set('n', 'n', 'nzz', { noremap = true })
vim.keymap.set('n', 'N', 'Nzz', { noremap = true })
vim.keymap.set('n', 'G', 'Gzz', { noremap = true })

-- When doing half-page jumps down (<C-d>) or up (<C-u>), center the screen
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })

-- When moving to the next search result (n) or previous (N), center the screen
vim.keymap.set('n', 'n', 'nzz', { noremap = true })
vim.keymap.set('n', 'N', 'Nzz', { noremap = true })

-- ------------------------------------------------
-- ------------------------------------------------
-- ADD CHECK MARK
local function toggle_markdown_smart()
    local line = vim.api.nvim_get_current_line()
    local is_empty = line:match("^%s*$") ~= nil
    local current_mode = vim.api.nvim_get_mode().mode

    if line:match("%[% %]") then
        line = line:gsub("%[% %]", "[x]", 1)
    elseif line:match("%[x%]") then
        line = line:gsub("%[x%]", "[ ]", 1)
    else
        local indent = line:match("^%s*")
        local content = line:gsub("^%s*", ""):gsub("^[*-] ", "", 1)
        line = indent .. "* [ ] " .. content
    end

    vim.api.nvim_set_current_line(line)

    if current_mode:find("i") or is_empty then
        vim.cmd("startinsert!")
    end
end
vim.keymap.set({"n", "i"}, "<C-x>", toggle_markdown_smart, { desc = "Toggle Checkbox" })

-- TABLE FORMAT
local gmatch = string.gmatch
local match = string.match
local rep = string.rep
local concat = table.concat

local function format_markdown_table_nvim(lines)
    local rows = {}
    local col_widths = {}
    local num_rows = 0
    local num_cols = 0

    for i = 1, #lines do
        local line = lines[i]

        if not match(line, "^%s*|[%-%s%|:]+|%s*$") then
            local row = {}
            local col_idx = 1

            for cell in gmatch(line, "|([^|]+)") do
                local clean_cell = match(cell, "^%s*(.-)%s*$") or ""
                row[col_idx] = clean_cell

                local cell_len = #clean_cell
                if cell_len > (col_widths[col_idx] or 0) then
                    col_widths[col_idx] = cell_len
                end
                col_idx = col_idx + 1
            end

            if col_idx > 1 then
                num_rows = num_rows + 1
                rows[num_rows] = row
                if col_idx - 1 > num_cols then
                    num_cols = col_idx - 1
                end
            end
        end
    end

    if num_rows == 0 then
        return lines
    end

    local sep_parts = {}
    for i = 1, num_cols do
        sep_parts[i] = rep("-", (col_widths[i] or 0) + 2)
    end
    local separator_line = "|" .. concat(sep_parts, "|") .. "|"

    local out = {}
    local out_idx = 1

    for r = 1, num_rows do
        local row = rows[r]
        local row_parts = {}

        for c = 1, num_cols do
            local cell = row[c] or ""
            local pad_len = (col_widths[c] or 0) - #cell
            row_parts[c] = " " .. cell .. rep(" ", pad_len) .. " "
        end

        out[out_idx] = "|" .. concat(row_parts, "|") .. "|"
        out_idx = out_idx + 1

        if r == 1 then
            out[out_idx] = separator_line
            out_idx = out_idx + 1
        end
    end

    return out
end

vim.api.nvim_create_user_command("FormatTable", function(opts)
    local start_line = opts.line1 - 1
    local end_line = opts.line2

    local lines = vim.api.nvim_buf_get_lines(0, start_line, end_line, false)

    local formatted_lines = format_markdown_table_nvim(lines)

    vim.api.nvim_buf_set_lines(0, start_line, end_line, false, formatted_lines)
end, { range = true, desc = "Format Markdown Table" })

vim.keymap.set("v", "<leader>tt", ":FormatTable<CR>", { desc = "Format selected table" })

-- ================================================================
-- ================================================================
-- Create a custom command to trigger the finder

vim.api.nvim_create_user_command('FuzzyFind', function()
    local tmpfile = vim.fn.tempname()

    local buf = vim.api.nvim_create_buf(false, true)

    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)

    local win = vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = width,
        height = height,
        col = col,
        row = row,
        style = 'minimal',
        border = 'rounded'
    })

    vim.keymap.set({'t', 'n'}, '<Esc><Esc>', '<cmd>close<CR>', { buffer = buf_ui, silent = true })

    local cmd = string.format('fzf > %s', tmpfile)

    vim.fn.termopen(cmd, {
        on_exit = function()
            if vim.api.nvim_win_is_valid(win) then
                vim.api.nvim_win_close(win, true)
            end

            if vim.fn.filereadable(tmpfile) == 1 then
                local f = io.open(tmpfile, 'r')
                if f then
                    local selected_file = f:read('*l')
                    f:close()

                    if selected_file and selected_file ~= "" then
                        vim.cmd('edit ' .. vim.fn.fnameescape(selected_file))
                    end
                end
                vim.fn.delete(tmpfile)
            end
        end
    })

    vim.cmd('startinsert')
end, { desc = 'Fast Fuzzy Finder via CLI fzf' })
vim.keymap.set('n', '<leader>.', '<cmd>FuzzyFind<CR>', { noremap = true, silent = true, desc = 'Fuzzy Find Files' })

-- ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
-- ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
-- AUTOPAIRS

vim.keymap.set('i', '(', '()<Left>', { noremap = true })
vim.keymap.set('i', '[', '[]<Left>', { noremap = true })
vim.keymap.set('i', '{', '{}<Left>', { noremap = true })
vim.keymap.set('i', '"', '""<Left>', { noremap = true })
vim.keymap.set('i', "'", "''<Left>", { noremap = true })
vim.keymap.set('i', '`', '``<Left>', { noremap = true })

vim.keymap.set('i', '{<CR>', '{<CR>}<Esc>O', { noremap = true })

local function skip_or_insert(char)
    return function()
        local col = vim.fn.col('.')
        local line = vim.fn.getline('.')
        -- Get the character immediately under/after the cursor
        local next_char = line:sub(col, col)
        if next_char == char then
            -- If it matches, just move right (step over)
            return '<Right>'
        else
            -- If not, insert the character normally
            return char
        end
    end
end

-- Apply the type-over logic to closing characters
vim.keymap.set('i', ')', skip_or_insert(')'), { expr = true, noremap = true })
vim.keymap.set('i', ']', skip_or_insert(']'), { expr = true, noremap = true })
vim.keymap.set('i', '}', skip_or_insert('}'), { expr = true, noremap = true })
vim.keymap.set('i', '"', skip_or_insert('"'), { expr = true, noremap = true })
vim.keymap.set('i', "'", skip_or_insert("'"), { expr = true, noremap = true })
vim.keymap.set('i', '`', skip_or_insert('`'), { expr = true, noremap = true })


