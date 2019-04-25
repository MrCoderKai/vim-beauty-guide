set nocompatible
" auto load when file is changed
set autoread
" automatically :write before running commands
set autowrite
set magic
" detect file types
filetype on
filetype plugin indent on
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
" show line number
set numberwidth=4
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
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l
" Quicker break into new line after cursor in NORMAL mode
nnoremap K a<CR><Esc>
" Quicker clean highlight after searching
nnoremap <silent> <S-L> :nohlsearch<CR>
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

" Set the appearance of border between vsplit windows
hi VertSplit ctermbg=black
hi VertSplit ctermfg=darkgrey
set fillchars+=vert:\│,stl:\ ,stlnc:\ 

" SOME CONFIGURATIONS FOR VIM_AIRLINE
set t_Co=256
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '>'
let g:airline#extensions#tabline#right_sep = '<'
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_exclude_filetypes=['netrw', 'diff', 'undotree', 'gundo', 'tagbar']
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" SOME CONFIGURATIONS FOR VIM-GITGUTTER
" Turn on gitgutter by default
let g:gitgutter_enabled = 1
" Turn on signs by default
let g:gitgutter_signs = 1
" Run diffs synchronously: 0, asynchronously: 1
let g:gitgutter_async = 0


" SOME CONFIGURATION FOR VIM-MULTIPLE-CURSORS
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" SOME CONFIGURATION FOR TAGBAR
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
" set the width of tagbar
let g:tagbar_width=31
" set tagbar window is on the left (right default)
let g:tagbar_left=1
" Whether line numbers should be shown in the Tagbar window.
" Possible values are:
"   0: Don't show any line numbers.
"   1: Show absolute line numbers.
"   2: Show relative line numbers.
"  -1: Use the global line number settings.
let g:tagbar_show_linenumbers = 1
" Display of the icons used to indicate open or closed folds
let g:tagbar_iconchars = ['▸', '▾']
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
map <silent> <F9> :TagbarToggle<CR>


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
" Toggle NERDTree. It has ben mapped into <leader>nn, so comment here.
" map <leader>t :NERDTreeToggle<CR>
" show line number
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" show hidden files
let NERDTreeShowHidden=0
" set NERDTree window width
let NERDTreeWinSize=31
let NERDTreeWinSizeMax=31
" Share NERDTree when starts vim from terminal
let g:nerdtree_tabs_open_on_console_startup=1
" Ignore the following files
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" show book marks
let NERDTreeShowBookmarks=1
let NERDTreeMouseMode=1
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
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
" disable diagnostic disaply features
let g:ycm_show_diagnostics_ui = 0
" Press <Enter> to select current item
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
" Go to definition else declaration
nnoremap <c-d> :YcmCompleter GoToDefinitionElseDeclaration<CR>


autocmd BufWrite *.tex exec ":call UpdateTitle()"
" autocmd BufWriteCmd *.tex exec ":call UpdateTitle()"

map <F4> :call UpdateTitle()<CR>
" Automatically insert file header
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py,*.tex exec ":call SetTitle()"
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
    endif
    if &filetype == 'tex'
		call setline(1,           "%!TEX program = xelatex")
		call append(line("."),    "%!TEX encoding = UTF-8 Unicode")
		call append(line(".")+1, "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
		call append(line(".")+2,  "% File Name: ".expand("%"))
		call append(line(".")+3,  "% Author: chengkai")
		call append(line(".")+4,  "% E-mail: chengkaiupc@163.com")
		call append(line(".")+5,  "% Created Time: ".strftime("%m/%d  %H:%M:%S  %Y"))
        call append(line(".")+6,  "% Last Modified: ".strftime("%m/%d  %H:%M:%S  %Y"))
        call append(line(".")+7,  "% Description: ")
		call append(line(".")+8,  "%     > ")
		call append(line(".")+9,  "%     > ")
		call append(line(".")+10, "%     > ")
		call append(line(".")+11, "% Co-Author: ")
		call append(line(".")+12, "% Copyright (c) All Rights Reserved")
		call append(line(".")+13, "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
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
    if &filetype == 'tex'
        call append(line(".")+14, "")
    endif
	"	if &filetype == 'java'
	"		call append(line(".")+6,"public class ".expand("%"))
	"		call append(line(".")+7,"")
	"	endif
    " Set cursor to the end of file after creating new file
	autocmd BufNewFile * normal G
endfunc

function UpdateTitle()
    if &filetype == "tex"
        let modifyTimeLine = getline(8)
    else
        let modifyTimeLine = getline(6)
    endif
    if &filetype == 'sh' || &filetype == 'python'
        let newModifyTimeLine = "# Last Modified: ".strftime("%m/%d  %H:%M:%S  %Y")
    elseif &filetype == 'tex'
        let newModifyTimeLine = "% Last Modified: ".strftime("%m/%d  %H:%M:%S  %Y")
    else
        let newModifyTimeLine = "    > Last Modified: ".strftime("%m/%d  %H:%M:%S  %Y")
    endif
    let repl = substitute(modifyTimeLine, ".*$", newModifyTimeLine, "g")
    " update last modified time
    let pattern = 'Last\(.*\)Modified'
    let res = match(modifyTimeLine, pattern)
    if res >= 0
        if &filetype == "tex"
            call setline(8, repl)
        else
            call setline(6, repl)
        endif
    endif

    if &filetype == "tex"
        let titleLine = getline(4)
    else
        let titleLine = getline(2)
    endif
    if &filetype == 'sh' || &filetype == 'python'
        let newTitleLine = "# File Name: ".expand("%")
    elseif &filetype == 'tex'
        let newTitleLine = "% File Name: ".expand("%")
    else
        let newTitleLine = "    > File Name: ".expand("%")
    endif
    let repl = substitute(titleLine, ".*$", newTitleLine, "g")
    let pattern = 'File\(.*\)Name'
    let res = match(titleLine, pattern)
    " update file name
    if res >= 0
        if &filetype == "tex"
            call setline(4, repl)
        else
            call setline(2, repl)
        endif
    endif
endfunc

" SOME CONFIGURATIONS FOR NERDTREE-GIT-PLUGIN
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" SOME CONFIGURATIONS FOR NERD-COMMENTER
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


" SOME CONFIGURATIONS FOR INDENTLINE PLUGIN
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" to make it compatible between INDENTLINE plugin and concealcurosr feature of
" VIM_MARKDOWN plugin
let g:indentLine_concealcursor = ''
" indentLine will overwrite 'conceal' color with grey by default. If you want
" to highlight conceal color with your colorscheme, disable by:
let g:indentLine_setColors = 0

" Add support for markdown files in tagbar.
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : '~/.vim_runtime/my_plugins/markdown2ctags/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes --sro=»',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '»',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }

" SOME CONFIGURATIONS FOR ECHODOC PLUGIN
" enable echodoc plugin at vim startup
let g:echodoc#enable_at_startup=1
" do not show mode
set noshowmode

" SOME CONFIGURATIONS FOR TABULAR PLUGIN
nnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a: :Tabularize /:<CR>
nnoremap <Leader>a:: :Tabularize /:\zs<CR>
nnoremap <Leader>a, :Tabularize /,<CR>
nnoremap <Leader>a- :Tabularize /-<CR>

" SOME CONFIGURATIONS FOR VIMTEX PLUGIN
let g:tex_flavor="latex"
" Enable vimtex plugin by default
let g:vimtex_enabled=1
let g:vimtex_view_automatic=1
" Start server at vim startup
if empty(v:servername) && exists('*remote_startserver')
    call remote_startserver('VIM')
endif
" Set compiler method for tex file
let g:vimtex_compiler_method="latexmk"
" Set view method for PDF
let g:vimtex_view_method="mupdf"
let g:vimtex_quickfix_mode=0
set conceallevel=2
" set concealcursor=nvic
let g:tex_conceal="abdmgs"
let g:vimtex_latexmk_options='-pdf -pdflatex=\"xelatex -synctex=1 %S %O\" -verbose -file-line-error -interaction=nonstopmode'

" SOME CONFIGURATIONS FOR ULTISNIPS
" Trigger configuration. Do not use <tab> 
" if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

set mouse=a
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>

let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_impulse_multiplier = 1  " Feel free to increase/decrease this value.
let g:comfortable_motion_friction = 80.0
let g:comfortable_motion_air_drag = 2.0
nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
nnoremap <silent> <C-f> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 4)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -4)<CR>
