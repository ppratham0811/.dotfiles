# Start tmux automatically
if command -v tmux>/dev/null; then
  if [ -z "$TMUX" ]; then
    # tmux attach -t TG || tmux new -s TG
    if tmux has-session -t TG 2>/dev/null; then
      tmux attach -t TG
    else
      tmux new -s TG
    fi
  fi
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# gcm message alias
gcm() {
  git commit -m "$*"
}
alias fuck='thefuck'
alias clang='clang-14'
alias cpp='clang++'
alias gst='git status'
alias gaa='git add .'
alias gc='git commit'
alias gp='git push'
alias gpo='git push origin'
alias gpom='git push origin main'
alias nv='nvim'
alias tm='tmux'
alias tmls='tmux list-sessions'
alias tmat='tmux a -t'
alias tmns='tmux new -s'
alias tmS='tmux -S'
alias tmks='tmux kill-session -t'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

set +x
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export PATH="$HOME/.cargo/bin:$PATH"
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

