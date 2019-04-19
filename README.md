# vim-beauty-guide
This guide is to make your vim beautiful, and make it easy to use.

**The guide to make your bash beautiful, please refer to [bash-beauty-guide](https://github.com/MrCoderKai/bash-beauty-guide).**

# Contents
- [Screenshots](#screenshots)
- [Configure Files List](#configure-files-list)
- [Environment](#environment)
- [Install and Customize iTerm2](#install-and-customize-iterm2)
- [Install Basic Tools](#install-basic-tools)
    - [Install brew](#install-brew)
    - [Install cmake](#install-cmake)
- [Install Ultimate Vimrc](#install-ultimate-vimrc)
- [Enable Syntax Highlight and Set Background and Colorscheme for Vim](#enable-syntax-highlight-and-set-background-and-colorscheme-for-vim)
- [Install MacVim](#install-macvim)
- [Install YouCompleteMe](#install-youcompleteme)
- [Install vim-indent-guides Plugin](#install-vim-indent-guides-plugin)
- [Install ctags](#install-ctags)
- [Install vim-gutentags Plugin](#install-vim-gutentags-plugin)
- [Install tagbar Plugin](#install-tagbar-plugin)
- [Install cscope](#install-cscope)
- [Install vim-airline Plugin](#install-vim-airline-plugin)
- [Install vim-gitgutter Plugin](#install-vim-gitgutter-plugin)
- [Install vim-multiple-cursors](#install-vim-multiple-cursors-plugin)
- [Install nerdtree-git-plugin](#install-nerdtree-git-plugin)
- [Install NERD Commenter Plugin](#install-nerd-commenter-plugin)
- [Install easymotion Plugin](#install-easymotion-plugin)
- [Functions](#functions)
- [Shortcuts](#shortcuts)
    - [Vim](#vim)
    - [NERD tree](#nerd-tree)
    - [ctags](#ctags)
    - [Code Folder](#code-folder)
    - [Most Recently Used Files](#most-recently-used-files)
    - [Quick Comment and Uncomment](#quick-comment-and-uncomment)
    - [cscope](#cscope)
    - [surround](#surround)
    - [NERD Commenter](#nerd-commenter)
    - [Tabular](#tabular)
    - [repeat](#repeat)
    - [easymotion](#easymotion)

# Screenshots
![Vim with `tagbar` and `NERDTree`](./images/vim_screenshot.png)

![Vim with `cscope`](./images/cscope.png)

# Configure Files List
Describe: There are some other configurations that are not mentioned in this guide. An easy way to configure is move the following configure files to the specific path.

**Note: Even all configure files are provided, you should read this guide carefully.**

1. `.bash_profile`: This file should under path `~/`
2. `.vimrc`: This file should under path `~/`
3. `my_configs.vim`: This file should under path `~/.vim_runtime/`
4. `.ycm_extra_conf.py`: This file should under path `~/.vim_runtime/my_plugins/YouCompleteMe`

# Environment
1. Macbook Pro 2018
2. OS version: macOS Mojave 10.14.4 (18E226)

# Install and Customize [iTerm2](https://www.iterm2.com/)
1. Click [iTerm2 download link](https://www.iterm2.com/) to download iTerm2;
2. Double click downloaded **iTerm2-x_x_x.zip** file to unzip;
3. Double click unziped **iTerm** file, and choose **Move to Applications Folder**.

# Install Basic Tools
## Install **brew**
1. `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
`
## Install **cmake**
1. `brew install cmake`

# Install **Ultimate Vimrc**
1. `git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime`
2. `sh ~/.vim_runtime/install_awesome_vimrc.sh`

# Enable Syntax Highlight and Set Background and Colorscheme for Vim
1. Generally, vim configurations are setted in **~/.vimrc** files. But, a better choice is **~/.vim_runtime/my_configs.vim** after installing **Ultimate Vimrc**.
2. `vim ~/.vim_runtime/my_configs.vim`
3. Add following configurations in **my_configs.vim**:
   ```
   syntax enable
   set background=dark
   colorscheme solarized
   syntax on
   ```
4. Exit vim and restart vim.

Detail usage of **Ultimate Vimrc**, please refer to [Included Plugins and remain sections](https://github.com/amix/vimrc#included-plugins)

# Install **MacVim**
In order to successfully install **YouCompleteMe** plugin, we should install **MacVim** to replace **vim**. Otherwise, the following error would accur:

```
Vim: Caught deadly signal SEGV
Error detected while processing function <SNR>91_PollServerReady[7]...<SNR>91_Pyeval: Vim: Finished.
line   4:
Exception MemoryError: MemoryError() in <module 'threading' from '/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/threading.pyc> ignored [1] .  36295 segmentation fault vim
'
```

This error has been discussed in [issue 3271](https://github.com/Valloric/YouCompleteMe/issues/3271). The conclusion is

> This is not a YCM issue, it's clearly a Vim and/or macOS issue. Using Vim or macVim from homerbew is recommended.

1. Click [MacVim download link](https://macvim-dev.github.io/macvim/) to download **MacVim**;
2. Double click **MacVim.dmg** to install **MacVim**.
3. `/Applications/MacVim.app/Contents/MacOS/Vim ~/.bash_profile`
4. Add following configurations to **~/.bash_profile** to replace **vim** by **MacVim**
```
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias vi='vim'
```
5. The default editor of command `crontab` is `nano`, which would accur the same error, which is talked above. Thus, its editor should be replaced by **MacVim**, too.
6. Add following configurations to **~/.bash_profile** to replace default editor of `crontab` by **MacVim**

```
# set default editor for command `crontab -e`, if not, error accurs
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
```
6. Exit editting **~/.bash_profile** and use `source ~/.bash_profile` to enable those configurations.

# Install **YouCompleteMe**

YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine for [Vim](https://www.vim.org/).
1. `cd ~/.vim_runtime/my_plugins`
2. `git clone https://github.com/Valloric/YouCompleteMe.git`
3. `git submodule update --init --recursive`
4. `cd ~/.vim_runtime/my_plugins/YouCompleteMe`
5. `./install.py --clang-completer`
After installing **YouCompleteMe**, we should create **.ycm_extra_conf.py** file and configure **YouCompleteMe** in **~/.vim_runtime/my_configs.vim** to make **YouCompleteMe** works normally. By default, there is a **.ycm_extra_conf.py** file in the **YouCompleteMe** installation folder - `~/.vim_runtime/my_plugins/YouCompleteMe/`, but it is not a right configuration file for C-family auto completion. Thus, we should create a new **.ycm_extra_conf.py** file for C-family auto completion. The steps are

1. `cd ~/.vim_runtime/my_plugins/YouCompleteMe/`
2. `mv .ycm_extra_conf.py .ycm_extra_conf.py.default`
3. `vim .ycm_extra_conf.py`
4. Copy the content of [this link](https://raw.githubusercontent.com/Valloric/ycmd/66030cd94299114ae316796f3cad181cac8a007c/.ycm_extra_conf.py) to the new **.ycm_extra_conf.py** file. This configuration works well for python and C-family languages, configurations for other languages please refer to [Offical Guides](https://github.com/Valloric/YouCompleteMe#c-family-semantic-completion)
5. Add following configurations to `~/.vim_runtime/my_configs.vim` file

```
" configurations for YouCompleteMe plugin
" disable those configurations is YouCompleteMe is not installed
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_global_ycm_extra_conf = '/Users/administrator/.vim_runtime/my_plugins/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 1
" automatically close preview window when leaving Insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" When this option is set to 1, YCM's identifier completer will also collect-
" identifiers from tags files.-
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
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>"
```

# Install **vim-indent-guides** Plugin
[Indent Guides](https://github.com/nathanaelkane/vim-indent-guides) is a plugin for visually displaying indent levels in Vim.
1. `cd ~/.vim_runtime/my_plugins`
2. `git clone git://github.com/nathanaelkane/vim-indent-guides.git`
3. `vim ~/.vim_runtime/my_configs.vim`
4. Add following configurations to **my_configs.vim**:
```
" configurations for vim-indent-guides pulgin
let g:indent_guides_enable_on_vim_startup = 1
set ts=4 sw=4 et
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey
```

# Install **ctags**
*This section is refered to [ctag.setup](https://gist.github.com/nazgob/1570678)*.

By default, **ctags** is installed on MacOS, but it does not work. For example:

Open termianl, and execute the following commands

`ctags -R --exclude=.git --exclude=log *`

and the output is

```
ctags: illegal option -- R
usage: ctags [-BFadtuwvx] [-f tagsfile] file ...
```
This means, **ctags** can not work correctly. Thus, we should install new **ctags**.

1. `brew install ctags`
2. Add the following configurations into **~/.bash_profile**:
```
#alias ctags if you used homebrew
alias ctags="`brew --prefix`/bin/ctags"
```

Now, **ctags** can be work correctly.

Note:

`ctrl+]` - Go to definition

`ctrl+T` - Go back

# Install vim-gutentags Plugin
[Gutentags](https://github.com/ludovicchabant/vim-gutentags) is a plugin that takes care of the much needed management of tags files in Vim. It will (re)generate tag files as you work while staying completely out of your way. It will even do its best to keep those tag files out of your way too. It has no dependencies and just works.

1. `cd ~/.vim_runtime/my_plugins`
2. `git clone https://github.com/ludovicchabant/vim-gutentags.git`
3. Add following configurations for vim-gutentags in `~/.vim_runtime/my_configs.vim`
```
" SOME CONFIGURATIONS FOR VIM_GUTENTAGA PLUGIN
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
if !isdirectory(s:vim_tags)
    ilent! call mkdir(s:vim_tags, 'p')
endif
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
```

**Explanations**

1. `gutentags_project_root` provides root marker of project. When `gutentags` is enabled, it will find file or folder specified in `gutentags_project_root` recursively. It stops searching util first found file or folder specified in `gutentags_project_root`.
2. `gutentags_ctags_tagfile` and `gutentags_cache_dir` specify the root of tag files and surfix, respectivly. The default name of tag file is a string that concated absolute path by `-`.
3. `gutentags_ctags_extra_args` configrates parameters of tag labels generated by ctags. More please refer to [this article](https://vim.ink/vim-ctag.html#%E4%BA%8C%E3%80%81ctags%E5%8F%82%E6%95%B0%E4%BB%8B%E7%BB%8D).

This section refers to [this article](https://www.cnblogs.com/pengdonglin137/articles/10202606.html).

# Install tagbar Plugin
[Tagbar](https://github.com/majutsushi/tagbar) is a Vim plugin that provides an easy way to browse the tags of the current file and get an overview of its structure.

The step for tagbar plugin installation is as follows:
1. `cd ~/.vim_runtime/my_plugins/`
2. `git clone https://github.com/majutsushi/tagbar.git`
3. Add the following configuration into `~/.vim_runtime/my_configs.vim`
```
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
```

Then, `tagbar` will automatically open when open Vim to edit supported file/files.

Press `<F9>` to toggle `tagbar` window.

# Install cscope
[Cscope](http://cscope.sourceforge.net/) is a developer's tool for browsing source code. It has the following features:
* Allows searching code for:
    * all references to a symbol
    * global definitions
    * functions called by a function
    * functions calling a function
    * text string
    * regular expression pattern
    * a file
    * files including a file
* Curses based (text screen)
* An information database is generated for faster searches and later reference
* The fuzzy parser supports C, but is flexible enough to be useful for C++ and Java, and for use as a generalized 'grep database' (use it to browse large text documents!)
* Has a command line mode for inclusion in scripts or as a backend to a GUI/frontend
Runs on all flavors of Unix, plus most monopoly-controlled operating systems.

The guide to install `cscope`:

1. Download `cscope` source code from [DOWNLOAD LINK](https://sourceforge.net/projects/cscope/files/)
2. Change directory to the folder where you save the downloaded `cscope` source code
3. `./configure`
4. `make`
5. `make install`
6. `cd ~/.vim_runtime/my_plugins`
7. `mkdir -p cscope/plugin`
8. `cd cscope/plugin`
9. `wget http://cscope.sourceforge.net/cscope_maps.vim`
Note: If `wget` is not installed in your MacOS, you can use `brew intall wget` to install.

Now, `cscope` is completely installed in your OS.

Click The [Vim/Cscope Tutorial](http://cscope.sourceforge.net/cscope_vim_tutorial.html) to get official cscope tutorial.

# Install vim-airline Plugin
By default, [ultimate vimrc](https://github.com/amix/vimrc) github repository provides `lightline` plugin to 
beauty vim status line. But I think it isn't beautiful enough. So I uninstall `lightline` plugin and install 
`vim-airline` plugin instead. This guide is as follows:
1. Uninstall `lightline` plugin
```
cd ~/.vim_runtime/
mkdir sources_deprecated
mv sources_non_forked/lightline* sources_deprecated
```
2. Install `vim-airline`
```
cd ~/.vim_runtime/my_plugins
git clone https://github.com/vim-airline/vim-airline.git
```
3. Add the following configuraitons in `~/.vim_runtime/my_configs.vim`
```
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
```

# Install vim-gitgutter Plugin
~~[Vim-gitgutter](https://github.com/airblade/vim-gitgutter) is a Vim plugin 
which shows a git diff in the 'gutter' (sign column). It shows which lines 
have been added, modified, or removed. You can also preview, stage, and undo 
individual hunks. The plugin also provides a hunk text object.~~

~~The guide to install `vim-gitgutter` is as follows:~~

~~1. `cd ~/.vim_runtime/my_plugins`~~

~~2. `git clone git://github.com/airblade/vim-gitgutter.git`~~

`Vim-gitgutter` plugin is installed by default in `Ultimate Vimrc`.

3. Add following configuration in `~/.vim_runtime/my_configs.vim`
```
" SOME CONFIGURATIONS FOR VIM-GITGUTTER
" Turn on gitgutter by default
let g:gitgutter_enabled = 1
" Turn on signs by default
let g:gitgutter_signs = 1
" Run diffs synchronously: 0, asynchronously: 1
let g:gitgutter_async = 0
```

# Install vim-multiple-cursors Plugin
[Vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors) is a vim 
plugin that attempts at bringing Sublime Text's awesome multiple selection 
feature into Vim.

The guid to install `vim-multiple-cursors` is as follows:

1. `cd ~/.vim_runtime/my_plugins/`
2. `git clone https://github.com/terryma/vim-multiple-cursors.git`
3. Add following configurations in `~/.vim_runtime/my_configs.vim`
```
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
```

**Note: This plugin should be used in *Normal* mode at start.**

More usage examples can be found in [Keystrokes for example gifs](https://github.com/terryma/vim-multiple-cursors/wiki/Keystrokes-for-example-gifs).

# Install nerdtree-git-plugin
[Nerdtree-git-plugin](#https://github.com/Xuyuanp/nerdtree-git-plugin) is a 
plugin showing git status flags. Works with the LATEST version of NERDTree.

The guide to install `nerdtree-git-plugin` is as follows:
1. `cd ~/.vim_runtime/my_plugins`
2. `git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git`
3. Add following configurations in `~/.vim_runtime/my_configs.vim`
```
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
```

# Install NERD Commenter Plugin
[NERD Commenter](https://github.com/scrooloose/nerdcommenter) is a plugin that
can comment functions so powerful—no comment necessary.

The guide to insall `NERD Commenter` plugin is as follows:
1. `cd ~/.vim_runtime/my_plugins`
2. `git clone https://github.com/scrooloose/nerdcommenter`
3. Add following configurations in `~/.vim_runtime/my_configs.vim`
```
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
```

# Install easymotion Plugin
[EasyMotion](https://github.com/easymotion/vim-easymotion) provides a much 
simpler way to use some motions in vim. It takes the `<number>` out of `<number>w` 
or `<number>f{char}` by highlighting all possible choices and allowing you to 
press one key to jump directly to the target.

The guide to install `easymotion` plugin is as follows:
1. `cd ~/.vim_runtime/my_plugins`
2. `git clone https://github.com/easymotion/vim-easymotion.git`


# Functions
1. Author information can be automatically added when .sh/.cpp/.c/.py files are 
created.
![Author Information Example](./images/author-information-example.png)

After modification or re-name the file, press `F4` to update modify time and 
file name.

# Shortcuts
Description: The leader of VIM is mapper to `,` in 
`~/.vim_runtime/vimrcs/basic.vim` file.

## VIM
Those shortcuts can be found in`~/.vim_runtime/vimrcs/*.vim` files.

1. `,+w`         - Fast saving
2. `,+g`         - Open Ack and put the cursor in the right position
3. `"+p`         - Paste system clipboard
4. `"*p`         - Paste system buffer
5. `f+character` - Find the specific `character` **f**orward
6. `F+character` - Find the specific `character` backward
7. `vi}`         - enable Visual mode, and select inner Brace


## NERD tree
1. `,+nn` - Toggle NERD tree
2. `,+nb` - NERD tree from bookmark
3. `,+nf` - NERD tree find

## ctags
1. `Ctrl+]` - Go to definition
2. `Ctrl+T` - Go back

## Code Folder
1. `zo` - Open code folder
2. `zO` - Open all code folders
3. `zc` - Close code folder
4. `zC` - Close all code folders

## Most Recently Used Files
1. `,+f` - Open most recently used files list

## Quick Comment and Uncomment
1. `gc`   - (Un) - Comment out a line (takes a count)
2. `gcap` - (Un) - Comment out A Paragraph

## cscope
1. `Ctrl+\+s` - Open a menu at the bottom of your Vim window showing you all the
uses of the symbol, which the curosr, is over in the program.
2. `Ctrl+t` - Jump back to your original location before the search (and you can
nest searches and `Ctrl+t` will unwind them one at a time).

**Mnemonic: the `\` key is right next to the `]` key, which is used for ctags 
searches.**

## surround
It's easiest to explain with examples.

In **NORMAL** mode:

Press `cs"'` **WHEN cursor is on `"` character**
```
"Hello world!"
```
to change it into
```
'Hello world!'
```
Now press `cs'<q>` to change it to
```
<q>Hello world!</q>
```
To go full circle, press `cst"` to get
```
"Hello world!"
```
To remove the delimiters entirely, press `ds"`
```
Hello world!
```
Now with the cursor on "Hello", press `ysiw]` (`iw` is a text object).
```
[Hello] world!
```
Let's make that braces and add some space (use `}` instead of `{` for no space): `cs]{`
```
{ Hello } world!
```
Now wrap the entire line in parentheses with `yssb` or `yss)`.
```
({ Hello } world!)
```
Revert to the original text: `ds{ds)`
```
Hello world!
```
Emphasize hello: `ysiw<em>`
```
<em>Hello</em> world!
```
Finally, let's try out visual mode. Press a capital V (for linewise visual mode) 
followed by `S<p class="important">`.
```
<p class="important">
  <em>Hello</em> world!
</p>
```

This plugin is very powerful for HTML and XML editing, a niche which currently 
seems underfilled in Vim land. (As opposed to HTML/XML inserting, for which many 
plugins are available). Adding, changing, and removing pairs of tags 
simultaneously is a breeze.

## NERD Commenter
The following key mappings are provided by default (there is also a menu 
provided that contains menu items corresponding to all the below mappings):

Most of the following mappings are for normal/visual mode only. 
The **|NERDComInsertComment|** mapping is for insert mode only.

1. `[count]<leader>cc` **|NERDComComment|**

Comment out the current line or text selected in visual mode.

2. `[count]<leader>cn` **|NERDComNestedComment|**

Same as `cc` but forces nesting.

3. `[count]<leader>c<space>` **|NERDComToggleComment|**

Toggles the comment state of the selected line(s). If the topmost selected line 
is commented, all selected lines are uncommented and vice versa.

4. `[count]<leader>cm` **|NERDComMinimalComment|**

Comments the given lines using only one set of multipart delimiters.

5. `[count]<leader>ci` **|NERDComInvertComment|**

Toggles the comment state of the selected line(s) individually.

6. `[count]<leader>cs` **|NERDComSexyComment|**

Comments out the selected lines with a pretty block formatted layout.

7. `[count]<leader>cy` **|NERDComYankComment|**

Same as `cc` except that the commented line(s) are yanked first.

8. `<leader>c$` **|NERDComEOLComment|**

Comments the current line from the cursor to the end of line.

9. `<leader>cA` **|NERDComAppendComment|**

Adds comment delimiters to the end of line and goes into insert mode between them.

10. **|NERDComInsertComment|**

Adds comment delimiters at the current cursor position and inserts between. 
Disabled by default.

11. `<leader>ca` **|NERDComAltDelim|**

Switches to the alternative set of delimiters.

12. `[count]<leader>cl`

`[count]<leader>cb` **|NERDComAlignedComment|**

Same as **|NERDComComment|** except that the delimiters are aligned down the 
left side (`<leader>cl`) or both sides (`<leader>cb`).

13. `[count]<leader>cu` **|NERDComUncommentLine|**

Uncomments the selected line(s).

## Tabular
1. `:Tabularize /,` - Line these lines at the commas.

`Tabular` tutorial can be found [here](http://vimcasts.org/episodes/aligning-text-with-tabular-vim/).

`Tabular` document can be found [here](https://raw.githubusercontent.com/godlygeek/tabular/master/doc/Tabular.txt).

## repeat
1. `.` - Use `.` to repeat last operation.

## easymotion
1. `<leader><leader>w` - To trigger the word motion `w`. When the motion is 
triggered, the text is updated (no braces are actually added, the text is 
highlighted in red by default):
2. `<leader><leader>f<character>` - Search the specific `<character>` forwards.
3. `<leader><leader>s<character>` - Search the specific `<character>` backwards.

