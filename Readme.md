# About
This is my vim config. It's been around for a really long time and I make it more and more simple every time I go over it. This incarnation uses [minpac](https://github.com/k-takata/minpac) for plugins and doesn't use very many plugins at all.

# What does it do?
Not much. Just enough that I don't think Vim is too bare.

# Installation
The install process is simple:

Go to your home dir.
```
 cd ~/
``` 

Clone the repository into the ~/.vim folder
```
git clone https://naxoc@github.com/naxoc/vim.git .vim
```

Symlink the vimrc and gvimrc to your ~/ as dot files
```
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
```

[Install minpack](https://github.com/k-takata/minpac) if you don't already have it:
```
git clone https://github.com/k-takata/minpac.git \
    ~/.vim/pack/minpac/opt/minpac
```    

Done! 🚀