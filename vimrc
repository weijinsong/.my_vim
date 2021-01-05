" Author:  @weijinsong <vitus.wei@outlook.com> 
" Last change:	2020 Jun 23
"
" When started as "evim", evim.vim will already have done these settings.
" 

if has('nvim')
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
        silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs 
                            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
    endif
else 
    if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
                            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
    endif
endif

if v:progname =~? "evim"
  finish
endif
set nocompatible
set backspace=indent,eol,start

set history=500
set ruler
set showcmd	
set incsearch	
map Q gq
inoremap <C-U> <C-G>u<C-U>

if has('mouse')
  set mouse=a
endif

if has("autocmd")
  filetype plugin indent on
  augroup vimrcEx
  au!
  autocmd FileType text setlocal textwidth=78
  autocmd BufReadPost *
              \ if line("'\"") > 1 && line("'\"") <= line("$") |
              \   exe "normal! g`\"" |
              \ endif
  augroup END
else
  set autoindent
endif " has("autocmd")

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  set langnoremap
endif

"===============
"=== Setup ====
"===
set ts=4
set cursorline
set cursorcolumn
" set smartindent
set autoindent
set shiftwidth=4
set expandtab
set number
set hlsearch
autocmd BufEnter * lcd %:p:h
" set wrap!
set nocp
set tags=tags
set scrolloff=4
set tw=0
" set foldmethod=indent
set splitright
" set splitbelow
set showcmd
set noshowmode
set laststatus=2
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast
set lazyredraw
set visualbell
set updatetime=1000
set virtualedit=block
set nobackup
set undofile
set swapfile
set undodir=~/.undodir

set encoding=utf-8 fileencodings=ucs-bom,utf-8,gbk,gb18030,latin1 termencoding=utf-8

if has('nvim')
    set clipboard+=unnamedplus
endif

"===
"=== Terminal Behaviors
"===
if has('nvim')
    let g:neoterm_autoscroll=1
    autocmd TermOpen term://* startinsert
    command! Term  :set splitbelow |split |res -40 |term
    command! Vterm :set splitright |vsplit |term
end
tnoremap <ESC> <c-\><c-n>

"===
"=== Basic Mappings 
let mapleader="\\"
noremap <leader>rcc :tabe ~/.vimrc<CR>
noremap <leader>rcs :source ~/.vimrc<CR>

"===
"=== Window management
"===
noremap <leader>w <C-w>w
noremap <leader>wk <C-w>k
noremap <leader>wj <C-w>j
noremap <leader>wh <C-w>h
noremap <leader>wl <C-w>l
noremap <leader>w1 <C-w>1w
noremap <leader>w2 <C-w>2w
noremap <leader>w3 <C-w>3w
noremap <leader>w4 <C-w>4w

"=== Resize splits with arrow keys
noremap <up> : res +2<CR>
noremap <down> :res -2<CR>
noremap <left> :vertical resize -2<CR>
noremap <right> :vertical resize +2<CR>

"=== 
"=== Tab management
"===
noremap tu :tabe
noremap tj :-tabnext<CR>
noremap tk :+tabnext<CR>
noremap <F3> :-tabnext<CR>
noremap <F4> :+tabnext<CR>
" noremap Tmn :-tabmove<CR>
" noremap TmN :+tabmove<CR>

"=== find and replace
noremap \s :s//g<left><left>

"=== Insert right bracket
" imap{ {}<ESC>i<CR><ESC>O
" imap{ {}<ESC>i

"=== wildmenu 
cnoremap <Left> <Space><BS><Left>
cnoremap <Right> <Space><BS><Right>
cnoremap <C-H> <Up>
cnoremap <C-L> <C-Y>
cnoremap <C-K> <C-P>
cnoremap <C-J> <C-N>

"========================
"=== Install Vim-Plug ===
"===
if has('nvim')
    call plug#begin('~/.config/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
endif

Plug 'dense-analysis/ale'

" General Highlighter
" Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase'}
Plug 'RRethy/vim-illuminate'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tomasiser/vim-code-dark'

" Navigation
Plug 'preservim/nerdtree'
" Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'
Plug 'airblade/vim-rooter'
Plug 'pechorin/any-jump.vim'
" Plug 'Yggdroot/LeaderF', {'do': './install.sh'}
Plug 'Yggdroot/LeaderF'

" Taglist
Plug 'liuchengxu/vista.vim'

" Debuger
Plug 'puremourning/vimspector', {'do': '.install_gadget.py --enable-c --enable-python --enable-go'}

" Auto Complete
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" Plug 'wellle/tmux-complete.vim'

" Snippets
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" Undo Tree
Plug 'mbbill/undotree'

" Autoformat
" Plug 'Chie192/vim-autoformat'

" verilog_systemverilog
Plug 'vhda/verilog_systemverilog.vim'

" Tex
" Plug 'lervag/vimtex'
Plug 'lervag/vimtex'

" JSON
" Plug 'elzr/vim-json'

" Markdown
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'dhruvasagar/vim-table-mode', {'on': 'TableModeToggle', 'for':['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', {'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'

" Bookmarks
Plug 'MattesGroeger/vim-bookmarks'

" Find & Replace
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }

" Vim Applications
Plug 'itchyny/calendar.vim'

" Editor  Enhancement
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi'
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'
Plug 'godlygeek/tabular'
Plug 'preservim/nerdcommenter'

" Other visual enhancement
Plug 'ryanoasis/vim-devicons'
Plug 'luochen1990/rainbow'
" Plug 'mg979/vim-xtabline'
Plug 'wincent/terminus'
Plug 'nightsense/carbonized'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'liuchengxu/space-vim-dark'
Plug 'vim-scripts/sudo.vim'


call plug#end()

" === 
" === Set colorscheme
" ===
" let g:codedark_conservative = 0
" colorscheme codedark
syntax on
set t_Co=256
" set background=dark
set termguicolors

" carbonized 
colorscheme carbonized-dark

let g:lightline= {
  \ 'colorscheme': 'codedark',
  \ }
let g:carbonized_dark_CursorLineNr = 'on'
let g:carbonized_dark_LineNr = 'off'


" colorscheme deep-space

" colorscheme codedark

" space-vim-dar
" colorscheme space-vim-dark
" hi Comment cterm=italic
" hi Normal ctermbg=NONE guibg=NONE
" hi Identifier ctermfg=NONE

" ===
" === vim-airline
" ===
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 1

" ===
" === Nerdtree 
" ===
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeMapActivateNode = 'l'
let g:NERDTreeShowHidden=1

"===
"=== LeaderF
"===
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
if has('nvim')
    let g:Lf_WindowPosition = 'popup'
    let g:Lf_PreviewInPopup = 1
    let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
    let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
else
    let g:Lf_WindowPosition = 'left'
    " let g:Lf_PreviewInPopup = 1
    let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
    let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
endif

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
xnoremap <leader>fgf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap <leader>fgo :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
noremap <leader>fgu :Leaderf gtags --update<CR>
let g:Lf_GtagsAutoGenerate = 1
" let g:Lf_Gtagslabel = 'default'
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
" let g:Lf_CommandMap = {'<C-K>': ['<Up>']
"                    \ , '<C-J>': ['<Down>']
"                    \ , '<C-X>': ['<C-I>']
"                    \ , '<C-]>': ['<C-O>']}
let g:Lf_CommandMap = {'<C-X>': ['<C-I>']
                   \ , '<C-]>': ['<C-O>']}


"===
"=== vim-cpp-enhanced-highlight 
"===
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
" let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
"let g:cpp_no_function_highlight = 1
let c_no_curly_error=1

"===
"=== nerdcomment
"===
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '**/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

"===
"=== ale
"===
let g:ale_set_loclist = 0
let g:ale_set_qucikfix = 1
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 1
let g:ale_list_window_size = 5
" let g:ale_linters_explicit = 1
" let g:ale_completion_delay = 0
" let g:ale_echo_delay = 0
" let g:ale_lint_delay = 0
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 1
let g:airline#extensions#ale#enabled = 0
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_ech_msg_format = '[%linter%] %s [%severity%]'

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta

let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
nmap <silent> <C-k> <Plug>(ale_previous_warp)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <leader>ad <Plug>(ale_detail)

let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_disable_lsp = 1
let g:ale_linters_explicit = 1
" let g:ale_linters_ingore = {
"                     \ 'c++' : ['clang'],
"                     \ 'c' : ['clang']
"                     \}

" let g:ale_pattern_options = {
"                     \  '\.c': {'ale_enable':0}
"                     \, '\.cpp' : {'ale_enable':0}
"                     \, '\.h' : {'ale_enable':0}
"                     \ }

" let g:ale_lint_on_text_changed = 'never'

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

" let g:ale_linters = {
"             \ 'c++'           : [ 'clang'     ] ,
"             \ 'c'             : [ 'clang'     ] ,
"             \ 'systemverilog' : [ 'verilator' ] ,
"             \ 'verilog'       : [ 'verilator' ]
"             \}

let g:ale_linters = {
            \ 'systemverilog' : ['verilator'],
            \ 'verilog'       : ['verilator'],
            \ 'verilog_systemverilog' : ['verilator'],
            \ 'tex' : ['chktex'],
            \ 'latex' : ['chktex']
            \ }
let g:ale_verilog_verilator_options = '-sv --default-language "1800-2012" -f verilator.vc'
 
let g:ale_c_build_dir_names = ['build', 'bin']
let g:ale_c_build_dir = './'
let g:ale_c_parse_compile_commands = 1
let g:ale_c_parse_makefile = 1

"=== 
"=== coc.nvim
"===
let g:coc_global_extensions = [
    \ 'coc-snippets' 
    \,'coc-translator'
    \,'coc-vimtex'
    \,'coc-python'
    \,'coc-jedi'
    \,'coc-pyright'
    \]

    " \,'coc-pyls'
" let g:coc_node_path = '~/.my_vim/local/node/bin/node'

" source ~/.vim/coc_vimrc
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd :call CocActionAsync('jumpDefinition', 'tabe')<CR>
nmap <silent> gy :call CocActionAsync('jumpTypeDefinition', 'tabe')<CR>
nmap <silent> gi :call CocActionAsync('jumpImplementation', 'tabe')<CR>
nmap <silent> gr :call CocActionAsync('jumpReferences', 'tabe')<CR>

" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)
" xmap <leader>f <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>ac  <Plug>(coc-codeaction)
" nmap <leader>qf  <Plug>(coc-fix-current)
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" source 
"
imap <C-l> <Plug>(coc-snippets-expand)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-n>'



" ===
" === markdown Preview
" ===
let g:mkdp_path_to_chrome = "chromium"
let g:mkdp_browserfunc = 'MKDP_browserfunc_default'
let g:mkdp_auto_start = 0
let g:mkdp_auto_open = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0

" === 
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>
" let g:table_mode_cell_text_object_i_map = 'i<Bar>'

" ===
" === fzf
" ===
set rtp+=~/.fzf
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
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

let g:fzf_preview_window = 'right:60%'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6 } }
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_buffers_jump = 1
let g:fzf_action = {
\ 'enter': 'vi',
\ 'ctrl-t': 'tab split',
\ 'ctrl-i': 'split',
\ 'ctrl-o': 'vsplit'}


nmap <leader>fzf :FZF<space><CR>

" nmap <leader>fzs :sp<CR> :FZF<space>
" nmap <leader>fzv :vsp<CR> :FZF<space>



" === 
" === coc-fzf
" ===
let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []
nnoremap <silent> <leader>za  :<C-u>CocFzfList diagnostics<CR>
nnoremap <silent> <leader>zb  :<C-u>CocFzfList diagnostics --current-buf<CR>
nnoremap <silent> <leader>zc  :<C-u>CocFzfList commands<CR>
nnoremap <silent> <leader>ze  :<C-u>CocFzfList extensions<CR>
nnoremap <silent> <leader>zl  :<C-u>CocFzfList location<CR>
nnoremap <silent> <leader>zo  :<C-u>CocFzfList outline<CR>
nnoremap <silent> <leader>zs  :<C-u>CocFzfList symbols<CR>
nnoremap <silent> <leader>zS  :<C-u>CocFzfList services<CR>
nnoremap <silent> <leader>zp  :<C-u>CocFzfListResume<CR> 

" ===
" === vim-bookmarks
" ===
let g:bookmark_no_default_key_mappints = 1 
nmap <leader>bmt <Plug>BookmarkToggle
nmap <leader>bma <Plug>BookmarkAnnotate
nmap <leader>bms <Plug>BookmarkShowAll
nmap <leader>bmj <Plug>BookmarkNext
nmap <leader>bmk <Plug>BookmarkPre
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_highlight_lines = 1
let g:bookmark_manage_per_buffer = 1
let g:bookmark_center = 1
let g:bookmark_auto_close = 1
let g:bookmark_location_list = 1

" === 
" === UndoTree
" ===
noremap <leader>udt :UndotreeToggle<CR>
let g:undotree_diffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> u <plug>UndotreeNextState
	nmap <buffer> e <plug>UndotreePreviousState
	nmap <buffer> U 5<plug>UndotreeNextState
	nmap <buffer> E 5<plug>UndotreePreviousState
endfunc

" === 
" === vim-visual-multi
" ===
" let g:VM_theme = 'icebule'
" let g:VM_default_mappings = 0
let g:VM_leader = {'default': ',', 'visual': ',', 'buffer':','}
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'
let g:VM_maps['Find Subword Under'] = '<C-d>'
let g:VM_maps['Find Next']          = ''
let g:VM_maps['Find Prev']          = ''
let g:VM_maps['Remove Region']      = 'q'
let g:VM_maps['Skip Region']        = '<c-n>'
" let g:VM_maps["Undo"]               = 'l'
let g:VM_maps["Redo"]               = '<C-r>'

" === 
" === Far.vim
" === 
noremap F :F **/*<left><left><left><left>
let g:far#mapping = {
                \ "replace_undo" : ["l"],
                \ }

" === 
" === Bullets.vim
" === 
let g:bullets_enabled_file_types = [
                            \ 'markdown' ,
                            \ 'text' ,
                            \ 'gitcommit' ,
                            \ 'scratch'
                            \ ] 

" === 
" === vim-calendar
" === 
 
let g:calendar_google_calendar = 1 
let g:calendar_google_task = 1
augroup calendar-mappings
	autocmd!
	" diamond cursor
	autocmd FileType calendar nmap <buffer> k <Plug>(calendar_up)
	autocmd FileType calendar nmap <buffer> h <Plug>(calendar_left)
	autocmd FileType calendar nmap <buffer> j <Plug>(calendar_down)
	autocmd FileType calendar nmap <buffer> l <Plug>(calendar_right)
	autocmd FileType calendar nmap <buffer> <c-k> <Plug>(calendar_move_up)
	autocmd FileType calendar nmap <buffer> <c-h> <Plug>(calendar_move_left)
	autocmd FileType calendar nmap <buffer> <c-k> <Plug>(calendar_move_down)
	autocmd FileType calendar nmap <buffer> <c-l> <Plug>(calendar_move_right)
	autocmd FileType calendar nmap <buffer> i <Plug>(calendar_start_insert)
	autocmd FileType calendar nmap <buffer> I <Plug>(calendar_start_insert_head)
	" unmap <C-n>, <C-p> for other plugins
	autocmd FileType calendar nunmap <buffer> <C-m>
	autocmd FileType calendar nunmap <buffer> <C-b>
augroup END


" === 
" === rainbow
" === 
let g:rainbow_active = 1

" ===
" === tabular
" ===
vmap tbb :Tabularize /
vmap tbl :Tabularize //l0<left><left><left>
vmap tbr :Tabularize //r0<Left><left><left>


" ===
" === any-jump
" ===
nnoremap <leader>ju :AnyJump<CR>
let g:any_jump_window_width_ratio  = 0.8
let g:any_jump_window_height_ratio = 0.9

" " ===
" " === ultisnips
" " ===
" let g:UltiSnipsExpandTrigger="<C-y>"
" let g:UltiSnipsListSnippets="c-tab"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:UltiSnipsEditSplit = "vertical"
" " let g:ultiSnipsSnippetDirectories=[$HOME.'/.vim/Ultisnips/', $HOME.'/.vim/plugged/vim-snippets/UltiSnips/']
" let g:ultiSnipsSnippetDirectories=['/home/centos/.vim/Ultisnips']

" ===
" === auto-pairs
" let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}
let g:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", '"':'"'}
" let g:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'"}
let g:AutoPairsMoveCharacter = "()[]{}'"
" inoremap <buffer> <silent> <BS> <C-R>=AutoPairsDelete()<CR>
" let g:AutoPairsMapBS = 1


" === 
" === verilog_systemverilog
" ===
nnoremap <leader>vi :VerilogFollowInstance<CR>
nnoremap <leader>vp :VerilogFollowPort<CR>
nnoremap <leader>vgs :VerilogGotoInstanceStart<CR>

" ===
" === latex 
" === 
let g:tex_flavor = 'latex'
let g:vimtex_view_general_viewer = 'zathura'

