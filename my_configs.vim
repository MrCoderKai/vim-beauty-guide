set nocompatible
" auto load when file is changed
set autoread
" automatically :write before running commands
set autowrite
set magic
" detect file types
filetype on
" syntax highlight
syntax enable
set background=dark
colorscheme solarized
syntax on
" color of activated line
highlight StatusLine guifg=SlateBlue guibg=Yellow
highlight StatusLineNC guifg=Gray guibg=White
" generate swap files when vim exited abnormally
set swapfile
" set save frequency of swap files
set updatetime=2000 " unit: millsecond
set updatecount=200 " unit: character
" enable row & col number showing in status bar
set ruler
" always display the status line
set laststatus=2
" highlight matched brackets
set showmatch
set matchtime=5 " unit: 1/10 second
" ignore case when searching
set ignorecase
" do incremental searching
set incsearch
set autoindent
" set indent for C program
set smartindent
" use C format indent
set cindent
" set lenght of tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" show line number
set number
set numberwidth=5
" display incomplete commands
set showcmd
" need confirmation while exit
set confirm
" file encoding
set fileencodings=utf-8,gb18030,gbk,big5
" make it obvious where 80 characters is
set textwidth=0
set colorcolumn=81
" auto wrap line when characters number is bigger than `textwidth``
" set code fold method
set foldmethod=indent
" disable code fold status at vim startup
set foldlevelstart=99
" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" highlight tabs and trailing spaces
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<
" hightlight current row and column
set cursorcolumn
set cursorline
" beautify current row and column highlight style
" It is a bad configuration when corlor scheme is solarized.
" highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
" highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE

" configurations for vim-indent-guides pulgin
let g:indent_guides_enable_on_vim_startup = 1
set ts=4 sw=4 et
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey


" SOME CONFIGURATION FOR TAGBAR
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
" set the width of tagbar
let g:tagbar_width=30
" set tagbar window is on the left (right default)
let g:tagbar_left=1
" focus on tagbar window when starts (file that vim opened default)
" let g:tagbar_left=1
" auto open tagbar when opening Vim with a supported file/files
autocmd VimEnter * nested :call tagbar#autoopen(1)
" use multiple tabs and want Tagbar to also open in the current tab
" when you switch to an already loaded, supported buffer
autocmd BufEnter * nested :call tagbar#autoopen(0)
" enable auto preview (label moves while curosr moves)
let g:tagbar_autopreview=1
" disable sort tags
let g:tagbar_sort=0
map <F9> :TagbarToggle<CR>

" SOME CONFIGURATIONS FOR TAGLISTS
" let g:Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
" let g:Tlist_Show_One_File = 1
" let g:Tlist_Exit_OnlyWindow = 1
" Open taglist when starts vim
" let Tlist_Auto_Open = 1
" set taglists window width
" let Tlist_WinWidth = 30
" map <silent> <F9> :TlistToggle<cr>

" SOME CONFIGURATIONS FOR NERDTREE PLUGIN
" Open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTree
" Go to previous (last accessed) window
autocmd VimEnter * wincmd p
" Open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')


" SOME CONFIGURATIONS FOR VIM_GUTENTAGS PLUGIN
" gutentags will stop recursively find project marker when found thoese files
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
" the name of tag files
let g:gutentags_ctags_tagfile = '.tags'
" Put all tags files to ~/.cache/tags folder automatically
let s:vim_tags = expand('~/.cache/tags')
" create path ~/.cache/tags when detecting this path does not exist
let g:gutentags_cache_dir = s:vim_tags
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif
" Other ctags parameters
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']


" configurations for YouCompleteMe plugin
" disable those configurations is YouCompleteMe is not installed
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_global_ycm_extra_conf = '/Users/administrator/.vim_runtime/my_plugins/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 1
" automatically close preview window when leaving Insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" When this option is set to 1, YCM's identifier completer will also collect 
" identifiers from tags files. 
let g:ycm_collect_identifiers_from_tags_files = 1
" enable completion in comments and strings
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" When this option is set to 1, YCM's identifier completer will seed its
" identifier database with the keywords of the programming language you're
" writing.
let g:ycm_seed_identifiers_with_syntax = 1
" Mapping keys. The Tab key in other plugins will be disabled without this.
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
" disable diagnostic disaply features
let g:ycm_show_diagnostics_ui = 0
" Press <Enter> to select current item
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
" Go to definition else declaration
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>




map <F4> :call UpdateTitle()<CR>
" Automatically insert file header
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py exec ":call SetTitle()"
" Definition of SetTitle function. Automatically insert file header
func SetTitle()
	" if file type is *.sh
	if &filetype == 'sh' || &filetype == 'python'
		call setline(1, "##########################################################################")
		call append(line("."), "# File Name: ".expand("%"))
		call append(line(".")+1, "# Author: chengkai")
		call append(line(".")+2, "# E-mail: chengkaiupc@163.com")
		call append(line(".")+3, "# Created Time: ".strftime("%m/%d  %H:%M:%S  %Y"))
        call append(line(".")+4, "# Last Modified: ".strftime("%m/%d  %H:%M:%S  %Y"))
        call append(line(".")+5, "# Description: ")
		call append(line(".")+6, "#     > ")
		call append(line(".")+7, "#     > ")
		call append(line(".")+8, "#     > ")
		call append(line(".")+9, "# Co-Author: ")
		call append(line(".")+10, "# Copyright (c) All Rights Reserved")
		call append(line(".")+11, "#########################################################################")
	else
		call setline(1, "/*************************************************************************")
		call append(line("."),    "    > File Name: ".expand("%"))
		call append(line(".")+1,  "    > Author: chengkai")
		call append(line(".")+2,  "    > E-mail: chengkaiupc@163.com")
		call append(line(".")+3,  "    > Created Time: ".strftime("%m/%d  %H:%M:%S  %Y"))
        call append(line(".")+4,  "    > Last Modified: ".strftime("%m/%d  %H:%M:%S  %Y"))
        call append(line(".")+5,  "    > Description: ")
		call append(line(".")+6,  "         > ")
		call append(line(".")+7,  "         > ")
		call append(line(".")+8,  "         > ")
		call append(line(".")+9,  "    > Co-Author: ")
		call append(line(".")+10, "    > Copyright (c) All Rights Reserved")
		call append(line(".")+11, " ************************************************************************/")
	endif
    if &filetype == 'sh'
		call append(line(".")+12, "#!/bin/bash")
		call append(line(".")+13, "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:")
		call append(line(".")+14, "export PATH")
		call append(line(".")+15, "")
		call append(line(".")+16, "")
    endif
    if &filetype == 'python'
        call append(line(".")+12, "#!/usr/bin/python")
        call append(line(".")+13, "# -*- coding: utf8 -*-")
        call append(line(".")+14, "import os")
        call append(line(".")+15, "import sys")
    endif 
	if &filetype == 'cpp'
		call append(line(".")+12, "#include <iostream>")
		call append(line(".")+13, "")
	endif
	if &filetype == 'c'
		call append(line(".")+12, "#include <stdio.h>")
		call append(line(".")+13, "")
	endif
	"	if &filetype == 'java'
	"		call append(line(".")+6,"public class ".expand("%"))
	"		call append(line(".")+7,"")
	"	endif
    " Set cursor to the end of file after creating new file
	autocmd BufNewFile * normal G
endfunc

function UpdateTitle()
    let modifyTimeLine = getline(6)
    if &filetype == 'sh' || &filetype == 'python'
        let newModifyTimeLine = "# Last Modified: ".strftime("%m/%d  %H:%M:%S  %Y")
    else
        let newModifyTimeLine = "    > Last Modified: ".strftime("%m/%d  %H:%M:%S  %Y")
    endif
    let repl = substitute(modifyTimeLine, ".*$", newModifyTimeLine, "g")
    " update last modified time
    let pattern = 'Last\(.*\)Modified'
    let res = match(modifyTimeLine, pattern)
    if res >= 0
        call setline(6, repl)
    endif

    let titleLine = getline(2)
    if &filetype == 'sh' || &filetype == 'python'
        let newTitleLine = "# File Name: ".expand("%")
    else
        let newTitleLine = "    > File Name: ".expand("%")
    endif
    let repl = substitute(titleLine, ".*$", newTitleLine, "g")
    let pattern = 'File\(.*\)Name'
    let res = match(titleLine, pattern)
    " update file name
    if res >= 0
        call setline(2, repl)
    endif
endfunc

