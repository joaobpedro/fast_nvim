-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

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
vim.o.timeoutlen = 300

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
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

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

