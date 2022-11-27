:set title							" adds title to the nvim window

:set undofile						" adds undo action even after exit

:set number							" add line numbers
:set relativenumber					" add relative line numbers

:set list listchars=nbsp:¬,tab:··,trail:·,extends:>
" sets whitespaces as »·
:set wrap							" enables text wrap in opened files
:set tabstop=4						" number of column occupied by a tab
:set softtabstop=4					" uses mix of spaces and tabs
:set shiftwidth=4					" width for autoindents
:set autoindent						" enable autoindent
:set smartindent
:set textwidth=79					" text wrap width
:set colorcolumn=80					" sets color when beyond 80 characters mark
:highlight ColorColumn ctermbg=9
" sets color to bright red at colorcolumn number
":set expandtab						" converts tab to whitespace

:set mouse=v						" middle-click paste with
:set mouse=a						" active mouse click

:set hlsearch						" (hls) highlight search
:set incsearch						" (is) include words containing search term
:set ignorecase						" (ic) case insenstive search
:set smartcase

:set clipboard=unnamedplus			" use system clipboard
:set cursorline						" highlight current cursorline

:set guifont=JetBrains\ Mono:h10
" set font to JetBrains Mono, a open sorce font

:set splitright						" set new window to split to right
:set splitbelow						" set new window to split to below

:syntax on							" syntax highlighting

" enable color themes
if !has('gui_running')
	set t_Co=256
endif
" enable color support
:set termguicolors
:colorscheme nord
" set colorscheme to industry/murphy/pablo/torte/nord
" You can also add other themes (like nord) by searching for themes for 
" vim, github for their vim file... and then putting the vim file in the
" ~\AppData\Local\nvim\colors and you can search for them in nvim now.
" Here,	~:`\User\Username` folder in Windows or `/home` in Linux.
" 
" The default plugins and themes and all other things are stored in "C:/Program
" Files/Neovim/share/nvim/runtime/"

let s:fontsize = 12
function! AdjustFontSize(amount)
	let s:fontsize = s:fontsize+a:amount
	:execute "GuiFont! JetBrains Mono:h" . s:fontsize
endfunction

noremap <C-ScrollWheelUp>:call AdjustFontSize(1)<CR>
" increase adjust font size in normal mode
noremap <C-ScrollWheelDown>:call AdjustFontSize(-1)<CR>
" decrease font size in normal mode
noremap <C-b> <Esc>:Lex <CR>:vertical resize 30<CR>
" Lex, vim's pre-built nerdTree type file explorer normal mode
inoremap <C-p> <Esc>:call AdjustFontSize(1)<CR>
" increase adjust font size in insert mode
inoremap <C-l> <Esc>:call AdjustFontSize(-1)<CR>
" decrease font size insert mode
inoremap <C-b> <Esc>:Lex <CR>:vertical resize 30<CR>
" Lex, vim's pre-built nerdTree type file explorer insert mode

:set spell							" enable spellcheck
map <F8> :setlocal spell! spelllang=en<CR>
" sets spellchecking with F8 key and runs with `z=` when cursor above word

nnoremap <silent> <F5> :%s/\s\+$//<CR>
" remove trailing whitespace in a file

inoremap <C-BS> <C-w>
" changes the default ctrl-w to delete last word the ctrl-backspace

" How to do 90% of What Plugins Do(With Just Vim)-YouTube Video by `thoughtbot`
" 1. Search down into subfolders
"		Provides file completion for all file related tasks
:set path+=**
"		Display all matching files when we tab complete
:set wildmenu
"		Now to use this...
"		use	`:find` and use fuzzy logic by using `*`.
"
" 2. AutoComplete (documemted in |ins-completion|)
"		Highlights:
"			^x^n for just this file
"			^x^f for filenames
"			^x^] for tags only
"			^n	 for anything specified by completion option
"			TIP: Use ^n and ^p to go back and forth in suggestions list.
"
" 3. File Browsing
let g:netrw_banner=0			" disable annoying banner
let g:netrw_browse_split=4		" open in prior window
let g:netrw_altv=1				" open splits to the right
let g:netrw_liststyle=3			" tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
"		Highlights:
"			:edit a folder to open a file browser
"			<CR>/v/t to open in a h-split/v-split/tab
"			check |netrw-browse-maps| for more mappings
"
" 4. Snippets
" Read an empty HTML snippet template and move cursor to the title
nnoremap ,html :-1read ~\AppData\Local\nvim\snippets\skeleton.html<CR>4jf>a
" It forwards the `,html` typed to run the following command `:-1read
" ~\Appdata\Local\nvim\snippets\.skeleton.html (this is where the snippet of
" the html file is stored, -1 is there so that the cursor does not change its
" position during the reading process), then does `<CR>` which means that it
" executes the command by pressing carriage return or enter. The final 4jf>a is
" a carefully designed normal mode command to position the cursor directly in
" the title of the html snippet.
"
nnoremap <C-t> :sp<CR>:terminal<CR>:resize\ -10<CR><C-w>k
" Note: If there is space between `<CR>` and `<C-w>w` command, it does not do
" the specified operation...
" TIP: Try to avoid spaces in VIM remaps.
" 
" Run this terminal command automatically with netrw...
autocmd VimEnter * :exe "normal \<C-b>\<C-w>w\<C-t>"
