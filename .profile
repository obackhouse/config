# Powerline fonts
if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
    source /usr/share/powerline/bindings/bash/powerline.sh
fi

# Launch vim with Copilot
alias vi=/home/ollie/git/neovim/build/bin/nvim
alias vim=/home/ollie/git/neovim/build/bin/nvim
alias covi="vi --cmd 'let copilot=1'"

# Git autocomplete and branch hinting
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 "[⎇%s]")'; PS1='\[\e[38;5;39;2m\]\u\[\e[38;5;39m\]@\[\e[38;5;39m\]\h\[\e[0;37m\]:\[\e[38;5;214;2m\]\w\[\e[38;5;34m\]${PS1_CMD1}\[\e[0;37m\]\\$\[\e[0m\] '

# Splash
neofetch
