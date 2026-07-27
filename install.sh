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

curl -L https://iterm2.com/misc/zsh_startup.in > $HOME/.iterm2_shell_integration.zsh

# VIM
# Install .vimrc.local only if system spf13-vim installation is present
if [ -d $HOME/.spf13-vim-3 ]; then
    echo 'source $HOME/.dotfiles/.vimrc.local' >> $HOME/.vimrc.local
    echo 'source $HOME/.dotfiles/.vimrc.bundles.local' >> $HOME/.vimrc.bundles.local
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

# NEOVIM / LazyVim
# Wire portable personal settings (leader key, etc.) into an existing LazyVim
# installation. Appended to lua/config/options.lua because that file runs after
# LazyVim's own defaults but before lazy.setup() maps plugin <leader> keys.
NVIM_OPTIONS="$HOME/.config/nvim/lua/config/options.lua"
NVIM_LAZY="$HOME/.config/nvim/lua/config/lazy.lua"
NVIM_WIRING='dofile(vim.fn.expand("~/.dotfiles/nvim-config/init.lua"))'
if [ -f "$NVIM_OPTIONS" ] && grep -q 'LazyVim/LazyVim' "$NVIM_LAZY" 2>/dev/null; then
   grep -F "$NVIM_WIRING" "$NVIM_OPTIONS" > /dev/null 2>&1
   if [ $? -ne 0 ]; then
      cp "$NVIM_OPTIONS" "$NVIM_OPTIONS~"
      printf '\n%s\n' "$NVIM_WIRING" >> "$NVIM_OPTIONS"
      echo 'Wired personal nvim settings into LazyVim (lua/config/options.lua).'
   fi
else
   echo 'Skipping nvim: no LazyVim installation found at ~/.config/nvim.'
fi

# GIT
if [ -f $HOME/.gitconfig ]; then
   cp $HOME/.gitconfig $HOME/.gitconfig~
fi

if [ "`git config --get include.path`" != "~/.dotfiles/.gitconfig" ]; then
   git config --global --add include.path "~/.dotfiles/.gitconfig"
fi
ln -s ${HOME}/.dotfiles/.gitignore ${HOME}/.gitignore


# i3
if [ -e "${HOME}/.i3" ]; then
   mv ${HOME}/.i3 ${HOME}/.i3~
fi
ln -s ${HOME}/.dotfiles/.i3 ${HOME}/.i3

# dunst
if [ -e "${HOME}/.config/dunst/dunstrc" ]; then
    mv ${HOME}/.config/dunst/dunstrc ${HOME}/.config/dunst/dunstrc~
fi
mkdir -p ${HOME}/.config/dunst
ln -s ${HOME}/.dotfiles/.config/dunst/dunstrc ${HOME}/.config/dunst/dunstrc

