" PREFERENCES
" Language and Character Code
let $LANG='en_US.UTF-8'
set encoding=utf8
" Show Line Number
set number
" Show Cursor Position
set ruler
" Highlight Current Line
set cursorline
" Show Status Bar Constantly
set laststatus=2
" GUI Setting
set guifontwide=DroidSansMono\ Nerd\ Font\ 10
set guifont=DroidSansMono\ Nerd\ Font\ 10
set guicursor+=i:block,a:-blinkwait175-blinkoff150-blinkon175
" Highlight Search Result
set hlsearch
" Command History
set history=1000
" Enable Command Complement
set wildmenu
" Indent Automatically (4 Half Spaces)
set autoindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
" Set Shell
set shell=fish
" Enable Syntax Highlight
syntax enable

" PLUGIN SETTINGS
call plug#begin('$XDG_DATA_HOME/nvim/site')

    " Set Document Japanese
    Plug 'vim-jp/vimdoc-ja'
    " Enable Clipboard History
    Plug 'vim-scripts/YankRing.vim'
    " Set IME OFF When Escape From Insert Mode
    Plug 'kaz399/spzenhan.vim'
    " Set NeoVim Theme
    Plug 'cocopon/iceberg.vim'
    " Enrich Status Bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Show Popup Menu and Snippet
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Enable NerdFont and Glyphicon
    Plug 'lambdalisue/nerdfont.vim'
    Plug 'lambdalisue/glyph-palette.vim'
    Plug 'ryanoasis/vim-devicons'
    " File Explorer with NerdFont
    Plug 'preservim/nerdtree'
    " Show Git Status In File Explorer
    Plug 'Xuyuanp/nerdtree-git-plugin'
    " Enable Highlight
    Plug 'nvim-treesitter/nvim-treesitter'
    " Enable Comment Out Command
    Plug 'tpope/vim-commentary'
    " Enable Fuzzy Finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " Show Git Status Beside Line Number
    Plug 'airblade/vim-gitgutter'
    " Enrich Git Diff
    Plug 'kana/vim-gf-diff'
    Plug 'kana/vim-gf-user'
    " Enable Git Command
    Plug 'tpope/vim-fugitive'
    " Enable golang Debugger 
    Plug 'sebdah/vim-delve'
    " Enrich Terminal Mode
    Plug 'kassio/neoterm'

call plug#end()

" Buffers SETTINGS
nnoremap <silent> <C-k> :bprev<CR>
nnoremap <silent> <C-j> :bnext<CR>

" Airline SETTINGS
colorscheme iceberg
let g:airline_theme = 'iceberg'
hi Normal guibg=NONE ctermbg=NONE
let g:airline_powerline_fonts = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1

" NERDTree SETTINGS
hi VertSplit cterm=none
let NERDTreeShowHidden = 1
nmap <C-f> :NERDTreeToggle<CR>
nmap <C-k> <Plug>AirlineSelectPrevTab
nmap <C-j> <Plug>AirlineSelectNextTab
augroup my-glyph-palette
  autocmd! *
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

" GitGutter SETTINGS
set updatetime=250
set signcolumn=yes
let g:gitgutter_highlight_lines = 1
nnoremap gk :GitGutterPrevHunk<CR>
nnoremap gj :GitGutterNextHunk<CR>
nnoremap gh :GitGutterLineHighlightsToggle<CR>
nnoremap gd :GitGutterPreviewHunk<CR>


" fzf SETTINGS
fun! FzfOmniFiles()
  let is_git = system('git status')
  if v:shell_error
    :Files
  else
    :GFiles
  endif
endfun
nnoremap gf :call FzfOmniFiles()<CR>
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\ 'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
\ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 3..'}, 'up:60%')
\ : fzf#vim#with_preview({'options': '--exact --delimiter : --nth 3..'}, 'right:50%:hidden', '?'),
\ <bang>0)
nnoremap <C-g> :Rg<CR>
" Git
nnoremap fr vawy:Rg <C-R>"<CR>
xnoremap fr y:Rg <C-R>"<CR>
nnoremap fb :Buffers<CR>
nnoremap fp :Buffers<CR><CR>
nnoremap fl :BLines<CR>
nnoremap fm :Marks<CR>
nnoremap fh :History<CR>
nnoremap fc :Commits<CR>

" NeoTerm
nnoremap <c-t><c-t> :sp<CR>:Ttoggle<CR> <C-w>R i

" YankRing
let g:yankring_history_dir = '$XDG_STATE_HOME/yankring'

" WSL Clipboard
if !empty($WSL_DISTRO_NAME)
  let s:clip = '/mnt/c/Windows/System32/clip.exe'
  if executable(s:clip)
    augroup WSLYank
      autocmd!
      autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
  endif
  if executable('spzenhan.exe')
    autocmd InsertLeave * :call system('spzenhan.exe 0')
    autocmd CmdlineLeave * :call system('spzenhan.exe 0')
  endif
endif
