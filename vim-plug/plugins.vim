
" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction


call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'
    
    " Telescopes Plugins
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'fannheyward/telescope-coc.nvim'
    Plug 'dracula/vim'
    Plug 'nvie/vim-flake8'
    Plug 'arzg/vim-colors-xcode'
    Plug 'vim-scripts/Pydiction'
    Plug 'vim-scripts/indentpython.vim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-fugitive'
    Plug 'preservim/nerdcommenter'
    Plug 'davidhalter/jedi-vim'
    Plug 'voldikss/vim-floaterm'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    "Accelerated jk
    Plug 'rhysd/accelerated-jk'
    
    " Documentation search
    Plug 'sunaku/vim-dasht'

    " Completion plugins
    Plug 'hrsh7th/nvim-compe'

    " auto close parenthesis
    Plug 'Raimondi/delimitMate'

    Plug '00sapo/vim-endwise', {'branch': 'patch-1'}

    " autoformat
    Plug 'sbdchd/neoformat'

    " Startify
    Plug 'mhinz/vim-startify'

    " status bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'szymonmaszke/vimpyter'

    Plug 'rhysd/vim-grammarous'

    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    Plug 'junegunn/goyo.vim'

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the par
    Plug 'akinsho/nvim-toggleterm.lua'
    Plug 'lewis6991/gitsigns.nvim'

    Plug 'ahmedkhalf/jupyter-nvim', { 'do': ':UpdateRemotePlugins' }



call plug#end()


:colorscheme xcodedarkhc
:set background=dark

lua << EOF
require('telescope').setup{
    defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('coc')
EOF

lua << EOF
  require("jupyter-nvim").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF


