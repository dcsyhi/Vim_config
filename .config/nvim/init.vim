set termguicolors
set background=dark

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/enma/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/enma/.cache/dein')
  call dein#begin('/home/enma/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/enma/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })

  call dein#load_toml('/home/enma/.config/nvim/dein.toml', {'lazy': 0 })
  call dein#load_toml('/home/enma/.config/nvim/dein_lazy.toml', {'lazy' : 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

set number
colorscheme lucius 
syntax on
set t_Co=256

