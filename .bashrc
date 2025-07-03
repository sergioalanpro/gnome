[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='\[\e[1;37m\]\u\[\e[0m\]@\[\e[1;34m\]\h \[\e[1;33m\]\W\[\e[0m\]\$ '
source ~/.local/share/blesh/ble.sh   ####BLESH INIT
source ~/miniconda3/etc/profile.d/conda.sh ###CONDA INIT
export PATH="$HOME/.cargo/bin:$PATH" ###RUST INIT





