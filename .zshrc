## Env
export ZSH="$HOME/.oh-my-zsh"

export DOTFILES="$HOME/.dotfiles"

export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home"

export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_SDK_HOME=~/Library/Android/sdk/
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk

export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/sbin:$PATH"

export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/
export VISUAL="lvim"
export EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"

export WORKON_HOME=~/Envs
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES


## Theme
ZSH_THEME="half-life"


## Plugins
plugins=(
	git
	zsh-autosuggestions
  zsh-syntax-highlighting
)


## Oh My ZSH
source $ZSH/oh-my-zsh.sh


## Starters
# StarShip
eval "$(starship init zsh)"

# Zoxide
eval "$(zoxide init zsh)"

# Pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completionexport JAVA_HOME=$(/usr/libexec/java_home)


## Aliases
alias ls="exa --icons --classify --links --group-directories-first --git --oneline --all --long"
alias l="ls"
alias ll="ls"
alias bat="batcat"
alias vim="lvim"
alias cd="z"

alias geekie="cd $HOME/Dev/geekie"
alias kik="cd $HOME/Dev/geekie"
alias gueke="cd $HOME/Dev/geekie"
alias gikiee="cd $HOME/Dev/geekie"
alias guiki="cd $HOME/Dev/geekie"
alias gueekie="cd $HOME/Dev/geekie"
alias giki="cd $HOME/Dev/geekie"
alias gek="cd $HOME/Dev/geekie"


## Functions
geekie-cl() { # Clone geekie repo
	git clone https://github.com/projetoeureka/$1.git
}

del-ch() { # Delete current branch and checkout to target
	CURRENT_BRANCH=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)
	git checkout $1
	git branch -D $CURRENT_BRANCH
}

aws_env() { # Print target AWS task defitition environment variables in JSON format (can throw that to a file by using ">> file")
	aws ecs describe-task-definition --task-definition $1 | \
	jq '.taskDefinition.containerDefinitions[0].environment | reduce .[] as $i ({}; .[$i.name] = $i.value)'
}

aws_env_file() { # Print target AWS task defitition environment variables in .env format (can throw that to a file by using ">> file")
	aws ecs describe-task-definition --task-definition $1 | \
	jq -r '.taskDefinition.containerDefinitions[0].environment[] | "\(.name)=\(.value | @sh)"' 
}



