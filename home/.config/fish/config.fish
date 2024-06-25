source /usr/share/cachyos-fish-config/cachyos-config.fish

set PATH $PATH ~/.cargo/bin

alias sudo='doas'
alias ls='eza --icons'
alias ll='eza --icons -l'
alias la='eza --icons -a'
alias lal='eza --icons -la'

zoxide init --cmd cd fish | source

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
