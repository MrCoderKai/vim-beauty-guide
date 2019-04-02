# vim-beauty-guide
This guide is to make your vim beautiful, and make it easy to use.

# Contents

# Configer Files List
1. .bash_profile: This file should under path `~/`
2. my_configs.vim: This file should under path `~/.vim_runtime/`
3. .ycm_extra_conf.py This file should under path `~/.vim_runtime/my_plugins/YouCompleteMe`

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

# Enable Syntax Highlight, and Set Background and Colorscheme for Vim
1. Generally, vim configrations are setted in **~/.vimrc** files. But, a better choice is **~/.vim_runtime/my_configs.vim** after installing **Ultimate Vimrc**.
2. `vim ~/.vim_runtime/my_configs.vim`
3. Add following configrations in **my_config.vim**:
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
>> This is not a YCM issue, it's clearly a Vim and/or macOS issue. Using Vim or macVim from homerbew is recommended.
1. Click [MacVim download link](https://macvim-dev.github.io/macvim/) to download MacVim;
2. Double click **MacVim.dmg** to install **MacVim**.
3. Add following configrations to **~/.bash_profile** to replace **vim** by **MacVim**
```
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias vi='vim'
```
4. The default editor of command `crontab` is `nano`, which would accur the same error, which is talked above. Thus, its editor should be replaced by **MacVim**, too.
5. Add following configrations to **~/.bash_profile** to replace default editor of `crontab` by **MacVim**
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
After installing **YouCompleteMe**, we should create **.ycm_extra_conf.py** file and configure **YouCompleteMe** in **~/.vim_runtime/my_configs.vim** to make **YouCompleteMe** works normally. By default, there is a **.ycm_extra_conf.py** file in the **YouCompleteMe** installation folder - `~/.vim_runtime/my_plugins/YouCompleteMe/`, but it is not a right configration file for C-family auto completion. Thus, we should create a new **.ycm_extra_conf.py** file for C-family auto completion. The steps are
1. `cd ~/.vim_runtime/my_plugins/YouCompleteMe/`
2. `mv .ycm_extra_conf.py .ycm_extra_conf.py.default`
3. `vim .ycm_extra_conf.py`
4. Copy the content of [this link](https://raw.githubusercontent.com/Valloric/ycmd/66030cd94299114ae316796f3cad181cac8a007c/.ycm_extra_conf.py) to the new **.ycm_extra_conf.py** file. This configration works well for python and C-family languages, configrations for other languages please refer to [Offical Guides](https://github.com/Valloric/YouCompleteMe#c-family-semantic-completion)
5. Add following configrations to `~/.vim_runtime/my_configs.vim` file
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

