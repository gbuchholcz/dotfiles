" Use spaces instead of tabs
set expandtab        " Converts tabs to spaces
set shiftwidth=4     " Number of spaces to use for each step of (auto)indent
set softtabstop=4    " Number of spaces a <Tab> feels like when editing
set tabstop=4        " Number of spaces that a <Tab> in the file counts for

" Don't create backup or swap files
set nobackup         " Don't create a backup file
set nowritebackup    " Don't create a backup before overwriting a file
set noswapfile       " Don't use a swap file

" Show absolute line numbers
set number           " Show line numbers

" Allow arrow keys in NORMAL mode (default behavior, but just in case)
" No remapping of arrow keys
" You only need to ensure nothing is overriding them:
noremap <Up> <Up>
noremap <Down> <Down>
noremap <Left> <Left>
noremap <Right> <Right>

" Optional: some quality of life improvements
syntax on            " Enable syntax highlighting
set showcmd          " Show (partial) command in the last line of the screen
set cursorline       " Highlight the current line
set encoding=utf-8   " Set UTF-8 encoding

nnoremap <C-e> :Explore<CR>

let g:netrw_banner = 0           " Disable the annoying banner
let g:netrw_liststyle = 3        " Tree-style listing
let g:netrw_browse_split = 0     " Open files in the same window
let g:netrw_altv = 1             " Open splits to the right
let g:netrw_winsize = 25         " Width of the file browser window

" Make Tab cycle to next buffer
nnoremap <Tab> :bnext<CR>
" Make Shift-Tab cycle to previous buffer
nnoremap <S-Tab> :bprevious<CR>

" Always show the statusline
set laststatus=2

" Custom function to show full mode name
function! ModeName()
  let l:mode_map = {
        \ 'n': 'NORMAL',
        \ 'i': 'INSERT',
        \ 'v': 'VISUAL',
        \ 'V': 'V-LINE',
        \ "\<C-v>": 'V-BLOCK',
        \ 'c': 'COMMAND',
        \ 't': 'TERMINAL',
        \ 'R': 'REPLACE',
        \ }
  return get(l:mode_map, mode(), 'OTHER')
endfunction

" Set the custom statusline
set statusline=
set statusline+=%f                       " File name (relative path)
set statusline+=%m                       " Modified flag [+] if unsaved
set statusline+=\ [%{ModeName()}]       " Current mode
set statusline+=\ [%{&filetype}]         " Filetype
set statusline+=%=%l:%c\ [%p%%]          " Line:Col [percentage through file]

