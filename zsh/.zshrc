fpath=($ZDOTDIR/external $fpath)
source "$XDG_CONFIG_HOME/zsh/aliases"


# for nvm
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM

autoload -Uz compinit; compinit

# Autocomplete hidden files
_comp_options+=(globdots)
source $HOME/dotfiles/zsh/external/completion.zsh

# load purification
autoload -Uz prompt_purification_setup; prompt_purification_setup

# Push the current directory visited on to the stack
setopt AUTO_PUSHD
# Do not store duplicate directories in the stack
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack after using pushd or popd
setopt PUSHD_SILENT

# enable vim mode for zsh
bindkey -v
export KEYTIMEOUT=1

# load cursor_mode
autoload -Uz cursor_mode && cursor_mode

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# load edit-command-line, enable command editor when hit 'v'
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# load bd
source $XDG_CONFIG_HOME/zsh/external/bd.zsh

# load scripts
source $DOTFILES/zsh/scripts.sh

# load fzf
# if [ $(command -v "fzf") ]; then
  # source /usr/share/fzf/completion.zsh
  # source /usr/share/fzf/key-bindings.zsh
# fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey -r '^l'
bindkey -r '^g'
bindkey -s '^g' 'clear\n'

# tmuxp
export DISABLE_AUTO_TITLE='true'
