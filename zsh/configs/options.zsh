# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

# cdpath for quicker directory switching
setopt auto_cd
cdpath=($HOME $HOME/Code $HOME/stripe $HOME/Code/reshleman)
