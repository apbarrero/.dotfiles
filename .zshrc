# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Terminal fonts and colours according to the times
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
# Only outside tmux. tmux sets TERM itself (tmux-256color) so terminfo
# describes tmux's real capabilities; overriding it inside a session is what
# makes italics, cursor shapes and some key sequences misbehave. Harmless on
# machines where Warp already provides this, which is why it went unnoticed.
[[ -z "$TMUX" ]] && export TERM=xterm-256color

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bluelines"

export EDITOR=vim

alias vi="vim"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias cb="xclip -selection clipboard"
alias please="sudo"
alias myip="curl -s https://checkip.amazonaws.com"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting sudo npm asdf)

# Load oh-my-zsh only if it is installed (skipped on machines without it,
# e.g. macOS/Warp where autosuggestions & syntax highlighting are built in)
test -d "$ZSH" && source $ZSH/oh-my-zsh.sh

# less to not paginate if less than one page
export LESS="-F -R -X $LESS"

# Customize to your needs...
export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$HOME/bin:$PATH

# Homebrew (macOS): prepend its paths when present (the PATH lines above are
# Linux-oriented and would otherwise drop /opt/homebrew/bin)
test -x /opt/homebrew/bin/brew && eval "$(/opt/homebrew/bin/brew shellenv)"

# Source i3 display settings alias
test "i3" = "$DESKTOP_SESSION" && source $HOME/.i3/alias.zsh

# source iTerm2 shell integration tools
test "iTerm.app" = "$TERM_PROGRAM" -a -f $HOME/.iterm2_shell_integration.zsh && source $HOME/.iterm2_shell_integration.zsh || true

# Source specific environment settings if present
test -f $HOME/.env/.zshrc && source $HOME/.env/.zshrc || true

test -f "$HOME/.asdf/asdf.sh" && source $HOME/.asdf/asdf.sh

# Set up fzf key bindings and fuzzy completion
test -x "$(which fzf)" && eval "$(fzf --zsh)"

# Set up zoxide (provides the `z` command; replaces oh-my-zsh's z plugin)
test -x "$(command -v zoxide)" && eval "$(zoxide init zsh)"
