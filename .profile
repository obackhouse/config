# Launch vim with Copilot
alias covi="vi --cmd 'let copilot=1'"

# Git autocomplete and branch hinting
PS1='\u@\h:\w$(__git_ps1 " [%s]")> '
