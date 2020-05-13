" TODO
" Add jump definition to other window
" Add deoplete.nvim
" Fix color scheme for Rg
" True colors for iterm

" Plug
    call plug#begin('~/.vim/plugged')

    Plug 'preservim/nerdtree'
    Plug 'altercation/vim-colors-solarized'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'yuezk/vim-js'
    " Plug 'pangloss/vim-javascript'
    Plug 'ervandew/supertab'
    Plug 'preservim/nerdcommenter'
    Plug 'maksimr/vim-yate'
    Plug 'jiangmiao/auto-pairs'
    Plug 'groenewege/vim-less'
    Plug 'iloginow/vim-stylus'
    Plug 'flowtype/vim-flow'
    Plug 'dense-analysis/ale'
    Plug 'mattn/emmet-vim'
    Plug 'Quramy/tsuquyomi'
    Plug 'tpope/vim-surround'
    Plug 'morhetz/gruvbox'
    Plug 'editorconfig/editorconfig-vim'
    " Plug 'zhaocai/GoldenView.Vim'

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
    set fillchars+=vert:▕

" Theme
    set t_Co=256
    syntax enable
    set background=dark

    function! BackgroundToggle()
        if &background ==? 'dark'
            set background=light
        else
            set background=dark
        endif
    endfunction
    nnoremap <Leader>t :call BackgroundToggle()<CR>

    let g:solarized_termcolors=256
    " colorscheme solarized
    autocmd vimenter * colorscheme gruvbox

" Resize windows
    function! Zoom()
        let zoomWindowsCount = len(range(1, winnr('$')))
        let zoomMainWindowWidth = 80
        let zoomOtherWindowWidth = (&columns - zoomMainWindowWidth) / (zoomWindowsCount - 1)

        exec "vertical resize 80"

        for window in range(2, winnr('$'))
            exec "wincmd w"
            exec printf("vertical resize %f", zoomOtherWindowWidth)
        endfor

        exec "wincmd w"
    endfunction
    nnoremap <Leader>z :call Zoom()<CR>

" Save file
    nnoremap <Leader>w :w<CR>

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
    let g:fzf_colors={
        \ 'fg':      ['fg', 'Normal'],
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

" List/Delete/Quite buffer
    nnoremap <Leader>bl :<C-u>Buffers<CR>
    nnoremap <Leader>bd :<C-u>bd<CR>
    nnoremap <Leader>q :<C-u>q<CR>

" Split window
    nnoremap <Leader>vs :<C-u>vs<CR>
    nnoremap <Leader>vp :<C-u>sp<CR>

" Toggle word wrap
    nnoremap <Leader><Leader>w :setlocal wrap!<CR>

" Reload files
    set autoread
    " nnoremap <Leader>r :<C-U>bufdo checktime<CR>
    nnoremap <Leader>u :bufdo <C-U>execute "checktime"<CR>

" Nerdcommenter
    let g:NERDSpaceDelims=1
    let g:NERDCompactSexyComs=1
    let g:NERDCommentEmptyLines=1
    let g:NERDTrimTrailingWhitespace=1
    let g:NERDToggleCheckAllLines=1
    let g:NERDTreeWinSize=50

" Ale
    let g:ale_linters={
        \ 'javascript': ['flow', 'eslint'],
        \ 'typescript': ['eslint'],
        \ }
    let g:ale_linters_explicit=1
    let g:ale_lint_on_text_changed='never'
    let g:ale_lint_on_insert_leave=0
    let g:ale_sign_error = '✘'
    let g:ale_sign_warning = '⚠'
    highlight ALEErrorSign ctermbg=NONE ctermfg=red
    highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
    highlight SignColumn ctermbg=NONE
    nnoremap <Leader>l :<C-u>ALELint<CR>

" Emmet
    let g:user_emmet_leader_key='<c-e>'
    imap <c-j> <plug>(emmet-expand-abbr)

" Stylus
    autocmd BufRead,BufNewFile *.styl set filetype=less

" JS
    let g:javascript_plugin_jsdoc=1
    let g:javascript_plugin_flow=1

" Flow
    let g:flow#showquickfix=0
    let g:flow#enable=0
    autocmd FileType javascript nnoremap gd :<C-u>FlowJumpToDef<CR>

" Typescript
    autocmd FileType typescript set syntax=javascript
    autocmd FileType typescript nnoremap gd :<C-u>TsuDefinition<CR>
