# dot-files
A bunch of dot files that work accross different platforms.

## tmux
The .tmux.conf is a configuration file for tmux. To use, make a symlink of this file under $HOME.

See [this video](https://youtu.be/JXwS7z6Dqic) for more information about tmux.

## neovim
The .nvimrc is a configuration file for neovim. To use it, first install 
[vim-plug](https://github.com/junegunn/vim-plug) 
following the instructions therein, then make a symlink of this file under $HOME.

After that, start nvim and run
```vim
PlugUpdate | PlugUpgrade
```

A good resource for learning vim is Steve's [Learn Vimscript the Hard Way](http://learnvimscriptthehardway.stevelosh.com/).

## ctags

The .ctags is to maek ctags ignore some common directories. To use is, make a symlink as $HOME/.ctags.
