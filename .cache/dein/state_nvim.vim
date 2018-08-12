if g:dein#_cache_version !=# 100 || g:dein#_init_runtimepath !=# '/home/enma/.config/nvim,/etc/xdg/nvim,/home/enma/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/var/lib/snapd/desktop/nvim/site,/usr/share/nvim/runtime,/var/lib/snapd/desktop/nvim/site/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/home/enma/.local/share/nvim/site/after,/etc/xdg/nvim/after,/home/enma/.config/nvim/after,/home/enma/.cache/dein/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/enma/.config/nvim/init.vim', '/home/enma/.config/nvim/dein.toml', '/home/enma/.config/nvim/dein_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/enma/.cache/dein'
let g:dein#_runtime_path = '/home/enma/.cache/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/home/enma/.cache/dein/.cache/init.vim'
let &runtimepath = '/home/enma/.config/nvim,/etc/xdg/nvim,/home/enma/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/var/lib/snapd/desktop/nvim/site,/home/enma/.cache/dein/repos/github.com/Shougo/vimproc.vim,/home/enma/.cache/dein/.cache/init.vim/.dein,/usr/share/nvim/runtime,/home/enma/.cache/dein/.cache/init.vim/.dein/after,/var/lib/snapd/desktop/nvim/site/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/home/enma/.local/share/nvim/site/after,/etc/xdg/nvim/after,/home/enma/.config/nvim/after,/home/enma/.cache/dein/repos/github.com/Shougo/dein.vim'
filetype off
autocmd dein-events InsertEnter * call dein#autoload#_on_event("InsertEnter", ['neocomplete.vim'])
