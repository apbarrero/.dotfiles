#|/bin/sh

# Installation script for configuration settings

# ZSH
if [ -f $HOME/.zshrc ]; then
   mv $HOME/.zshrc $HOME/.zshrc~
fi
echo 'source $HOME/.dotfiles/.zshrc' > $HOME/.zshrc

# VIM
if [ -f $HOME/.vimrc ]; then
   grep -e 'source $HOME/.dotfiles/.vimrc' $HOME/.vimrc > /dev/null
   if [ $? -ne 0 ]; then
      cp $HOME/.vimrc $HOME/.vimrc~
      echo 'source $HOME/.dotfiles/.vimrc' | cat - $HOME/.vimrc > /tmp/vimrc.tmp && mv /tmp/vimrc.tmp $HOME/.vimrc
   fi
else
   echo 'source $HOME/.dotfiles/.vimrc' > $HOME/.vimrc
fi

# GIT
if [ -f $HOME/.gitconfig ]; then
   cp $HOME/.gitconfig $HOME/.gitconfig~
fi

if [ "`git config --get include.path`" != "~/.dotfiles/.gitconfig" ]; then
   git config --global --add include.path "~/.dotfiles/.gitconfig"
fi
