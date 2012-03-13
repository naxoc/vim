# About
This is my vim configuration. I am a recent Textmate to MacVim convert, so a lot of my customizations are to replace features I liked from Textmate. I like Vim to be blazing fast, so I have a lot of focus on keeping my configuration small and without too many heavy plugins.

This readme file and the Rakefile is very much inspired by Hasse Ramlevs vim project: https://github.com/ramlev/vim - Thanks Hasse!

# Installation
The install process is quite simple.

Go to your home dir.

    $ cd ~/

Clone the repository into the ~/.vim folder

    $ git clone https://github.com/ramlev/vim.git .vim

Go into that folder

    $ cd .vim

Symlink the vimrc and gvimrc to your ~/ as dot files

    $ rake vim:setup

Fetch all vim plugins in the bundles subfolder in ~/.vim

    $ rake bundles:install

# Usage
If you want to automatic update all of the install plugins.

Go to the ~/.vim folder

    $ cd ~/.vim

Execute the update command, and after a little while every thing is updated, by pushing all plugins from their repositories.

    $ rake bundles:update

