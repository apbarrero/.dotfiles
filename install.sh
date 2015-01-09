#|/bin/sh

# Installation script for configuration settings

# ZSH
if [ -f $HOME/.zshrc ]; then
   mv $HOME/.zshrc $HOME/.zshrc~
fi
echo 'source $HOME/.dotfiles/.zshrc' > $HOME/.zshrc

if [ -d $HOME/.oh-my-zsh ]; then
   test -d $HOME/.oh-my-zsh/functions || mkdir $HOME/.oh-my-zsh/functions
   ln -s $HOME/.dotfiles/.functions.zsh $HOME/.oh-my-zsh/functions/
fi

# VIM
# Install .vimrc.local only if system spf13-vim installation is present
if [ -d $HOME/.spf13-vim-3 ]; then
    echo 'source $HOME/.dotfiles/.vimrc.local' >> $HOME/.vimrc.local
# Regular vim installation
elif [ -f $HOME/.vimrc ]; then
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

# i3
if [ -e "${HOME}/.i3" ]; then
   mv ${HOME}/.i3 ${HOME}/.i3~
fi
ln -s ${HOME}/.dotfiles/.i3 ${HOME}/.i3
