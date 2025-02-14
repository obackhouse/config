# Powerline fonts
source /usr/share/powerline/bindings/bash/powerline.sh

# Launch vim with Copilot
alias vi=/home/ollie/git/neovim/build/bin/nvim
alias vim=/home/ollie/git/neovim/build/bin/nvim
alias covi="vi --cmd 'let copilot=1'"

# Git autocomplete and branch hinting
PROMPT_COMMAND_GIT='PS1_CMD1=$(__git_ps1 " \ue725 %s ")';
PS1_GIT='\[\e[107m\] \[\e[30;1m\]\h\[\e[22;39m\] \[\e[97;48;5;236m\]\[\e[39m\] \[\e[97m\]\u\[\e[39m\] \[\e[38;5;236;48;5;22m\]\[\e[39m\] \[\e[97m\]\w\[\e[39m\] \[\e[38;5;22;48;5;28m\]\[\e[97m\]${PS1_CMD1}\[\e[0;38;5;28m\]\[\e[0m\] '
PS1_NO_GIT='\[\e[107m\] \[\e[30;1m\]\h\[\e[22;39m\] \[\e[97;48;5;236m\]\[\e[39m\] \[\e[97m\]\u\[\e[39m\] \[\e[38;5;236;48;5;22m\]\[\e[39m\] \[\e[97m\]\w\[\e[39m\] \[\e[0;38;5;22m\]\[\e[0m\] '
PROMPT_COMMAND='if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then eval "$PROMPT_COMMAND_GIT"; PS1="$PS1_GIT"; else PS1="$PS1_NO_GIT"; fi'

# Splash
neofetch
