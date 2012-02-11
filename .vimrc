" Keymaps
map ,w :w<CR> 

" Misc
call pathogen#infect()
set directory=~/.vim/swap,. " Swap file behavior. Check home swap dir, then current directory
filetype plugin indent on
set matchpairs+=<:>
set clipboard=unnamedplus,autoselect " Use + register (X Window clipboard) as unnamed register
set ruler

" Text settings
set ai     " automatic indent
set si     " smart indent
set ts=4   " tab space
set ss=4   
set sw=4   
set siso=4 
set nowrap 
set expandtab 
set softtabstop=4 " Make the spaces feel like real tabs

" Tabline
:hi TabLine ctermfg=White ctermbg=Black
:hi TabLineSel ctermfg=Red ctermbg=Blue

" Tag files
:set tags=$WRTMC/.tags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Syntax hilighting
set number " Enables line numbers
set t_Co=256 " 256 Color mode
syntax on
colorscheme wombat256

" Persistent undo
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" ETC "
nnoremap ,jc :JumpToCSS<CR>
let g:jumptocss_autoclose = 1

" taglist options
let tlist_php_settings = 'php;c:class;f:function;d:constant' " set the names of flags
let Tlist_File_Fold_Auto_Close = 1 " close all folds except for current file
let Tlist_GainFocus_On_ToggleOpen = 1 " make tlist pane active when opened
let Tlist_WinWidth = 40 " width of window
let Tlist_Close_On_Select = 1 " close tlist when a selection is made

" Shortcuts for moving between tabs.
noremap <A-j> gT " Alt-j to move to the tab to the left
noremap <A-k> gt</A-k></A-j> " Alt-k to move to the tab to the right

vnoremap <silent>,w <ESC>:call VisualTagsWrap()<CR>

"map <F2> :mksession! ~/.vim_session <cr>
"map <F5> :source ~/.vim_session <cr>

map <F2> :NERDTreeToggle<CR>

:filetype plugin on 

    function! VisualTagsWrap()
        if !exists('g:tags_to_wrap')
            let g:tags_to_wrap=[]
        endif
        let g:tags_to_wrap=split(input('space separated tags to wrap block: ', join(g:tags_to_wrap, ' ')), '\s\+')
        if len(g:tags_to_wrap)>0
            execute 'normal! `>a</'.join(reverse(g:tags_to_wrap), '></').'>'
            execute 'normal! `<i<'.join(reverse(g:tags_to_wrap), '><').'>'
        endif
    endfunction
