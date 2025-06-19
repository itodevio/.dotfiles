## Zsh configuration file
export z="$HOME/.zshrc"

## Env
export ZSH="$HOME/.oh-my-zsh"
## Theme
#ZSH_THEME="half-life"
ZSH_THEME="kayid/kayid"

export XDG_CONFIG_HOME="$HOME/.config"

export DOTFILES="$HOME/.dotfiles"

export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home"

export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_HOME=$HOME/Library/Android/sdk/
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk

export PYENV_ROOT=$HOME/.pyenv
export PIPENV_VENV_IN_PROJECT=1

export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$HOME/projects/go/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$PYENV_ROOT/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.rvm/bin
export PATH=$PATH:$HOME/.local/share/solana/install/active_release/bin
export PATH=$PATH:$HOME/.avm/bin
export PATH=$PATH:$HOME/.local/share/bob/nvim-bin
export PATH=$PATH:$HOME/.vector/bin

export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/

export VISUAL="nvim"
export EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"

export WORKON_HOME=~/Envs
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Using bat to read git diff
export PAGER="bat"

# Using Bat to read Man pages
export MANROFFOPT="-c"
export MANPAGER="sh -c 'col -bx | bat -plman'"

# Fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --color=never --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}'"
export FZF_ALT_C_COMMAND="fd --type d . --hidden --color=never --exclude .git"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Nvm
export NVM_DIR="$XDG_CONFIG_HOME/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completionexport JAVA_HOME=$(/usr/libexec/java_home)

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/home/ito/.bun/_bun" ] && source "/home/ito/.bun/_bun"

# Deno
export DENO_INSTALL="/home/ito/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Go
export PATH="$PATH:`go env GOPATH`/bin"

batdiff() { # Diff two files with bat
  git diff --name-only --relative --diff-filter=d | xargs bat --diff
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

## Plugins
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    fast-syntax-highlighting
    web-search
)


## Oh My ZSH
source $ZSH/oh-my-zsh.sh

## Wal
(cat ~/.cache/wal/sequences &)
source $HOME/.cache/way/colors-tty.sh


## Starters
# Zoxide
eval "$(zoxide init zsh)"

# Fzf
source <(fzf --zsh)

## Aliases
alias ls="eza -l --icons --classify --links --group-directories-first --git --oneline --all --long"
alias l="ls"
alias ll="ls"
alias vim="nvim"
alias cd="z"
alias bat="bat --style numbers,changes --color=always"
alias cat="bat"
alias python="python3"
alias pip="pip3"
alias c="clear"
alias s="source ~/.zshrc"
alias ds="du -hs * | sort -hr"

