# Vars
	HISTFILE=~/.zsh_history
	SAVEHIST=1000 
	setopt inc_append_history # To save every command before it is executed 
	setopt share_history # setopt inc_append_history

	git config --global push.default current

# Aliases
	alias v="vim -p"
	mkdir -p /tmp/log
	
	# This is currently causing problems (fails when you run it anywhere that isn't a git project's root directory)
	# alias vs="v `git status --porcelain | sed -ne 's/^ M //p'`"

# Settings
	export VISUAL=vim

source ~/dotfiles/zsh/plugins/fixls.zsh

#Functions
	# Loop a command and show the output in vim
	loop() {
		echo ":cq to quit\n" > /tmp/log/output 
		fc -ln -1 > /tmp/log/program
		while true; do
			cat /tmp/log/program >> /tmp/log/output ;
			$(cat /tmp/log/program) |& tee -a /tmp/log/output ;
			echo '\n' >> /tmp/log/output
			vim + /tmp/log/output || break;
			rm -rf /tmp/log/output
		done;
	}

# Custom cd
chpwd() ls

# For vim mappings: 
	stty -ixon

# Completions
# These are all the plugin options available: https://github.com/robbyrussell/oh-my-zsh/tree/291e96dcd034750fbe7473482508c08833b168e3/plugins
#
# Edit the array below, or relocate it to ~/.zshrc before anything is sourced
# For help create an issue at github.com/parth/dotfiles

autoload -U compinit

plugins=(
	docker
)

for plugin ($plugins); do
    fpath=(~/dotfiles/zsh/plugins/oh-my-zsh/plugins/$plugin $fpath)
done

compinit

source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/history.zsh
source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/key-bindings.zsh
source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/completion.zsh
source ~/dotfiles/zsh/plugins/vi-mode.plugin.zsh
source ~/dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/dotfiles/zsh/keybindings.sh

# Fix for arrow-key searching
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
	autoload -U up-line-or-beginning-search
	zle -N up-line-or-beginning-search
	bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
	autoload -U down-line-or-beginning-search
	zle -N down-line-or-beginning-search
	bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

source ~/dotfiles/zsh/prompt.sh
export PATH=$PATH:$HOME/dotfiles/utils
alias python=python3
alias pip=pip3

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 
export EDITOR=vim
export LD_LIBRARY_PATH=/usr/local/lib
export CMAKE_INCLUDE_PATH=$HOME/Downloads/programs/protobuf-3.9.2/src/google/protobuf
#export PATH=/home/lamductan/dev/courses/operating-system/project/pintos/src/utils:$PATH
export PATH=$PATH:$HOME/dev/courses/operating-system/project/pintos/src/utils:/home/lamductan/dev/courses/operating-system/project/pintos/src/utils:/home/lamductan/bin:/home/lamductan/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
export PATH=$PATH:/home/lamductan/.local/go/bin:/home/lamductan/.local/go/bin/bin
export GOPATH=/home/lamductan/.local/go/bin

