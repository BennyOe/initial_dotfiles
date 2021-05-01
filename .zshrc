# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

###############
### Exports ###
###############
export PATH=$PATH:$HOME/.local/bin
# Java Classpath and version
export JAVA_HOME=/usr/lib/jvm/java-15-openjdk
export PATH=$PATH:$JAVA_HOME/bin
# ruby to PATH
export PATH=$PATH:$HOME/.gem/ruby/2.7.0/bin
# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"
export EDITOR="nvim"

#################

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	colored-man-pages
	zsh-autosuggestions
	zsh-syntax-highlighting
	vi-mode
	colorize
)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
alias config='/usr/bin/git --git-dir=/home/benjamino/.myconfig/ --work-tree=/home/benjamino'

###############
### Aliases ###
###############
# alias for neovim
alias vim='nvim'
alias v='vim'
alias oldvim='\vim'

# alias for better ls
alias lsl='lsd -a'
alias ls='lsd'
alias lsla='lsd -la'

#alias for faster *rc editing
alias vimrc='vim ~/.config/nvim/init.vim'
alias bashrc='vim ~/.bashrc'
alias zshrc='vim ~/.zshrc'
alias picomrc="vim ~/.config/picom/picom.conf"

# git aliases
alias gac='git add -A && git commit -a'
alias gst='git status'
alias gpu='git push'
alias gall='git add .'
alias gpl='git pull'
alias gck='git checkout'

# alias to quickly get class of window
alias wmclass='xprop _NET_WM_PID WM_CLASS'

# alias for spotify-tui
alias spotify='sh ~/.local/bin/launchspt'

#alias for foldersize
alias size='sudo du -shc '

# ranger
alias ra='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

# yay refresh dwmblocks
yay() {
	/usr/bin/yay "$@"
	pkill -RTMIN+1 dwmblocks
}
#function to safely remove my hdd
removeHDD() {
    udisksctl unmount -b /dev/sdb1
    udisksctl unmount -b /dev/sdb2
    udisksctl power-off -b /dev/sdb
}

#function to add, commit and push changes to dotfiles from anywhere
dotc() {
    cd ~/.dotfiles
    gall
    gac
    gp
    cd -
}

################
#language stuff#
################

# >>> conda initialize >>>
#!! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/paul/.applications/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/paul/.applications/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/paul/.applications/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/paul/.applications/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# enable history support in erlang
export ERL_AFLAGS="-kernel shell_history enabled"
