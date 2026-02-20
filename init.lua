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

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.o.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
-- vim.o.showmode = false

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

-- Decrease mapped sequence wait time
-- vim.o.timeoutlen = 300

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

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

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

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
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

-- Navigate buffers using leader + directional keys
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<CR>', { noremap = true, silent = true, desc = 'Next Buffer' })
vim.keymap.set('n', '<leader>bp', '<cmd>bprev<CR>', { noremap = true, silent = true, desc = 'Previous Buffer' })
-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function() vim.hl.on_yank() end,
})


--set theme
vim.cmd("colorscheme naysayer")

-- ------------------------------------------------
-- ------------------------------------------------
-- import my custom functions
local function toggle_markdown_smart()
    local line = vim.api.nvim_get_current_line()
    local is_empty = line:match("^%s*$") ~= nil
    local current_mode = vim.api.nvim_get_mode().mode

    -- Logic: Toggle or Add
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

    -- Logic: When to enter/stay in Insert Mode
    -- 1. If we started in Insert mode, we want to stay there.
    -- 2. If we started in Normal mode but the line was empty, we want to start typing.
    if current_mode:find("i") or is_empty then
        vim.cmd("startinsert!")
    end
end

-- Keymaps
vim.keymap.set("n", "<C-x>", toggle_markdown_smart, { desc = "Toggle Checkbox" })
vim.keymap.set("i", "<C-x>", toggle_markdown_smart, { desc = "Toggle Checkbox" })

-- Localize functions for maximum LuaJIT performance
local gmatch = string.gmatch
local match = string.match
local rep = string.rep
local concat = table.concat

--- Core formatting logic optimized for Neovim line arrays
local function format_markdown_table_nvim(lines)
    local rows = {}
    local col_widths = {}
    local num_rows = 0
    local num_cols = 0

    -- Pass 1: Parse arrays directly (no string splitting needed)
    for i = 1, #lines do
        local line = lines[i]

        -- Skip the separator row
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

    -- Fallback if no table data was found
    if num_rows == 0 then
        return lines
    end

    -- Pass 2: Pre-calculate the separator line
    local sep_parts = {}
    for i = 1, num_cols do
        sep_parts[i] = rep("-", (col_widths[i] or 0) + 2)
    end
    local separator_line = "|" .. concat(sep_parts, "|") .. "|"

    -- Pass 3: Build the final array for Neovim
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

        -- Insert separator after header
        if r == 1 then
            out[out_idx] = separator_line
            out_idx = out_idx + 1
        end
    end

    return out
end

-- Create a Neovim user command to format the selected range
vim.api.nvim_create_user_command("FormatTable", function(opts)
    -- Neovim API lines are 0-indexed, end-exclusive
    local start_line = opts.line1 - 1
    local end_line = opts.line2

    -- Get lines from the current buffer
    local lines = vim.api.nvim_buf_get_lines(0, start_line, end_line, false)

    -- Format them
    local formatted_lines = format_markdown_table_nvim(lines)

    -- Write back to the buffer
    vim.api.nvim_buf_set_lines(0, start_line, end_line, false, formatted_lines)
end, { range = true, desc = "Format Markdown Table" })

-- Optional: Bind it to a keyboard shortcut (e.g., <leader>tt)
vim.keymap.set("v", "<leader>tt", ":FormatTable<CR>", { desc = "Format selected table" })

-- ================================================================
-- ================================================================
-- Create a custom command to trigger the finder
vim.api.nvim_create_user_command('FuzzyFind', function()
    -- 1. Create a temporary file to capture fzf's output
    local tmpfile = vim.fn.tempname()

    -- 2. Create a scratch buffer for our floating window
    local buf = vim.api.nvim_create_buf(false, true)

    -- 3. Calculate window dimensions (80% of the screen)
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)

    -- 4. Open the floating window
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

    -- 5. Launch fzf in a terminal buffer and pipe the selection to our temp file.
    -- (If you have 'fd' or 'rg' installed, you can replace 'fzf' with 'fd -t f | fzf')
    local cmd = string.format('fzf > %s', tmpfile)

    vim.fn.termopen(cmd, {
        on_exit = function()
            -- Close the floating window when fzf exits
            if vim.api.nvim_win_is_valid(win) then
                vim.api.nvim_win_close(win, true)
            end

            -- Check if our temp file exists and has content
            if vim.fn.filereadable(tmpfile) == 1 then
                local f = io.open(tmpfile, 'r')
                if f then
                    local selected_file = f:read('*l')
                    f:close()

                    -- If the user selected a file (didn't just hit Escape), open it
                    if selected_file and selected_file ~= "" then
                        vim.cmd('edit ' .. vim.fn.fnameescape(selected_file))
                    end
                end
                -- Clean up the temporary file
                vim.fn.delete(tmpfile)
            end
        end
    })

    -- 6. Immediately enter insert mode so you can start typing
    vim.cmd('startinsert')
end, { desc = 'Fast Fuzzy Finder via CLI fzf' })

-- Bind it to a keymap (e.g., <leader>f)
vim.keymap.set('n', '<leader>.', '<cmd>FuzzyFind<CR>', { noremap = true, silent = true, desc = 'Fuzzy Find Files' })


-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

-- vim.api.nvim_create_user_command('FuzzyBuffers', function()
--     -- Get the current working directory once, outside the loop
--     local cwd = vim.fn.getcwd() .. '/'
--     -- Escape special characters so we can use it safely in Lua's pattern matching
--     local cwd_esc = cwd:gsub("([^%w])", "%%%1") 
--
--     local bufs = vim.api.nvim_list_bufs()
--     local buf_names = {}
--
--     for _, buf in ipairs(bufs) do
--         -- 1. Use pure Lua (vim.bo) instead of vim.fn.buflisted to avoid Vimscript overhead
--         if vim.bo[buf].buflisted then
--             local name = vim.api.nvim_buf_get_name(buf)
--             if name ~= "" then
--                 -- 2. Use pure Lua string substitution instead of vim.fn.fnamemodify
--                 local rel_name = name:gsub('^' .. cwd_esc, '')
--                 table.insert(buf_names, rel_name)
--             end
--         end
--     end
--
--     if #buf_names == 0 then
--         print("No other buffers are currently open.")
--         return
--     end
--
--     local tmp_in = vim.fn.tempname()
--     local tmp_out = vim.fn.tempname()
--
--     -- 3. Write the entire list in one single I/O operation instead of a loop
--     local f_in = io.open(tmp_in, 'w')
--     if f_in then
--         f_in:write(table.concat(buf_names, '\n'))
--         f_in:close()
--     end
--
--     local buf_ui = vim.api.nvim_create_buf(false, true)
--     local width = math.floor(vim.o.columns * 0.8)
--     local height = math.floor(vim.o.lines * 0.8)
--     local col = math.floor((vim.o.columns - width) / 2)
--     local row = math.floor((vim.o.lines - height) / 2)
--
--     local win = vim.api.nvim_open_win(buf_ui, true, {
--         relative = 'editor',
--         width = width,
--         height = height,
--         col = col,
--         row = row,
--         style = 'minimal',
--         border = 'rounded'
--     })
--
--     -- Map <Esc><Esc> to force close the window
--     vim.keymap.set({'t', 'n'}, '<Esc><Esc>', '<cmd>close<CR>', { buffer = buf_ui, silent = true })
--
--     local cmd_string = string.format('fzf < %s > %s', tmp_in, tmp_out)
--     local cmd = {'sh', '-c', cmd_string}
--
--     vim.fn.termopen(cmd, {
--         on_exit = function()
--             if vim.api.nvim_win_is_valid(win) then
--                 vim.api.nvim_win_close(win, true)
--             end
--
--             if vim.fn.filereadable(tmp_out) == 1 then
--                 local f_out = io.open(tmp_out, 'r')
--                 if f_out then
--                     local selected = f_out:read('*l')
--                     f_out:close()
--
--                     if selected and selected ~= "" then
--                         vim.cmd('buffer ' .. vim.fn.fnameescape(selected))
--                     end
--                 end
--             end
--
--             vim.fn.delete(tmp_in)
--             vim.fn.delete(tmp_out)
--         end
--     })
--
--     vim.cmd('startinsert')
-- end, { desc = 'Fast Fuzzy Find Open Buffers' })
--
-- vim.keymap.set('n', '<leader>b', '<cmd>FuzzyBuffers<CR>', { noremap = true, silent = true, desc = 'Search Open Buffers' })


-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- POWERLINE SETTINGS

-- 1. Setup Colors (Added a purple Git section)
local function set_statusline_colors()
    -- Mode
    vim.api.nvim_set_hl(0, 'SlMode', { bg = '#87afaf', fg = '#121212', bold = true })
    -- Transition: Mode -> Git
    vim.api.nvim_set_hl(0, 'SlModeSep', { fg = '#87afaf', bg = '#af87d7' })
    
    -- Git Branch
    vim.api.nvim_set_hl(0, 'SlGit', { bg = '#af87d7', fg = '#121212', bold = true })
    -- Transition: Git -> File Path
    vim.api.nvim_set_hl(0, 'SlGitSep', { fg = '#af87d7', bg = '#3a3a3a' })
    
    -- File Path
    vim.api.nvim_set_hl(0, 'SlPath', { bg = '#3a3a3a', fg = '#e4e4e4' })
    -- Transition: File Path -> Empty Space
    vim.api.nvim_set_hl(0, 'SlPathSep', { fg = '#3a3a3a', bg = 'NONE' })
    
    -- Right side
    vim.api.nvim_set_hl(0, 'SlPosSep', { fg = '#3a3a3a', bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'SlPos', { bg = '#3a3a3a', fg = '#e4e4e4', bold = true })
end

set_statusline_colors()

-- 2. Async Git Branch Fetcher
-- This runs in the background only when you enter a buffer or regain focus
vim.api.nvim_create_autocmd({"BufEnter", "FocusGained", "DirChanged"}, {
    callback = function()
        local buf = vim.api.nvim_get_current_buf()
        -- Use jobstart for non-blocking background execution
        vim.fn.jobstart({"git", "branch", "--show-current"}, {
            stdout_buffered = true,
            on_stdout = function(_, data)
                if data and data[1] and data[1] ~= "" then
                    -- Store the formatted branch name (with a Nerd Font icon)
                    vim.api.nvim_buf_set_var(buf, "git_branch", "  " .. data[1] .. " ")
                else
                    -- Not a git repo
                    vim.api.nvim_buf_set_var(buf, "git_branch", "")
                end
            end
        })
    end
})

-- 3. The Statusline Function
_G.MinimalStatusLine = function()
    local mode_map = {
        ['n'] = ' NORMAL ', ['i'] = ' INSERT ', ['v'] = ' VISUAL ',
        ['V'] = ' V-LINE ', ['\22'] = ' V-BLOCK ', ['c'] = ' COMMAND ',
        ['R'] = ' REPLACE ',
    }
    local m = vim.api.nvim_get_mode().mode
    local current_mode = mode_map[m] or (' ' .. m .. ' ')

    -- Read the cached git branch. If it doesn't exist yet, default to empty string.
    local git_branch = vim.b.git_branch or ""

    local filename = vim.fn.expand('%:t')
    if filename == '' then filename = '[No Name]' end
    local modified_flag = vim.bo.modified and ' [+] ' or ' '

    -- Build the left side dynamically
    local left = string.format("%%#SlMode#%s", current_mode)

    -- If we are in a git repo, inject the purple Git block and its transitions
    if git_branch ~= "" then
        left = left .. string.format("%%#SlModeSep#%%#SlGit#%s%%#SlGitSep#", git_branch)
    else
        -- If not a git repo, skip the purple block and transition straight to the grey Path block
        left = left .. "%%#SlModeSep#"
        -- We temporarily hijack SlModeSep's background to match SlPath so the arrow looks right
        vim.api.nvim_set_hl(0, 'SlModeSep', { fg = '#87afaf', bg = '#3a3a3a' })
    end

    -- Always reset SlModeSep to purple just in case we switch back to a git buffer
    if git_branch ~= "" then
        vim.api.nvim_set_hl(0, 'SlModeSep', { fg = '#87afaf', bg = '#af87d7' })
    end

    -- Append the File Path block
    left = left .. string.format("%%#SlPath# %s%s%%#SlPathSep#", filename, modified_flag)

    local right = "%#SlPosSep#%#SlPos# %l:%c "

    return left .. "%=" .. right
end

vim.o.statusline = "%!v:lua.MinimalStatusLine()"
