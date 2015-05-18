

# Make prompt informative
# See:  http://www.ukuug.org/events/linux2003/papers/bash_tips/
PS1="\[\033[0;34m\][\u@\h:\w]$\[\033[0m\]"

##################################################################
## FROM old (mine) bashrc!!!
##################################################################
#enables color in the terminal bash shell export                              
CLICOLOR=1
#sets up the color scheme for list export                                     
LSCOLORS=gxfxcxdxbxegedabagacad
#sets up the prompt color (currently a green similar to linux terminal)        
# export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '
export PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

#enables color for iTerm                                                      
export TERM=xterm-color

export CLICOLOR=1
export LSCOLORS=FxFxCxDxBxegedabagaced

echo '.bashrc loaded!!!'
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export NVM_DIR="/Users/telekosmos/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
