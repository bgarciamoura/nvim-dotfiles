-- show line numbers
vim.opt.number = true;

-- ignore uppercase letters unless the search term has a uppercase letter
vim.opt.smartcase = true;

-- tab size
vim.opt.tabstop = 2;

-- how much characters nvim will use to indent a line
vim.opt.shiftwidth = 2;

-- controls if nvim should replace Tab for Space
vim.opt.expandtab = false;

-- enable mouse to select
vim.opt.mouse = 'a';

-- disable the highlights of the previous search results
vim.opt.hlsearch = false;

-- auto indent next line like the previous one
vim.opt.autoindent = true;

-- fix the antialias on macos
-- vim.opt.antialias = true;

-- read the current file from disk if the file was changed outside vim
vim.opt.autoread = true;

-- autosave file when it has been modified
vim.opt.autowrite = true;

-- autosave file for commands
vim.opt.autowriteall = true;

-- highlight the cursor line to be more easy to find it
vim.opt.cursorline = false;

-- set the encoding to utf-8
vim.opt.encoding = 'utf-8';

-- remove the ~ character from empty lines on buffer
vim.opt.fillchars = 'eob: '

-- Add new line to the end of the file
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  group = vim.api.nvim_create_augroup('UserOnSave', {}),
  pattern = '*',
  callback = function()
    local n_lines = vim.api.nvim_buf_line_count(0)
    local last_nonblank = vim.fn.prevnonblank(n_lines)
    if last_nonblank <= n_lines then vim.api.nvim_buf_set_lines(0,
      last_nonblank, n_lines, true, { '' })
    end
  end,
})

