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
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export PATH=$PATH:$JAVA_HOME/bin
# ruby to PATH
export PATH=$PATH:$HOME/.gem/ruby/2.7.0/bin
# rust to PATH
export PATH=$PATH:$HOME/.cargo/bin
# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"
export EDITOR="nvim"
# Path for IntelliJ 
export IDEA_JDK=/usr/lib/jvm/java-17-openjdk/bin
# Flutterfire CLI
export PATH="$PATH":"$HOME/.pub-cache/bin"
# Flutter vm
export PATH=$PATH:$HOME/fvm/default/bin

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
    docker 
    docker-compose
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
alias vimrc='vim ~/.config/nvim/init.lua'
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
alias lg='lazygit'

# alias to quickly get class of window
alias wmclass='xprop _NET_WM_PID WM_CLASS'

# alias for spotify-tui
alias spotify='sh ~/.local/bin/launchspt'

#alias for foldersize
alias size='sudo du -shc '

# ranger
# alias ra='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

# anaconda
alias startconda='source /opt/anaconda/bin/activate root'

# aliases for docker
alias dr='docker run'
alias ds='docker start'
alias de='docker exec'
alias dk='docker stop'
alias dps='docker ps'
alias dcud='docker-compose up -d'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dce='docker-compose exec'

# alias for flutter riverpod
alias riverpod='dart run build_runner watch'

# yay refresh dwmblocks
yay() {
	/usr/bin/paru "$@"
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

# open the last editet chapter
ba() {
    cd ~/Data/BachelorThesis/thesis/bachelor_thesis/bachelor_thesis/chapters/
    nvim *(om[1]) -c "VimtexCompile"
}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# enable history support in erlang
export ERL_AFLAGS="-kernel shell_history enabled"


source /home/benni/.config/broot/launcher/bash/br

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#ssh agent
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval "$(ssh-agent -s)" > /dev/null 2>&1
  ssh-add > /dev/null 2>&1
fi

#yazi config
function ra() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/benni/.dart-cli-completion/zsh-config.zsh ]] && . /home/benni/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

