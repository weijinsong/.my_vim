" Author:  @weijinsong <vitus.wei@outlook.com> 
" Last change:	2020 Jun 23
"
" When started as "evim", evim.vim will already have done these settings.
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
set wrap! 
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

"===
"=== Terminal Behaviors
"===
let g:neoterm_autoscroll=1

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
noremap Tu :tabe
noremap Tn :-tabnext<CR>
noremap TN :+tabnext<CR>
" noremap Tmn :-tabmove<CR>
" noremap TmN :+tabmove<CR>

"=== find and replace
noremap \s :%s//g<left><left>

"=== Insert right bracket
" imap{ {}<ESC>i<CR><ESC>O
" imap{ {}<ESC>i



"========================
"=== Install Vim Plug ===
"===
call plug#begin('~/.vim/plugged')
" Plug 'dense-analysis/ale'

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
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'pechorin/any-jump.vim'
" Plug 'Yggdroot/LeaderF', {'do': './install.sh'}
Plug 'Yggdroot/LeaderF'

" Taglist
Plug 'liuchengxu/vista.vim'

" Debuger
" Plug 'puremourning/vimspector', {'do': '.install_gadget.py --enable-c --enable-python --enable-go'}

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
" Plug 'vhda/verilog_systemverilog.vim'

" Tex
" Plug 'legvag/vimtex'

" JSON
Plug 'elzr/vim-json'

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

" ===
" === Nerdtree 
" ===
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeMapActivateNode = 'l'

"===
"=== LeaderF
"===
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

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
" let g:ale_set_loclist = 0
" let g:ale_set_qucikfix = 1
" let g:ale_open_list = 1
" let g:ale_keep_list_window_open = 1
" let g:ale_list_window_size = 5
" " let g:ale_linters_explicit = 1
" let g:ale_completion_delay = 10
" let g:ale_echo_delay = 2
" let g:ale_lint_delay = 10
" " let g:ale_sign_column_always = 1
" let g:ale_set_highlights = 1
" let g:airline#extensions#ale#enabled = 1
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_ech_msg_format = '[%linter%] %s [%severity%]'
"
" let g:ale_sign_error = '>>'
" let g:ale_sign_warning = '--'
" hi! clear SpellBad
" hi! clear SpellCap
" hi! clear SpellRare
" hi! SpellBad gui=undercurl guisp=red
" hi! SpellCap gui=undercurl guisp=blue
" hi! SpellRare gui=undercurl guisp=magenta
"
" let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
" nmap <silent> <C-k> <Plug>(ale_previous_warp)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
" nmap <silent> <leader>ad <Plug>(ale_detail)
"
" let g:ale_lint_on_text_changed = 'normal'
" let g:ale_lint_on_insert_leave = 1
" let g:ale_lint_on_save = 1
" " let g:ale_lint_on_text_changed = 'never'
"
" let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
" let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
" " let g:ale_c_cppcheck_options = ''
" " let g:ale_cpp_cppcheck_options = ''
" let g:ale_linter = {
"             \ 'c++' : ['clang'],
"             \ 'c' : ['clang'],
"             \ 'systemverilog' : ['verilator']
"             \}
" let g:ale_verilog_verilator_options = '-sv --default-language "1800-2012"'
" let g:ale_c_build_dir_names = ['build', 'bin']
" let g:ale_c_build_dir = './'
" let g:ale_c_parse_compile_commands = 1
" let g:ale_c_parse_makefile = 0

"=== 
"=== coc.nvim
"===
let g:coc_global_extensions = [
    \ 'coc-snippets' ]

source ~/.vim/coc_vimrc

imap <C-l> <Plug>(coc-snippets-expand)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-n>'

" let g:coc_snippet_next = '<tab>'

" ===
" === markdown Preview
" ===
let g:mkdp_path_to_chrome = "firefox"
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
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
nmap <leader>fsf :FZF<space>
nmap <leader>fss :sp<CR> :FZF<space>
nmap <leader>fsv :vsp<CR> :FZF<space>

" ===
" === vim-bookmarks
" ===
let g:bookmark_no_default_key_mappints = 1 
nmap bmt <Plug>BookmarkToogle
nmap bma <Plug>BookmarkAnnotate
nmap bms <Plug>bookmarkShowAll
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
noremap F :F **/*<left><left><left><left><left>
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
	autocmd FileType calendar nmap <buffer> u <Plug>(calendar_up)
	autocmd FileType calendar nmap <buffer> n <Plug>(calendar_left)
	autocmd FileType calendar nmap <buffer> e <Plug>(calendar_down)
	autocmd FileType calendar nmap <buffer> i <Plug>(calendar_right)
	autocmd FileType calendar nmap <buffer> <c-u> <Plug>(calendar_move_up)
	autocmd FileType calendar nmap <buffer> <c-n> <Plug>(calendar_move_left)
	autocmd FileType calendar nmap <buffer> <c-e> <Plug>(calendar_move_down)
	autocmd FileType calendar nmap <buffer> <c-i> <Plug>(calendar_move_right)
	autocmd FileType calendar nmap <buffer> k <Plug>(calendar_start_insert)
	autocmd FileType calendar nmap <buffer> K <Plug>(calendar_start_insert_head)
	" unmap <C-n>, <C-p> for other plugins
	autocmd FileType calendar nunmap <buffer> <C-n>
	autocmd FileType calendar nunmap <buffer> <C-p>
augroup END


" === 
" === rainbow
" === 
let g:rainbow_active = 1

" ===
" === tabular
" ===
vmap tb :Tabularize /


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
" === auto pairs
" let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}
let g:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", '"':'"'}
" let g:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'"}
let g:AutoPairsMoveCharacter = "()[]{}'"


" === 
" === verilog_systemverilog
" ===
nnoremap <leader>vi :VerilogFollowInstance<CR>
nnoremap <leader>vp :VerilogFollowPort<CR>
nnoremap <leader>vgs :VerilogGotoInstanceStart<CR>


