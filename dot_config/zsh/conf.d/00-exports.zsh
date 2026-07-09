export EDITOR=nvim
export VISUAL=nvim
export BROWSER=zen-browser


# NEOVIM

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# HISTORY

export HISTFILE="$ZDOTDIR/.zsh_history"
export HISTSIZE=5000
export SAVEHIST=5000

#SHARE HISTORY ACCROSS TERMINAL TABS 
setopt SHARE_HISTORY
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dus
