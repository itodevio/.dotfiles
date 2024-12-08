local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true
vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro' -- Show line numbers and relative lines in netrw

-- Scroll
opt.scrolloff = 8

-- Tabs
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- Indentation
opt.autoindent = true
opt.smartindent = true

-- Line wrapping
opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Update time
opt.updatetime = 300 -- Make plugin actions happen faster

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.colorcolumn = "120"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard = "unnamedplus"

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- File modification history
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- Utilities
opt.iskeyword:append("-") -- Consider "-" seppared text as one word
opt.isfname:append("@-@") -- Consider "@" as valid file name character 

