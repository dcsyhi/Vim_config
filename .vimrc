"-------��{�ݒ�--------
"�^�C�g�����o�b�t�@���ɕύX���Ȃ�
set notitle
set shortmess+=I

"�^�[�~�i���ڑ��������ɂ���
set ttyfast

"�^�[�~�i����256�F�\�����g��
set t_Co=256

if has ("viminfo")
"�t�H�[���h�ݒ�(���g�p)
"set foldmethod=indent
set foldmethod=manual
"set foldopen=all
"set foldclose=all
endif

"VIM�݊��ɂ��Ȃ�
set nocompatible

"�����t�@�C���̕ҏW���\�ɂ���
set hidden

"���e���ύX���ꂽ�玩���I�ɍēǂݍ���
set autoread

"Swap�����܂ł̎���m�b
set updatetime=0

"Unicode�ōs�����ςɂȂ��������
set ambiwidth=double

"�s�Ԃ��ŃV�[�����X�Ɉړ�����
"set whichwrap+=h,l,<,>,[,],b,s

"�J�[�\������ɉ�ʂ̒����ɕ\��������
"set scrolloff=999

"�o�b�N�X�y�[�X�L�[�ōs�����폜����
set backspace=indent,eol,start

"�J�b�R������Ƃ��Ή�����J�b�R�Ɉꎞ�I�Ɉړ�
set nostartofline

"C-X,C-A�������I��10�i���F��������
set nrformats=
"set nrformats=alpha

"title��ύX���Ȃ�
set notitle

"�R�}���h���C����TAB�ŕ⊮�ł���悤�ɂ���
set wildchar=<C-Z>

"���s��ɁuBackspace�v�L�[�������Ə�s�����̕�����1��������
set backspace=2

"C-v�̋�`�I���ōs���������J�[�\����u����
set virtualedit=block

"�R�}���h�A�����p�^�[����50�܂ŕۑ�
set history=50

"�����ɕۑ�����e��ݒ�
set viminfo='100,/50,%,<1000,f50,s100,:100,c,h,!

"�o�b�N�A�b�v���쐬���Ȃ�
set nobackup

"-------Search--------
"�C���N�������^���T�[�`��L���ɂ���
set incsearch

"�啶������������ʂ��Ȃ�
set ignorecase

"�啶���Ō������ꂽ��Ώۂ�啶������ɂ���
set smartcase

"�s���܂Ō���������s���ɖ߂�
set wrapscan

"-------Format--------
"�����C���f���g��L��������
set smartindent
set autoindent

"�t�H�[�}�b�g�������R�����g�ȊO�L���ɂ���
set formatoptions-=c

"���ʂ̑Ή����n�C���C�g
set showmatch

"�s���̗]������ Tab ��ł����ނƁA'shiftwidth' �̐������C���f���g����B
set smarttab

"�^�[�~�i���ォ��̒���t��������
"set paste

"http://peace-pipe.blogspot.com/2006/05/vimrc-vim.html
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab

"-------Look&Feel-----
"TAB,EOF�Ȃǂ���������
set list
set listchars=tab:>-,extends:<,trail:-,eol:<

"�������ʂ��n�C���C�g����
set hlsearch

"���[���[,�s�ԍ���\��
set ruler
set number

"�R�}���h���C���̍���
set cmdheight=1

"�}�N���Ȃǂ̓r���o�߂�`�ʂ��Ȃ�
set lazyredraw

"�J�[�\�����C����\������
set cursorline

"�E�C���h�E�^�C�g����ݒ肷��
set title

"�����������J�E���g
augroup WordCount
    autocmd!
    autocmd BufWinEnter,InsertLeave,CursorHold * call WordCount('char')
augroup END
let s:WordCountStr = ''
let s:WordCountDict = {'word': 2, 'char': 3, 'byte': 4}
function! WordCount(...)
    if a:0 == 0
        return s:WordCountStr
    endif
    let cidx = 3
    silent! let cidx = s:WordCountDict[a:1]
    let s:WordCountStr = ''
    let s:saved_status = v:statusmsg
    exec "silent normal! g\<c-g>"
    if v:statusmsg !~ '^--'
        let str = ''
        silent! let str = split(v:statusmsg, ';')[cidx]
        let cur = str2nr(matchstr(str, '\d\+'))
        let end = str2nr(matchstr(str, '\d\+\s*$'))
        if a:1 == 'char'
            " ������(���s�R�[�h��*���s�R�[�h�T�C�Y)��'g<C-g>'�̕������������
            let cr = &ff == 'dos' ? 2 : 1
            let cur -= cr * (line('.') - 1)
            let end -= cr * line('$')
        endif
        let s:WordCountStr = printf('%d/%d', cur, end)
    endif
    let v:statusmsg = s:saved_status
    return s:WordCountStr
endfunction

"�X�e�[�^�X���C���ɃR�}���h��\��
set showcmd
"�X�e�[�^�X���C������ɕ\��
set laststatus=2
"�t�@�C���i���o�[�\��
set statusline=[%n]
"�z�X�g���\��
set statusline+=%{matchstr(hostname(),'\\w\\+')}@
"�t�@�C�����\��
set statusline+=%<%F
"�ύX�̃`�F�b�N�\��
set statusline+=%m
"�ǂݍ��ݐ�p���ǂ����\��
set statusline+=%r
"�w���v�y�[�W�Ȃ�[HELP]�ƕ\��
set statusline+=%h
"�v���r���[�E�C���h�E�Ȃ�[Prevew]�ƕ\��
set statusline+=%w
"�t�@�C���t�H�[�}�b�g�\��
set statusline+=[%{&fileformat}]
"�����R�[�h�\��
set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}]
"�t�@�C���^�C�v�\��
set statusline+=%y
"��������c�[���o�[�E��
set statusline+=%=
"skk.vim�̏��
set statusline+=%{exists('*SkkGetModeStr')?SkkGetModeStr():''}
"�����o�C�g��/�J�����ԍ�
set statusline+=[%{col('.')-1}=ASCII=%B,HEX=%c]
"���ݕ�����/�S�̗�\��
set statusline+=[C=%c/%{col('$')-1}]
"���ݕ����s/�S�̍s�\��
set statusline+=[L=%l/%L]
"���݂̃t�@�C���̕��������J�E���g
set statusline+=[WC=%{exists('*WordCount')?WordCount():[]}]
"���ݍs���S�̍s�̉�%�ڂ��\��
set statusline+=[%p%%]
"���W�X�^�̒��g��\��
"set statusline+=[RG=\"%{getreg()}\"]

"-------�G���R�[�h------
"�G���R�[�h�ݒ�
if has('unix')
    set fileformat=unix
    set fileformats=unix,dos,mac
    set fileencoding=utf-8
    set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp
    set termencoding=
elseif has('win32')
    set fileformat=dos
    set fileformats=dos,unix,mac
    set fileencoding=utf-8
    set fileencodings=iso-2022-jp,utf-8,euc-jp,cp932
    set termencoding=
endif

"�t�@�C���^�C�v�ɉ����ċ���,�F��ς���
syntax on
filetype plugin on
filetype indent on

"-------�L�[�ݒ�-------
"���L�[�ł͕\���s�P�ʂōs�ړ�����
nmap <UP> gk
nmap <DOWN> gj
vmap <UP> gk
vmap <DOWN> gj

"����vim��viminfo�𑗂�
"http://nanasi.jp/articles/howto/editing/rviminfo.html
nmap ,vw :vw<CR>
nmap ,vr :vr<CR>

"ZZ�͋����I�ɏ�������
map ZZ :wq!<CR>

"C-L��awk���Ăяo��
nmap <C-C><C-L> :w !awk 'BEGIN{n=0}{n+=$1}END{print n}'

"C-P,C-N�Ńo�b�t�@�ړ�,C-D�Ńo�b�t�@����
nmap <C-P> :bp<CR>
nmap <C-N> :bn<CR>
nmap <C-D> :bd<CR>

"C-N�ŐV�����o�b�t�@���J��
nmap <C-C><C-N> :new<CR>

"C-L,C-L�Ńo�b�t�@���X�g
nmap <C-L><C-L> :ls<CR>
"C-L,C-R�Ń��W�X�^���X�g
nmap <C-L><C-R> :dis<CR>
"C-L,C-K�ŃL�[�}�b�v���X�g
nmap <C-L><C-K> :map<CR>
"C-L,C-M�Ń}�[�N���X�g
nmap <C-L><C-M> :marks<CR>
"C-L,C-J�ŃW�����v���X�g
nmap <C-L><C-J> :jumps<CR>
"C-L,C-H�ŃR�}���h�q�X�g��
nmap <C-L><C-H> :his<CR>
"C-L,C-U�ŃA���h�D�q�X�g��
nmap <C-L><C-U> :undolist<CR>

"C-W,s�ŉ�����
nmap <C-W>s :sp<CR>
"C-W,v�ŏc����
nmap <C-W>v :vsp<CR>

"C-W,o�Ńt�@�C�����w�肵�ĉ������A�I�[�v��
nmap <C-W>o :sp
"C-W,O�Ńt�@�C�����w�肵�ďc�����A�I�[�v��
nmap <C-W>O :vp

"C-W,�D�݂̕����L�[�ŐV�����o�b�t�@���J��
nmap <C-W><C-h> :vne<cr>
nmap <c-w><c-j> :bel new<cr>
nmap <c-w><c-k> :new<cr>
nmap <c-w><c-l> :rightb vnew<cr>

"C-W,e�Ńt�@�C���u���E�U���������N��
nmap <C-W>e :vsp<CR>:wincmd w<CR>:e! ./<CR>
"C-W,E�Ńt�@�C���u���E�U���c�����N��
nmap <C-W>E :sp<CR>:wincmd w<CR>:e! ./<CR>

"C-W,C-A�Ō��݂̃E�C���h�E�݂̂̕\��
nmap <C-W><C-A> :all<CR>

"C-C,C-R�ŃJ�[�\����̒u������
nmap <C-C><C-R> yw:%s:<C-R>0::g<LEFT><LEFT>
"C-C,r��Yank����������Ƃ̒u������
nmap <C-C>r :%s:<C-R>0::g<LEFT><LEFT>
"C-C,g�ŃJ�[�\���ꂪ���݂���s�̍폜
nmap <C-C>g yw:g:<C-R>0:d
"C-C,G�ŃJ�[�\���ꂪ���݂���s�ȊO�̍폜
nmap <C-C>G yw:v:<C-R>0:d
",cel�ŋ󔒍s�̍폜
nmap ,cel :%s:^$\n:<CR>
",ccl�ŃR�����g�s�̍폜
nmap ,ccl :%s:^\("\\|#\\\|\*\).*$\n:<CR>
",cd�Ō��ݕҏW���̃t�@�C���̂���f�B���N�g���ɕύX
nmap ,cd :cd %:h<CR>

"�R�}���h���[�h���ɃJ�[�\���ړ�����̂ɕ֗�
cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <C-D> <Delete>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-N> <Down>
cnoremap <C-P> <Up>

"<ESC>h�Ńn�C���C�g��OFF�ɂ���
nmap <ESC><ESC> :noh<CR>

"<TAB><TAB>��expandtab���g�O��
function Tab_switch()
    if &expandtab =='1'
        set noexpandtab
    else
        set expandtab
    endif
endfunction
nmap <TAB><TAB> :call Tab_switch()<CR>

"<ESC>w��nowrap���g�O��
function Wrap_switch()
    if &wrap =='1'
        set nowrap
    else
        set wrap
    endif
endfunction
nmap <ESC>w :call Wrap_switch()<CR>

"-------MENU-------
"SSH��ʂ��ăt�@�C���I�[�v��
menu User.Open.SCP.NonSprit :e! scp:///<LEFT>
menu User.Open.SCP.VSprit :vsp<CR>:wincmd w<CR>:e! scp:///<LEFT>
menu User.Open.SCP.Sprit :sp<CR>:wincmd w<CR>:e! scp:///<LEFT>
"�������ăt�@�C���u���E�U���N��
menu User.Open.Explolr.NonSprit :vsp<CR>:wincmd w<CR>:e! ./<CR>
menu User.Open.Explolr.VSprit :vsp<CR>:wincmd w<CR>:e! ./<CR>
menu User.Open.Explolr.Sprit :sp<CR>:wincmd w<CR>:e! ./<CR>
"�e��VIM�̋L�^����\������
menu User.Buffur.RegisterList :dis<CR>
menu User.Buffur.BuffurList :ls<CR>
menu User.Buffur.HistoryList :his<CR>
menu User.Buffur.MarkList :marks<CR>
menu User.Buffur.JumpList :jumps<CR>
"�G���R�[�h���w�肵�čēǂݍ���
menu User.Encode.reload.SJIS :e ++enc=cp932<CR>
menu User.Encode.reload.EUC :e ++enc=euc-jp<CR>
menu User.Encode.reload.ISO :e ++enc=iso-2022-jp<CR>
menu User.Encode.reload.UTF :e ++enc=utf-8<CR>
"�ۑ��G���R�[�h���w��
menu User.Encode.convert.SJIS :set fenc=cp932<CR>
menu User.Encode.convert.EUC :set fenc=euc-jp<CR>
menu User.Encode.convert.ISO :set fenc=iso-2022-jp<CR>
menu User.Encode.convert.UTF :set fenc=utf-8<CR>
"�t�H�[�}�b�g���w�肵�čēǂݍ���
menu User.Format.Unix :e ++ff=unix<CR>
menu User.Format.Dos :e ++ff=dos<CR>
menu User.Format.Mac :e ++ff=mac<CR>
"�s�ԍ����t�@�C���ɑ}��
menu User.Global.No :%!awk '{print NR, $0}'<CR>
"TAB��SPACE�ɕϊ�����
menu User.Global.Space :set expandtab<CR>:retab<CR>
"�󔒍s���폜����
menu User.Global.Delete :g/^$/d<CR>
"�J�[�\����̒P���S�̂��猟�����A�ʃE�C���h�E�ŕ\��
menu User.Cursor.Serch.Show [I
menu User.Cursor.Serch.Top [i
menu User.Cursor.Serch.Junp [<tab>
"�J�[�\����̃t�@�C���̃I�[�v��
menu User.Cursor.FileOpen gf
"�R�s�[�A�y�[�X�g���[�h
menu User.Cursor.Paste :call Indent()<CR>
"�S�̒u���������[�h
menu User.Cursor.Replace :%s/
"C-C,C-R�Ɠ��l
menu User.Cursor.Delete yw:%v:<C-R>0

"CUI���Ƀ��j���[��A-l�ŕ\������
set wildcharm=<TAB>
if has('gui')
    nmap <M-l> :emenu <TAB>
else
    nmap <ESC>l :emenu <TAB>
endif

"-------GUI--------
"���C���h���j���[���g��
set wildmenu
set wildmode=longest,list,full

"OS�̃N���b�v�{�[�h���g�p����
set clipboard+=unnamed

"�^�[�~�i���Ń}�E�X���g�p�ł���悤�ɂ���
if has ("mouse")
    set mouse=a
    set guioptions+=a
    set ttymouse=xterm2
endif

if has('gui')
    "�c�[���o�[������
    set guioptions=egLta
    "���ɊJ���Ă���GVIM������Ƃ��͂���VIM��O�ʂɂ����Ă���
    runtime macros/editexisting.vim
    "gp gy��+���W�X�^�ɓ��o��
    nmap gd "+d
    nmap gy "+y
    nmap gp "+p
    nmap gP "+P
endif

"-------AutoCmd------
"if has('unix')
"   "CVS�̃R�~�b�g��SJIS�ōs��
"   autocmd BufRead /tmp/cvs* :set fileencoding=cp932
"   "Mutt����J�����ҏW��iso-2022-jp�ōs��
"   autocmd BufRead ~/.mutt/tmp/* :set fileencoding=utf-8
"   "w3m�̃t�H�[���͉��s�R�[�hDOS�ŕҏW
"   autocmd BufRead ~/.w3m/w3mtmp* :set fileformat=dos
"   "�ǂ̂悤�Ȍ���ł��y�[�X�g�������C���f���g���Ȃ�
"   "autocmd BufRead * :set paste
"endif

"-------VIM7�ȍ~--------
"Tab����
if v:version >= 700
    "15�܂Ń^�u���J��
    set tabpagemax=15
    "�^�u���C������ɕ\������
    "set showtabline=2
    if has('unix')
        nmap <ESC>t :tabnew<CR>
        nmap <ESC>e :tabnew ./<CR>
        nmap <ESC>n :tabn<CR>
        nmap <ESC>p :tabp<CR>
        nmap <ESC>o :tabo<CR>
        nmap <ESC>d :tabd
        if has('gui')
            nmap <M-t> :tabnew<CR>
            nmap <M-e> :tabnew ./<CR>
            nmap <M-n> :tabn<CR>
            nmap <M-p> :tabp<CR>
            nmap <M-o> :tabo<CR>
            nmap <M-d> :tabd
        endif
    elseif has('win32')
        nmap <M-t> :tabnew<CR>
        nmap <M-e> :tabnew ./<CR>
        nmap <M-n> :tabn<CR>
        nmap <M-p> :tabp<CR>
        nmap <M-o> :tabo<CR>
        nmap <M-d> :tabd
    endif
endif

"�J���Ă���o�b�t�@�̃f�B���N�g���Ɉړ�
if v:version >= 700
    set autochdir
endif

"Vim���I�����Ă� undo �����𕜌�����
"http://vim-users.jp/2010/07/hack162/
"if has('persistent_undo')
    "set undodir=./.vimundo,~/.vimundo
    "set undofile
"endif

"Make��grep��cwindow�������łЂ炭�悤�ɂ���
if v:version >= 700
    autocmd QuickfixCmdPost make,grep,grepadd,vimgrep copen
    autocmd QuickfixCmdPost l* lopen
    "M-g��Grep����
    if has('unix')
        nmap <Esc>g :vimgrep  %<LEFT><LEFT>
        nmap <Esc>f :cn<CR>
        nmap <Esc>b :cp<CR>
    elseif has('win32')
        nmap <M-g> :vimgrep  %<LEFT><LEFT>
        "M-P,N�Ō��ړ�
        nmap <M-f> :cn<CR>
        nmap <M-b> :cp<CR>
    endif
endif

"-------�g��--------
"�J�[�\�����C����h��ɂ���
"highlight CursorLine term=none cterm=none ctermbg=3

"completeopt�̔w�i�F���O���[�ɂ���
highlight Pmenu ctermbg=8
highlight PmenuSel ctermbg=Green
highlight PmenuSbar ctermbg=Green

"�J�[�\���ʒu�𕜌�
"autocmd BufWinLeave ?* silent mkview
"autocmd BufWinEnter ?* silent loadview
autocmd BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" | endif

"HEX�G�f�B�^�Ƃ���vim���g��
if has('unix')
    augroup Binary
        au!
        au BufReadPre  *.bin let &bin=1
        au BufReadPost *.bin if &bin | silent %!xxd -g 1
        au BufReadPost *.bin set ft=xxd | endif
        au BufWritePre *.bin if &bin | %!xxd -r
        au BufWritePre *.bin endif
        au BufWritePost *.bin if &bin | silent %!xxd -g 1
        au BufWritePost *.bin set nomod | endif
    augroup END
endif

"C-C,C-V�Ń^�[�~�i������R�s�[�ł���\���`���ɂ���(�֐��g�p)
if has('unix')
    function Indent_switch()
        if &nu =='1'
            set noai
            set nolist
            set nonu
            set paste
            set nocursorline
        else
            set ai
            set list
            set nu
            set nopaste
            set cursorline
        endif
    endfunction
    nmap <C-C><C-V> :call Indent_switch()<CR>
endif

",nn�Ő�΍s�ɕ\���؂�ւ�
if has('unix')
    function Relnum_switch()
        if &relativenumber =='1'
            set norelativenumber
        else
            set relativenumber
        endif
    endfunction
    nmap ,nn :call Relnum_switch()<CR>
endif

"SSH�z���Ƀt�@�C����ҏW����
if has('unix')
    function Scp_edit(svr)
        vsp
        wincmd w
        let sv = "e scp://" . a:svr . "/../"
        exec sv
    endfunction
    nmap ,ssh :call Scp_edit("")<LEFT><LEFT>
endif

"�}�����[�h��",date",',time'�œ��t�A�����}��
inoremap ,date <C-R>=strftime('%Y/%m/%d (%a)')<CR>
inoremap ,time <C-R>=strftime('%H:%M')<CR>

"sudo��Y��Č����̂Ȃ��t�@�C����ҏW������\sudo�ŕۑ�
nmap ,sudo :w !sudo tee %<CR>

"<C-C><C-d>�Ō��݂̃o�b�t�@�ƕۑ��O�̃t�@�C����diff����
nmap <C-C><C-D> :w !diff -u % -<CR>

"<C-C><C-g>�Ō��݂̃t�@�C����git diff����
nmap <C-C><C-G> :!git diff --  %<CR>

"<C-C><C-D>��vimdiff���g�p���Č��݂̃o�b�t�@�ƌ��t�@�C�����r����
command DiffOrigcmp vert new | set bt=nofile | r # | -1d_ | diffthis | wincmd p | diffthis
nmap <C-C>d :DiffOrig<CR>

"-----Windows�̂ݗL��------
if has('win32')
    "�t�H���g�ݒ�
    set guifont=MS_Gothic:h9:cSHIFTJIS
    "�p�X�̃Z�p���[�^��ύX(\->/)
    set shellslash
    "�E�C���h�E�|�W�V�����A�T�C�Y�̐ݒ�
    winpos 9 6
    set lines=73
    set columns=110
    "�X�y�[�X�̓������t�@�C������������悤�ɂ���
    set isfname+=32
    "�t�@�C���ۑ��_�C�A���O�̏����f�B���N�g�����o�b�t�@�̂���f�B���N�g���ɂ���
    set browsedir=buffer
    "�J���[�̐ݒ�
    colorscheme molokai
    "IME���͏�Ԃ��K��ɂ���(skk���g���Ă���Ƃ��p)
    set iminsert=2
    set imsearch=0
    "�N�����f�X�N�g�b�v�Ɉړ�
    if isdirectory( $HOME . "/Desktop" )
        cd $HOME/Desktop
    elseif isdirectory( $HOME . "/�f�X�N�g�b�v" )
        cd $HOME/�f�X�N�g�b�v
    endif
endif

"-----Mac�̂ݗL��------
if has('gui_macvim')
    "�E�C���h�E�|�W�V�����A�T�C�Y�̐ݒ�
    winpos 837 22
    set isfname+=32
    set lines=90
    set columns=140
    colorscheme murphy
  set guifont=Menlo\ Regular:h10
  set guifontwide=Menlo\ Regular:h10
  "set guifont=Ricty\ Regular\ for\ Powerline:h11
  "set guifontwide=Ricty\ Regular\ for\ Powerline:h11
    "set imdisable
    "set iminsert=2
    "set imsearch=0
endif

"�g�������������t�^
if has('mac')
    autocmd BufWritePost *.txt
        \ if &fenc=='utf-8' |
        \ exec "silent !xattr -w com.apple.TextEncoding 'UTF-8;134217984' \"%\"" |
        \ elseif &fenc=='euc-jp' |
        \ exec "silent !xattr -w com.apple.TextEncoding 'EUC-JP;2361' \"%\"" |
        \ elseif &fenc=='iso-2022-jp' |
        \ exec "silent !xattr -w com.apple.TextEncoding 'ISO-2022-JP;2080' \"%\"" |
        \ elseif &fenc=='cp932' |
        \ exec "silent !xattr -w com.apple.TextEncoding 'SHIFT_JIS;2561' \"%\"" |
        \ endif
endif

"-------Plugin--------
"eskk.vim
if has('unix') && isdirectory($HOME . '/.vim/bundle/eskk.vim')
  let g:eskk#directory = "~/vim/skk"
  let g:eskk#dictionary = { 'path': "~/.vim/skk/.skk-jisyo", 'sorted': 0, 'encoding': 'utf-8', }
  let g:eskk#large_dictionary = { 'path': "~/.vim/skk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'utf-8', }
endif

"Fuf�n
"http://vim.g.hatena.ne.jp/keyword/fuzzyfinder.vim
if isdirectory($HOME . '/.vim/bundle/FuzzyFinder')
  let g:fuf_modesDisable = ['mrucmd']
    nmap fb :FufBuffer<CR>
    nmap fF :FufFile<CR>
    nmap ff :FufMruFile<CR>
    nmap fl :FufChangeList<CR>
    nmap fc :FufMruCmd<CR>
endif


"http://blog.ruedap.com/2011/02/02/vim-ruby-regexp-plugin-eregex
if isdirectory($HOME . '/.vim/bundle/eregex.vim')
    let g:eregex_default_enable = 0
    nnoremap <leader>/ :call eregex#toggle()<CR>
endif

"http://vim-users.jp/2009/09/hack77/
"if isdirectory($HOME . '/.vim/bundle/vim-align')
"   let g:Align_xstrlen=3
"endif

"neocomplcache
if isdirectory($HOME . '/.vim/bundle/neocomplcache')
    "https://github.com/Shougo/neocomplcache.vim
    "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

    " Enable heavy features.
    " Use camel case completion.
    "let g:neocomplcache_enable_camel_case_completion = 1
    " Use underbar completion.
    "let g:neocomplcache_enable_underbar_completion = 1

    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
        return neocomplcache#smart_close_popup() . "\<CR>"
        " For no inserting <CR> key.
        "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplcache#close_popup()
    inoremap <expr><C-e>  neocomplcache#cancel_popup()
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

    " For cursor moving in insert mode(Not recommended)
    "inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
    "inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
    "inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
    "inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
    " Or set this.
    "let g:neocomplcache_enable_cursor_hold_i = 1
    " Or set this.
    "let g:neocomplcache_enable_insert_char_pre = 1

    " AutoComplPop like behavior.
    "let g:neocomplcache_enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplcache_enable_auto_select = 1
    "let g:neocomplcache_disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplcache_omni_patterns')
        let g:neocomplcache_omni_patterns = {}
    endif
    let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
endif

"Gitv
"http://cohama.hateblo.jp/entry/20130517/1368806202
if isdirectory($HOME . '/.vim/bundle/gitv')
nmap ,g :Gitv --all<CR>
    autocmd FileType git :setlocal foldlevel=99
    autocmd FileType gitv call s:my_gitv_settings()

    function! s:my_gitv_settings()
        setlocal iskeyword+=/,-,.
        nnoremap <silent><buffer> C :<C-u>Git checkout <C-r><C-w>
        nnoremap <buffer> <Space>di :<C-u>Git diff <C-r><C-w><CR>
        nnoremap <buffer> <Space>rb :<C-u>Git rebase <C-r><C-w>
        nnoremap <buffer> <Space>R :<C-u>Git revert <C-r><C-w>
        nnoremap <buffer> <Space>h :<C-u>Git cherry-pick <C-r><C-w>
        nnoremap <buffer> <Space>rh :<C-u>Git reset --hard <C-r><C-w>
    endfunction

endif

"�^�[�~�i���ł�256�F��p���ăJ���[�X�L�[����\������
if !has('gui_running') && filereadable($HOME . '/.vim/plugin/guicolorscheme.vim') && $TERM_PROGRAM ==# 'Apple_Terminal'
    autocmd VimEnter * :GuiColorScheme badwolf
elseif has('mac')
    colorscheme badwolf
else
    colorscheme pablo
endif

"Tips����
"
"http://www.ac.cyberhome.ne.jp/~yakahaira/vimdoc/windows.html
"����
"C-W,s
"�c����
"C-W,v
"�����E�C���h�E�ړ�
"C-W,C-W
"�����E�C���h�E�J�[�\���ړ�
"C-W,hjkl
"�����E�C���h�E�ړ�
"C-W,HJKL
"���܊J���Ă��镪���E�C���h�E�ȊO�����
"C-W,o
"�E�C���h�E�T�C�Y����
"C-W,+-=
"
"�J�[�\������O�̏ꏊ(�t�@�C��)�ɖ߂�
"C-O
"
"�J�[�\�������̏ꏊ(�t�@�C��)�ɐi�߂�
"C-I
"
"�J�[�\�����̃t�@�C�������J��
"gf
"
"���݌������Ă���P����y�[�X�g
"<C-R>/
"
"\di to start DrawIt and
"\ds to stop  DrawIt.
"
"���̂܂܃y�[�X�g
":a! <Paste>
"
"�J�����g�o�b�t�@��Bash�ȂǂŎ��s
"w !bash
"
"�������Q��
":<C-F>
"
"���W�X�^�̒��g���R�}���h���C���փy�[�X�g
":<C-R>"
":<C-R><C-W>
"
"���W�X�^���X�g
"0 �Ō�� yank �����e�L�X�g
"- �Ō�ׂ̍����폜
". �Ō�ɑ}�������e�L�X�g
"% ���݂̃t�@�C����
"# ��փt�@�C����
"/ �Ō�Ɍ�������������
": �Ō�Ɏ��s����:
"_ �u���b�N�z�[��
"= �v�Z��
"* �}�E�X�őI�����ꂽ�e�L�X�g
"
"�w��G���R�[�h�ŊJ���Ȃ���
":e ++enc=euc-jp
":e ++ff=unix
"
"�㉺�̍s�����ݍs�փR�s�[
"<C-E> or <C-Y>
"
"uniq��grep�Ńt�B���^
":%!uniq
":%!grep
"
":e�ŊJ���p�X�̒ǉ�
"let &path += "/etc,/var/log,/var/log/httpd"
"
"Bookmark
"http://nanasi.jp/articles/vim/bookmarks_vim.html
"b
"B
"q
"
"DrawItPlugin.vim
"\di
"\ds
"
"�C���T�[�g���[�h�ŃC���f���g����
"<C-T> or <C-D>
"
"EnhCommentify.vim
"\x�ŃR�����g�A�E�g/����
"
"VisualMode�đI��
"gv
"
"�J�[�\����̒P���S�̂��烊�X�g�A�b�v
"[I
"
"�啶��<->�������ϊ�
"gu<select>
"gU<select>
"
"1���C������X�N���[��
"^y
"�E�B���h�E�̐擪���琔����[count]�s�ڂ���ĕ`��
"z
"���ݍs���E�B���h�E�̍ŏ�ʒu�ɂ��čĕ`��(�ʒu�ω���)
"zt
"�E�B���h�E�̍�����{height}�ɂ��čĕ`��
"z{height}<CR>
"���݈ʒu���ŏ�ɂ��ăE�B���h�E���ĕ`��(�J�[�\�����݈ʒu)
"z<CR>
"���݈ʒu�𒆐S�ɂ��ăE�B���h�E���ĕ`��(�J�[�\���ō���󔒂�)
"z.
"���݈ʒu�𒆐S�ɂ��ăE�B���h�E���ĕ`��(�J�[�\�����݈ʒu)
"zz
"���݈ʒu���ŉ��ɂ��ăE�B���h�E���ĕ`��(�J�[�\���ō���󔒂�)
"z-
"���݈ʒu���ŉ��ɂ��ăE�B���h�E���ĕ`��(�J�[�\�����݈ʒu)
"zb
"wrap off��: [count]�������ɃX�N���[��
"z<right>
""z<right>" �Ɠ���
"zl
"wrap off��: [count]�����E�ɃX�N���[��
"z<Left>
""z<Left>" �Ɠ���
"zh
"�X�N���[�����̔������X�N���[��
"zL
"
"�J�[�\������ʂ̏�A���A���Ɉړ�
"H,M,L
"
"���O����J��Ԃ�
".
"
"���ݍs�̌���
"f<word>
"���ݍs�̌����i����j
"F<word>
"
"���ݍs�̃��[�h����
"f<word>
"���ݍs�̌����i����j
"F<word>
"���ݍs�̎�����
",
"
"�����A�u�������ȒP���@
"�u�������������[�h�̏�ɃJ�[�\���ړ�->'*'->cw->����->n->.->n->.->�J��Ԃ�
"
"�R���g���[���R�[�h�̓���
"C-V<>
"
"�v�Z���ʂ̓���
"Inster���[�h->C-R=->2*2*2->Return
"
"�R�}���h���C���Ńo�b�t�@�ԍ����w�肷��
"#�o�b�t�@�ԍ�
"
"���iUndo
"http://www.ac.cyberhome.ne.jp/~yakahaira/vimdoc/usr_32.html
"Undo�őO�̃c���[�֖߂�
"g-
"Redo�Ŏ��̃c���[�֖߂�
"g+
"
"10���O�ɖ߂�
":earlier 10s
"
"�ꕪ��ɐi��
":later 1m
"
"�R�}���h���C������
"http://www.kaoriya.net/vimdoc_j/cmdline.txt
"C-R....
"
"���O�̂Ȃ��o�^�A�Ō�̍폜�⃄���N���܂ށB
"'"'
"�J�����g�t�@�C����
"'%'
"��փt�@�C����
"'#'
"�Ō�̌����p�^�[��
"'/'
"�N���b�v�{�[�h�̓��e
"'*'
"�Ō�̃R�}���h���C��
"':'
"�Ō�̏����ȍ폜(�s�P�ʖ���)
"'-'
"�Ō�ɑ}�����ꂽ�e�L�X�g
"'.'
"���̓o�^: ������͂���悤�v�������
"'='
"
"�t�@�C�����⊮
"CTRL-X CTRL-F
"�s�S�⊮
"CTRL-X CTRL-L
"�}�N����` (�C���N���[�h�t�@�C���̒����T��)
"CTRL-X CTRL-D
"�J�����g�t�@�C���ƃC���N���[�h�t�@�C�⊮
"CTRL-X CTRL-I
"���⊮
"CTRL-X CTRL-K
"���`�ꎫ�� (�V�\�[���X)
"CTRL-X CTRL-T
"�^�⊮
"CTRL-X CTRL-]
"Vim �̃R�}���h���C�⊮
"CTRL-X CTRL-V
"
"Window�c����/�������ؑ�
"C-W,H
"C-W,J
"
"�Í�������������
":X
"
"�󔒂�}�����Ȃ���join����
"gJ
"
"�ŏ��̌����p�^�[�������ꂽ�Ƃ��납�������i��������
"http://www.kaoriya.net/vimdoc_j/pattern.txt
":/patarn1/;/patarn2
"
"�J�[�\���ʒu�̒P���Manpage�Ō���
"K
"
"�J�[�\���ʒu�̏����ڍׂɕ\��
"g,C-G
"
"�R�}���h���C������
"http://www.ac.cyberhome.ne.jp/~yakahaira/vimdoc/cmdline.html
"
"Fold�֌W
"foldenable ���g�O���� on off ����
"zi
"fold �����(close)
"zc
"fold ���ċA�I�ɕ���(close)
"zC
"fold ���J��(open)
"zo
"fold ���ċA�I�ɊJ��(open)
"zO
"foldlevel ���C���N�������g�A ���Ȃ킿���ׂĂ�fold��1level�J��
"zr
"foldlevel ���ő�l�ɂ���A���Ȃ킿���ׂĂ�fold���J��
"zR
"foldlevel ���f�N�������g�A����킿���ׂĂ�fold��1level����
"zm
"foldlevel ��0�ɂ���A���Ȃ킿���ׂĂ�fold�����
"zM
"fold ���J�[�\������4�s���ݒ肷��
"zf4j
"`a fold ���J�[�\������a�̃}�[�N�ʒu�܂Őݒ肷��
"z
"�ݒ肳�ꂽ fold ���폜
"zd
"�ݒ肳�ꂽ fold ���ċA�I�ɍ폜
"zD
"
"�S�����\�[�g
":%!sort
"
"�o�b�t�@�S�̂ɒu���ւ���K�p
":bufdo %s/aaa/bbb/g
"
"�o�b�t�@�S�̂ɒu���ւ���K�p���ĕۑ�
":bufdo %s/aaa/bbb/g | wa!
"
"���s�ʒu�Ő��`
"gq
"
"sudo��Y��Č����̂Ȃ��t�@�C����ҏW������
":w !sudo tee %
"
"�J�[�\���̉��̒P����������ƏE���Ēu���Ŏg��
":%s//New York/g �Ƃ����� New York �ɒu��
":%g//d����� Massachusetts ���܂ލs���폜
"%v//d����� Massachusetts ���܂ލs�����c�����Ƃ��ł���B
"
"Undo�֘A
"undolist Undo�������Q��
"g-     �Â��e�L�X�g�̏�Ԗ߂�
"g+     �V�����e�L�X�g�̏�Ԃɖ߂�
":earlier {N}s   {N}�b�O�̏�Ԃɖ߂�܂�
":earlier {N}m  {N}���O�̏�Ԃɖ߂�܂�
":earlier {N}h  {N}���ԑO�̏�Ԃɖ߂�܂�
":later {N}s    {N}�b��̏�Ԃɖ߂�܂�
":later {N}m    {N}����̏�Ԃɖ߂�܂�
":later {N}h    {N}���Ԍ�̏�Ԃɖ߂�܂� 
"
"Massachusetts �̏�� # �������āA :%s//New York/g �Ƃ����� New York �ɒu��
":%g//d����� Massachusetts ���܂ލs���폜
"%v//d����� Massachusetts ���܂ލs�����c�����Ƃ��ł���B
"
"�������̑S�Ẵ^�u���X�y�[�X�ɕϊ�
":set expandtab
":%retab
"
"�������̑S�ẴX�y�[�X���^�u�ɕϊ�
":set noexpandtab
":%retab!
"
"�����I�ɉ��s����悤�ɂ���
"60�����̏ꍇ�B :set textwidth=60
"�������A���ꂾ�ƃX�y�[�X�Ȃǂł������s����Ȃ��B���{��ł͕s�ցB
"
"���{��� textwidth ���Ő܂�Ԃ�����
"gq
"
"Align�n
"<Leader>tsp    �󔒕����ŕ������Đ��`�B�e�t�B�[���h�͍������B
"<Leader>Tsp    �󔒕����ŕ������Đ��`�B�e�t�B�[���h�͉E�����B
"<Leader>tsq    �󔒕����ŕ������Đ��`�B�_�u���N�H�[�g�ň͂܂ꂽ�t�B�[���h���T�|�[�g�B�e�t�B�[���h�͍������B
"<Leader>tab    TSV�̐��`�B�^�u�����ŕ������Đ��`�B�^�u�����͔��p�X�y�[�X�ɕϊ������B
"<Leader>t{�Z�p���[�^} �w�肵���Z�p���[�^�ŕ������Đ��`�B�e�t�B�[���h�͍������B
"<Leader>T{�Z�p���[�^} �w�肵���Z�p���[�^�ŕ������Đ��`�B�e�t�B�[���h�͉E�����B
"<Leader>tml    �s���̃o�b�N�X���b�V���̈ʒu�̐��`�B�V�F���X�N���v�g�p�B
"<Leader>Htd    HTML�̃e�[�u���̐��`�B
"<Leader>tt LaTex�̃e�[�u���̐��`�B
"
"surround�n
"http://blog.scimpr.com/2012/09/08/surround-vim�`���[�g���A�������߂�/
"Change Surroucol("$")nd
"cs"'
"
"Change Surround x to Tag
"cs'<q>
"
"Change Surround Tag to x
"cst"
"
"Delete Surround
"ds"
"
"You Surround x
"ysiw]
"
"�󔒂��̃J�b�R�ň͂�
"cs]{
"
"�s�S�̂��͂�
"yss)
"
"�폜����
"ds{ds)
"
"You Surround x with Tag
"ysiw<pre>
"
"���̑�
"http://www.kaoriya.net/testdir/command_list.txt
"http://www.c.csce.kyushu-u.ac.jp/kb/wiki/index.php?%A5%BD%A5%D5%A5%C8%A5%A6%A5%A8%A5%A2%2FVim%2FFAQexecute pathogen#infect()
"
"
"execute pathogen#infect()
"filetype plugin indent on
syntax on

