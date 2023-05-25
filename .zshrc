#                       __ _    
#                      /_ | |   
#   _ __ ___  _ ____   _| | | __
#  | '_ ` _ \| '__\ \ / / | |/ /
#  | | | | | | |   \ V /| |   < 
#  |_| |_| |_|_|    \_/ |_|_|\_\
                              

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# m1 PATH
# export MANPATH="/usr/local/man:$MANPATH"
export PATH="/opt/homebrew/bin:$PATH"

ZSH_THEME="robbyrussell"

plugins=(
    git
    last-working-dir
    colored-man-pages
    thefuck # Press ESC twice to correct previous console command.
)
  
# Brew shell completion
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh 

# /opt/homebrew/Cellar/zsh-syntax-highlighting/0.7.1 (27 files, 164.7KB) *
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters

# this plugin reaaaaly wants to be the last one 
# /opt/homebrew/Cellar/zsh-autosuggestions/0.7.0 (6 files, 44.8KB) *
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#####
# nvm
#####
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Note that if you are using Oh My Zsh, it will call compinit for you when you source oh-my-zsh.sh. 
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"


# other misc plugin info
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
# brew --prefix = /opt/homebrew/share/


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# enable CLI autocomplete
autoload bashcompinit && bashcompinit

export EDITOR="nvim"
alias novim="\vim"
alias yesvim="nvim"

alias vim="nvim"
alias v="nvim"
alias nc="vim ~/code/dotfiles/nvim"

alias zc="vim ~/.zshrc"
alias rzc="source ~/.zshrc"

alias code="~/code"


. /opt/homebrew/etc/profile.d/z.sh
source $ZSH/oh-my-zsh.sh
