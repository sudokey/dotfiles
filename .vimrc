" TODO
" Toggle dark/light theme
" Add deoplete.nvim
" Reload files when its changed
" Fix color scheme for Rg

" Plug
    call plug#begin('~/.vim/plugged')

    Plug 'preservim/nerdtree'
    Plug 'altercation/vim-colors-solarized'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'maxmellon/vim-jsx-pretty'
    " Plug 'yuezk/vim-js'
    Plug 'pangloss/vim-javascript'
    Plug 'ervandew/supertab'
    Plug 'preservim/nerdcommenter'
    Plug 'maksimr/vim-yate'
    Plug 'jiangmiao/auto-pairs'
    Plug 'groenewege/vim-less'
    Plug 'iloginow/vim-stylus'
    Plug 'flowtype/vim-flow'
    Plug 'dense-analysis/ale'
    Plug 'mattn/emmet-vim'
    Plug 'terryma/vim-multiple-cursors'

    call plug#end()

" Base settings
    filetype plugin on
    let mapleader=","
    set encoding=utf-8
    set fileencodings=utf-8,cp1251
    set fileformat=unix
    set wildmenu
    set autoindent
    set smartindent
    set shiftwidth=4
    set tabstop=4
    set softtabstop=4
    set expandtab
    set cursorline
    set t_Co=256
    set splitbelow
    set splitright
    set shortmess+=I
    set hidden
    set visualbell
    set t_vb=
    set scrolljump=20
    set nowrap
    set linebreak
    set nobackup
    set noswapfile
    set history=1000
    set laststatus=2

" Solarized theme
    " let g:solarized_termcolors=256
    syntax enable
    set background=dark
    " set background=light
    colorscheme solarized

" Move lines
    nnoremap ∆ :m .+1<CR>==
    nnoremap ˚ :m .-2<CR>==
    inoremap ∆ <Esc>:m .+1<CR>==gi
    inoremap ˚ <Esc>:m .-2<CR>==gi
    vnoremap ∆ :m '>+1<CR>gv=gv
    vnoremap ˚ :m '<-2<CR>gv=gv

" Nerdtree
    let NERDTreeShowBookmarks=1
    let NERDTreeChDirMode=2
    let NERDTreeQuitOnOpen=1
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=0
    let NERDTreeMinimalUI=1
    let NERDTreeDirArrows=1
    let g:NERDTreeWinSize=35
    nnoremap <Bs> :<C-u>NERDTreeToggle<CR>
    nnoremap <Leader>n :<C-u>NERDTreeFind<CR>

" Search
    set incsearch
    set hlsearch
    set ignorecase
    set smartcase
    set gdefault

    nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

" Indetation
    vnoremap < <gv
    vnoremap > >gv

" Search matches are always in center
    nnoremap n nzz
    nnoremap N Nzz
    nnoremap * *zz
    nnoremap # #zz
    nnoremap g* g*zz
    nnoremap g# g#zz

" Remove all trailing whitespace
    autocmd BufWritePre * %s/\s\+$//e

" Fzf
    " Hide status line
    autocmd! FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

    " Build quick list
    function! s:build_quickfix_list(lines)
      call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
      copen
      cc
    endfunction

    let g:fzf_action={
      \ 'ctrl-q': function('s:build_quickfix_list'),
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }
    let g:fzf_preview_window=''
    let g:fzf_colors=
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

    nnoremap <Leader>f :<C-u>Files<CR>
    vnoremap <Leader>f y:<C-u>execute "FZF -q " . "<C-R>""<CR>
    nnoremap <leader>s :<C-u>execute "Rg " . expand("<cword>") <Bar> cw<CR>
    vnoremap <Leader>s y:<C-u>execute "Rg " . "<C-R>""<CR>
    imap <c-x><c-f> <plug>(fzf-complete-path)

" List/Next/Prev/Remove buffer
    nnoremap <Leader>bl :<C-u>Buffers<CR>
    nnoremap <Leader>bn :<C-u>bn<cr>
    nnoremap <Leader>bp :<C-u>bp<cr>
    nnoremap <Leader>bd :<C-u>bd<cr>

" Toggle word wrap
    nnoremap <leader>w :setlocal wrap!<cr>

" JS
    let g:javascript_plugin_jsdoc=1
    let g:javascript_plugin_flow=1

" Nerdcommenter
    let g:NERDSpaceDelims=1
    let g:NERDCompactSexyComs=1
    let g:NERDCommentEmptyLines=1
    let g:NERDTrimTrailingWhitespace=1
    let g:NERDToggleCheckAllLines=1

" Flow
    let g:flow#showquickfix=0
    let g:flow#enable=0
    autocmd FileType javascript nnoremap <Leader>j :<C-u>FlowJumpToDef<CR>

" Ale
    let g:ale_linters={
     \ 'javascript': ['flow', 'eslint']
     \ }
    let g:ale_linters_explicit=1
    let g:ale_lint_on_text_changed='never'
    let g:ale_lint_on_insert_leave=0
    nnoremap <Leader>l :<C-u>ALELint<CR>

" Emmet
    let g:user_emmet_leader_key='<c-e>'
    autocmd BufNewFile,BufReadPost *.styl set filetype=stylus
    autocmd BufNewFile,BufReadPost *.css set filetype=css
    autocmd BufRead,BufNewFile *.styl set filetype=css
