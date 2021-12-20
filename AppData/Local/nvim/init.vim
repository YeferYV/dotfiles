"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/


" if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/AppData/Local}/nvim/autoload/plug.vim"'))
"   echo "Downloading junegunn/vim-plug to manage plugins..."
"   silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/AppData/Local}/nvim/autoload/
"   silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/AppData/Local}/nvim/autoload/plug.vim
"   autocmd VimEnter * PlugInstall
" endif

 " source $HOME/AppData/Local/nvim/general/functions.vim
source $HOME/AppData/Local/nvim/general/settings.vim
source $HOME/AppData/Local/nvim/keys/mappings.vim
source $HOME/AppData/Local/nvim/vim-plug/plugins.vim

if exists('g:vscode')
  " VS Code extension
  source $HOME/AppData/Local/nvim/vscode/settings.vim
  source $HOME/AppData/Local/nvim/vim-config/easymotion.vim
  source $HOME/AppData/Local/nvim/vim-config/highlightyank.vim
else

  "" Lua
  " luafile $HOME/AppData/Local/nvim/lua/lsp/bash-lsp.lua
  " luafile $HOME/AppData/Local/nvim/lua/lsp/efm-lsp.lua
  " luafile $HOME/AppData/Local/nvim/lua/lsp/efmlangserver.lua
  " luafile $HOME/AppData/Local/nvim/lua/lsp/eslint-lsp.lua
  " luafile $HOME/AppData/Local/nvim/lua/lsp/general-lsp.lua
  " luafile $HOME/AppData/Local/nvim/lua/lsp/javascript-lsp.lua
  " luafile $HOME/AppData/Local/nvim/lua/lsp/lua-lsp.lua
  " luafile $HOME/AppData/Local/nvim/lua/lsp/python-lsp.lua
  " luafile $HOME/AppData/Local/nvim/lua/lsp/tsserver-lsp.lua
  luafile $HOME/AppData/Local/nvim/lua/barbar-conf.lua
  luafile $HOME/AppData/Local/nvim/lua/cmp-conf.lua
  " luafile $HOME/AppData/Local/nvim/lua/cmp-ultisnip.lua
  luafile $HOME/AppData/Local/nvim/lua/cmptabnine.lua
  " luafile $HOME/AppData/Local/nvim/lua/completion.lua
  " luafile $HOME/AppData/Local/nvim/lua/lsp.lua
  luafile $HOME/AppData/Local/nvim/lua/lspinstaller.lua
  luafile $HOME/AppData/Local/nvim/lua/lspkind-conf.lua
  luafile $HOME/AppData/Local/nvim/lua/lspsaga-conf.lua
  luafile $HOME/AppData/Local/nvim/lua/lunarvimline.lua
  luafile $HOME/AppData/Local/nvim/lua/nvimcolorizer.lua
  luafile $HOME/AppData/Local/nvim/lua/nvimtree.lua
  " luafile $HOME/AppData/Local/nvim/lua/plugins.lua
  luafile $HOME/AppData/Local/nvim/lua/tree.lua
  luafile $HOME/AppData/Local/nvim/lua/treesitter-playground.lua
  luafile $HOME/AppData/Local/nvim/lua/treesitter.lua

  "" Themes
  " source $HOME/AppData/Local/nvim/themes/gruvbox.vim
  " source $HOME/AppData/Local/nvim/themes/leet.vim
  " source $HOME/AppData/Local/nvim/themes/leetsmyck.vim
  " source $HOME/AppData/Local/nvim/themes/lunar.vim
  source $HOME/AppData/Local/nvim/themes/lunar2-generated.vim
  source $HOME/AppData/Local/nvim/themes/lunar2.vim
  " source $HOME/AppData/Local/nvim/themes/nord.vim
  " source $HOME/AppData/Local/nvim/themes/onedark.vim

  "" Vim-config
  source $HOME/AppData/Local/nvim/vim-config/floaterm.vim
  source $HOME/AppData/Local/nvim/vim-config/lsp-config.vim
  " source $HOME/AppData/Local/nvim/vim-config/signify.vim
  source $HOME/AppData/Local/nvim/vim-config/telescope.vim
  " source $HOME/AppData/Local/nvim/vim-config/ultisnips.vim

endif

