# dot-files
A bunch of dot files that work accross different platforms.

## tmux
The .tmux.conf is a configuration file for tmux. To use, make a symlink of this file under $HOME.

## neovim
The .nvimrc is a configuration file for neovim. To use it, first install 
[vim-plug](https://github.com/junegunn/vim-plug) 
following the instructions therein, then make a symlink of this file under $HOME.

After that, start nvim and run
```vim
PlugUpdate | PlugUpgrade
```
