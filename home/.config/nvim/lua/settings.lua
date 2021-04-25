local g = vim.g -- a table to acess global variables
-- helper for setting options
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

-- buffered options need update in global table aswell
local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end
-- define leader keys

g.mapleader = ' '
g.maplocalleader = ' '

local indent = 2

vim.cmd[[filetype plugin indent on]]
opt('b', 'expandtab', true)                -- Use spaces instead of tabs
opt('b', 'shiftwidth', indent)             -- Size of an indent
opt('b', 'smartindent', true)              -- Insert indents automatically
opt('b', 'tabstop', indent)                -- Number of spaces tabs count for
opt('b', 'softtabstop', indent)            -- Number of spaces tabs count for
opt('o', 'hidden', true)                   -- Enable modified buffers in bg
opt('o', 'ignorecase', true)               -- Ignore case
opt('o', 'joinspaces', false)              -- No double spaces with join
opt('o', 'scrolloff', 4)                   -- Lines of context
opt('o', 'shiftround', true)               -- Round indent
opt('o', 'sidescrolloff', 4)               -- Columns of context
opt('o', 'smartcase', true)                -- Don't ignore case with capitals
opt('o', 'splitbelow', true)               -- Put new windows below current
opt('o', 'splitright', true)               -- Put new windows right of current
opt('o', 'termguicolors', true)            -- True color support
---pt('o', 'wildmode', 'list:longest')       -- Command-line completion mode
opt('o', 'mouse', 'a')                     -- Enable Mouse support
opt('o', 'showmatch', true)                -- Show matching brackets
opt('w', 'list', true)                     -- Show some invisible characters
opt('w', 'listchars', 'tab:> ,trail:•')    -- Define chars to show instead
opt('w', 'number', true)                   -- Print line number
opt('w', 'relativenumber', true)           -- Relative line numbers
opt('w', 'wrap', false)                    -- Disable line wrap
opt('w', 'signcolumn', 'yes:1')            -- Always show signcolumn on left
opt('b', 'textwidth', 80)                  -- Set text width
opt('w', 'colorcolumn', '+1')              -- Display color column
opt('w', 'foldmethod', 'expr')             -- Use Treesitter for folding
opt('w', 'foldexpr', 'nvim_treesitter#foldexpr()')
opt('o', 'foldlevelstart', 99)
opt('w', 'cursorline', true)
opt('o', 'completeopt', 'menuone,noselect')
opt('o', 'pumheight', 15)
opt('o', 'background', 'dark')


-- colorscheme options
g.tokyonight_style = "night"
g.tokyonight_italic_functions = true
g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer", "NvimTree" }
vim.cmd[[colorscheme tokyonight]]

-- treesitter setup
require('nvim-treesitter.configs').setup{
  ensure_installed = 'maintained',
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },

}

-- lualine
require('lualine').setup {
  options = {
    theme = 'tokyonight',
    section_separators = '',
    component_separators = '',
  },
  sections = {
    lualine_x = {'filetype'},
  }
}

-- nvim-tree
g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }
g.nvim_tree_lsp_diagnostics = 1
g.nvim_tree_auto_close = 1
g.nvim_tree_auto_open = 1


-- indent line
-- g.indentLine_char = '|'
-- g.indentLine_showFirstIndentLevel = 1
-- g.indentLine_fileTypeExclude = {'help', 'terminal'}
g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level = true
g.indent_blankline_use_treesitter = true

-- autopairs
require('nvim-autopairs').setup()

-- telescope
require('telescope').setup {
  prompt_prefix = "🔭 ",
}

-- gitsigns
require('gitsigns').setup()

-- nvim-compe
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    spell = true;
  };
}


-- Lsp and LspInstall
local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

local lspconfig = require'lspconfig'

lspconfig.lua.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim', 'use' }
      }
    }
  }
}

lspconfig.latex.setup{
  settings = {
    latex = {
      build = {
        onSave = true,
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1",
          "-output-directory=build", "%f" },
      }
    }
  }
}

-- quick-scope
g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}

-- saga
require'lspsaga'.init_lsp_saga()

