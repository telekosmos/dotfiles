# .bash_profile file
# By Balaji S. Srinivasan (balajis@stanford.edu)
#
# Concepts:
# http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html
#
#    1) .bashrc is the *non-login* config for bash, run in scripts and after
#        first connection.
#
#    2) .bash_profile is the *login* config for bash, launched upon first
#        connection (in Ubuntu)
#
#    3) .bash_profile imports .bashrc in our script, but not vice versa.
#
#    4) .bashrc imports .bashrc_custom in our script, which can be used to
#        override variables specified here.
#
# When using GNU screen:
#
#    1) .bash_profile is loaded the first time you login, and should be used
#       only for paths and environmental settings

#    2) .bashrc is loaded in each subsequent screen, and should be used for
#       aliases and things like writing to .bash_eternal_history (see below)
#
# Do 'man bashrc' for the long version or see here:
# http://en.wikipedia.org/wiki/Bash#Startup_scripts
#
# When Bash starts, it executes the commands in a variety of different scripts.
#
#   1) When Bash is invoked as an interactive login shell, it first reads
#      and executes commands from the file /etc/profile, if that file
#      exists. After reading that file, it looks for ~/.bash_profile,
#      ~/.bash_login, and ~/.profile, in that order, and reads and executes
#      commands from the first one that exists and is readable.
#
#   2) When a login shell exits, Bash reads and executes commands from the
#      file ~/.bash_logout, if it exists.
#
#   3) When an interactive shell that is not a login shell is started
#      (e.g. a GNU screen session), Bash reads and executes commands from
#      ~/.bashrc, if that file exists. This may be inhibited by using the
#      --norc option. The --rcfile file option will force Bash to read and
#      execute commands from file instead of ~/.bashrc.

## -----------------------
## -- 1) Import .bashrc --
## -----------------------

# Factor out all repeated profile initialization into .bashrc
#  - All non-login shell parameters go there
#  - All declarations repeated for each screen session go there
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
# echo `/usr/libexec/java_home -v '1.6'`
function setjdk() {
  if [ $# -ne 0 ]; then
   removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
   if [ -n "${JAVA_HOME+x}" ]; then
    removeFromPath $JAVA_HOME
   fi
   export JAVA_HOME=`/usr/libexec/java_home -v $@`
   export PATH=$JAVA_HOME/bin:$PATH
  fi
}
function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}
setjdk 1.7
# export JAVA_HOME=$(/usr/libexec/java_home -v '1.6')

# export GROOVY_HOME=/usr/share/java/groovy-1.7.0
export GROOVY_HOME=/usr/share/java/groovy-1.8.6
export PATH=$GROOVY_HOME/bin:$PATH

# Configure PATH
#  - These are line by line so that you can kill one without affecting the others.
#  - Lowest priority first, highest priority last.
export PATH=$PATH
export PATH=$HOME/bin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# less colors via port/brew install source-highlight
# then:
export LESSOPEN="| /opt/local/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '

export MONGO_PATH=/usr/local/mongodb
export PATH=$PATH:$MONGO_PATH/bin
export PATH=$PATH:/Users/telekosmos/Tools/adt-bundle-20131030/sdk/platform-tools:/Users/telekosmos/Tools/adt-bundle-20131030/sdk/tools

# AWS
export EC2_HOME=/Users/telekosmos/DevOps/aws/ec2-api-tools-1.6.12.0
export PATH=$PATH:$EC2_HOME/bin
export AWS_ACCESS_KEY=AKIAIC4PN6DAAOFJY3GQ
export AWS_SECRET_KEY=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

export PYTHONPATH=$PYTHONPATH:/opt/local/bin:/usr/bin
# export PATH=/usr/local/heroku/bin:$PATH # Heroku: https://toolbelt.heroku.com/standalone

##
# Your previous /Users/telekosmos/.bash_profile file was backed up as /Users/telekosmos/.bash_profile.macports-saved_2013-10-06_at_11:03:31
##

# MacPorts Installer addition on 2013-10-06_at_11:03:31: adding an appropriate PATH variable for use with MacPorts.
export PATH=$PATH:/opt/local/bin:/opt/local/sbin
# Finished adapting your PATH environment variable for use with MacPorts.


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/Users/telekosmos/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/telekosmos/.rvm/bin:/usr/local/mongodb/bin:/usr/local/mysql/bin

##
# Your previous /Users/telekosmos/.bash_profile file was backed up as /Users/telekosmos/.bash_profile.macports-saved_2013-12-18_at_08:43:30
##

# MacPorts Installer addition on 2013-12-18_at_08:43:30: adding an appropriate PATH variable for use with MacPorts.
export PATH=$PATH:/opt/local/bin:/opt/local/sbin
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"
# export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"
alias jenv_set_java_home='export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"'

echo "JAVA_HOME is $JAVA_HOME"
echo '.bash_profile ended load!!'
