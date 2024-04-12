# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

###############
### Exports ###
###############
export PATH=$HOME/.local/bin:$PATH
# Java Classpath and version
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export PATH=$PATH:$JAVA_HOME/bin
# ruby to PATH
export PATH=$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin/
export PATH=$PATH:/usr/lib/ruby/gems/3.0.0
# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"
export EDITOR="nvim"
export DIFFPROG="nvim -d $1"
export UPDATE_ZSH_DAYS=2
export ZSH_CUSTOM_AUTOUPDATE_QUIET=true
export ANDROID_SDK_ROOT=$HOME/Tools/android
# export ANDROID_SDK_ROOT=$HOME/Android/Sdk/android-sdk
# export ANDROID_HOME='/opt/android-sdk'
export CHROME_EXECUTABLE='/usr/bin/brave'
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools/
export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
export ANDROID_HOME=$ANDROID_SDK_ROOT
# dotnet tools
export PATH=$PATH:$HOME/.dotnet/tools/
# yarn globals
export PATH="$(yarn global bin):$PATH"
# dart globals
export PATH="$PATH":"$HOME/.pub-cache/bin"

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
    autoupdate
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
alias vi='vim'
alias oldvim='\vim'
alias vimdiff='nvim -d'
alias zerovim='nvim -u NONE'

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
alias gac='git add . && git commit -a'
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
alias ra='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

# docker
alias dls='docker ps'
alias dlsa='docker ps -a'
alias dso='docker stop'
alias dsa='docker start'
alias doc='docker-compose'

# flutter
alias fpg='flutter pub get'
alias fpa='flutter pub add'

# zip everything that is checked into git used like this: gitzip [OUTPUT_FILE]
alias gitzip="git archive HEAD -o "

# when the keyboard is german but should be english
alias zaz='uskeys'

alias sshcp='xclip -sel clip < ~/.ssh/id_ed25519.pub'

# project based aliases
alias icw='cd ~/Uni/icw2/ && v icw2.tex'

# open the last editet chapter
ba() {
    cd ~/uni/BA/bachelor_thesis/bachelor_thesis/chapters/
    resize &
    nvim *(om[1]) -c "VimtexCompile"
}

resize() {
    sleep 1
    xdotool key Super+l
    xdotool key Super+l
}

# yay/ paru refresh dwmblocks
# TODO upadte to paru
yay() {
	# /usr/bin/yay "$@"
    /usr/bin/paru "$@"
	pkill -RTMIN+1 dwmblocks
    uskeys
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

# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
fkill() {
    local pid
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}

notes() {
    cd ~/notes/
    v index.norg
    cd -
}

dennis_git() {
    git config user.name "Dennis Gottfried"
    git config user.email "dennis.gottfried@student.htw-berlin.de"
}

paul_git() {
    git config user.name "Paul Höppner"
    git config user.email "paul.hoeppner@student.htw-berlin.de"
}

function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


################
#language stuff#
################

# enable history support in erlang
# export ERL_AFLAGS="-kernel shell_history enabled"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# eval "$(rbenv init - zsh)"

source /home/paul/.config/broot/launcher/bash/br
source /usr/share/nvm/init-nvm.sh
