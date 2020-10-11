call plug#begin('~/.config/nvim/autoload/plugged')
  " Ranger as File Explorer
  Plug 'iberianpig/ranger-explorer.vim'
  " Auto pairs for '(' '[' '{'
  Plug 'jiangmiao/auto-pairs'
  " Themas
  Plug 'joshdick/onedark.vim'
  Plug 'kaicataldo/material.vim', { 'branch': 'main' }
  " Airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Rnvimr
  Plug 'rbgrouleff/bclose.vim'
  " This repository contains snippets files for various programming languages.
  Plug 'honza/vim-snippets'
  " Pasting in Vim with indentation adjusted to destination context.
  Plug 'sickill/vim-pasta'
  " css-color
  Plug 'ap/vim-css-color'
  " c++
  Plug 'bfrg/vim-cpp-modern'
call plug#end()
