set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

syntax on
set hlsearch

set expandtab
set ts=2
set sw=2
set sts=2
"set nobackup
set nowritebackup  " writebackup doesn't keep xattr around
set clipboard=unnamed
set scrolloff=1
set autoread
set breakindent
set showbreak=^^^
set synmaxcol=200
set wildmenu            " visual autocomplete for command menu

" automatically equalize splits when vim is resized
autocmd VimResized * wincmd =

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=80

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" when editing a file, always jump to the last known cursor position.
" don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd bufreadpost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif


set ignorecase smartcase

let g:powerline_pycmd = 'py3'

let g:netrw_dirhistmax = 0


execute pathogen#infect()

if has("gui_running")
    " gVim
    set guioptions-=m
    set guioptions-=T
else

    """ Colorscheme Approximation """
    " This transforms colorschemes to terminal colorschemes
    " The ctermbg=NONE hooks make backgrounds transparent in terminals
                "\ 'highlight SignColumn        ctermbg=NONE',
                "\ 'highlight LineNr            ctermbg=NONE',
    let g:CSApprox_hook_post = [
                \ 'highlight Normal            ctermbg=NONE',
                \ 'highlight SignifyLineDelete cterm=bold ctermbg=NONE ctermfg=red',
                \ 'highlight SignifySignDelete cterm=bold ctermbg=NONE ctermfg=red',
                \ 'highlight SignifyLineAdd    cterm=bold ctermbg=NONE ctermfg=green',
                \ 'highlight SignifyLineChange cterm=bold ctermbg=NONE ctermfg=yellow',
                \ 'highlight SignifySignAdd    cterm=bold ctermbg=NONE ctermfg=green',
                \ 'highlight SignifySignChange cterm=bold ctermbg=NONE ctermfg=yellow',
                \ 'highlight CursorLine        ctermbg=NONE cterm=underline',
                \ 'highlight Folded            ctermbg=NONE cterm=bold',
                \ 'highlight FoldColumn        ctermbg=NONE cterm=bold',
                \ 'highlight NonText           ctermbg=NONE',
                \ 'highlight clear LineNr',
                \
                \ 'highlight LineNr            ctermbg=236'
                \]
endif

"colors twilight
"colors blackboard
"colors skittles_berry
"colors happy_hacking
colors fahrenheit

autocmd FileType javascript,typescript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html,xml,svg noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
autocmd FileType xml noremap <buffer> <c-f> :call HtmlBeautify()<cr>
command FormatJSON %!jq .
autocmd FileType json noremap <buffer>  <c-f> :FormatJSON<cr>

" Remove delay on esc key press
if has('nvim')
else
    set noesckeys
endif
" Other version that does not disable cursor or function keys
"set timeout timeoutlen=1000 ttimeoutlen=100

"nnoremap <C-i> "+po<esc>
"nnoremap <C-i> 0i<C-j><esc>k"+pddp
nnoremap <tab> <esc>o<esc>x"+p
" NVIM v0.7.0 changed how some input keys were synonymed. <C-i> is now <tab>
" from urxvt ?
"inoremap <C-i> <esc>o<esc>x"+p
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt
nnoremap <A-7> 7gt
nnoremap <A-8> 8gt
nnoremap <A-9> 9gt
nnoremap <A-0> 0gt

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tar.gz
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](\.(git|hg|svn|tup|__nimcache__|nimcache)|build|_build|_js|_css|nimcache||node_modules|nope|dist)$',
    \ 'file': '\v\.(exe|so|dll|meta|prefab|asset|png)$',
    \ }
let g:ctrlp_user_command = '/usr/bin/ag -l --ignore "*\.exe" --ignore "*\.so" --ignore "*\.dll" --ignore "*\.meta" --ignore "*\.prefab" --ignore "*\.asset" --ignore "*\.png" --nocolor -g "" %s'


autocmd Filetype pug        setlocal ts=2 sw=2
autocmd Filetype stylus,nim setlocal ts=2 sw=2 sts=2
autocmd Filetype dart,typescript setlocal ts=2 sw=2 sts=2
autocmd! BufNewFile,BufRead *.links setlocal filetype=markdown
autocmd! BufNewFile,BufRead *.mjs   setlocal filetype=javascript
autocmd! BufNewFile,BufRead *.kit   setlocal filetype=html
"autocmd! BufNewFile,BufRead *.links colorscheme slate

" make space execute the 'q' macro (press qq to start recording, q to stop,
" then [space] to execute.  super convenient)
noremap <Space> @q

" in insert mode, ctrl-d and ctrl-t remove and add indentation


" set soft wrapping for lines
" more details here: http://vimcasts.org/episodes/soft-wrapping-text/
set linebreak


" Nimrod
fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf
" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i

let g:nvim_nim_highlighter_enable = 1

" for powerline / airline
"set encoding=utf-8
set laststatus=2
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
"let g:airline_symbols.whitespace='Ξ'
let g:airline_symbols.whitespace='〓'
"let g:airline_symbols.readonly='RO'
let g:airline_symbols.linenr = '¶'
let g:airline#extensions#hunks#non_zero_only = 1

" changing quickly between tab modes
nnoremap \m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
nnoremap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>

" navigate visual lines instead of real ones
"nnoremap j gj
"nnoremap k gk

" previm
let g:previm_open_cmd = 'browser_in_background.sh'
" use :PrevimOpen

set cursorline


" have a grey 1-char column at 80 chars
hi ColorColumn ctermbg=darkgrey guibg=darkgrey
set colorcolumn=81
"set textwidth=80

set nofoldenable

let g:ale_pattern_options = {
\   '\.bundle.js$': {'ale_enabled': 0},
\   '\.min.js$':    {'ale_enabled': 0}
\}
highlight ALEWarning ctermbg=DarkMagenta
highlight ALEError ctermbg=Black

let g:ale_python_flake8_options = '--ignore=E302,E305 --max-line-length=100'

lua << EOF
require("typescript").setup({
    disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = false, -- enable debug logging for commands
    go_to_source_definition = {
        fallback = true, -- fall back to standard LSP definition on failure
    },
    server = { -- pass options to lspconfig's setup method
        --on_attach = ...,
    },
})

local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

nvim_lsp.tsserver.setup {
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" }
}
require("lsp_lines").setup()
vim.diagnostic.config({
virtual_text = false,
})
EOF

" avoid escape key
"inoremap jk <Esc>
"inoremap kj <Esc>
"vnoremap jk <Esc>
"vnoremap kj <Esc>
"cnoremap jk <C-c>
"cnoremap kj <C-c>

" clipboard
map <C-v> "+p
map <C-c> "+y
" Wayland Clipboard Support
xnoremap "+y y:call system("wl-copy", @")<cr>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p

" line shortcuts
nnoremap <C-a> <Home>
cnoremap <C-a> <Home>
vnoremap <C-a> <Home>
nnoremap <C-h> <Home>
"inoremap <C-h> <Home>
vnoremap <C-h> <Home>
nnoremap <C-l> <End>
inoremap <C-l> <End>
vnoremap <C-l> <End>

" window shortcuts
nnoremap <A-h> <C-w>h
nnoremap <A-l> <C-w>l
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k

" tab navigation: Alt or Ctrl+Shift may not work in terminal:
" http://vim.wikia.com/wiki/Alternative_tab_navigation
" Tab navigation like Firefox: only 'open new tab' works in terminal
nnoremap <C-t>     :tabnew<CR>
"inoremap <C-t>     <Esc>:tabnew<CR>
" move to the previous/next tabpage.
nnoremap <C-j> gt
nnoremap <C-k> gT
" Go to last active tab 
au TabLeave * let g:lasttab = tabpagenr()
"nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
"vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>


autocmd! BufNewFile,BufRead *.cs   setlocal expandtab! list colorcolumn=100

" for snappy gitgutter updates
set updatetime=200

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

set autochdir                   " Changes the cwd to the directory of the current
                                " buffer whenever you switch buffers.
set browsedir=current           " Make the file browser always open the current
                                " directory.
