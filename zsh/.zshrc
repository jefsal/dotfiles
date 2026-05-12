export PATH="/usr/local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(ssh-agent -s)" > /dev/null

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# JAVA_HOME
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$JAVA_HOME/bin:$PATH

# Maven
export PATH=/Users/jef/Documents/java/apache-maven-3.9.12/bin:$PATH

# Get assignment from Windows pc
geta() {
    local num="$1"
    local src="pc:C:/Users/pc/Documents/sfsu/CSC 340-03 Milestone $num - student"
    local dest="$HOME/Documents/sfsu/csc-340/assignments/"
    
    echo "Copying from: $src"
    echo "To: $dest"
    scp -r "$src" "$dest"
}

# green % sign
PROMPT='%n@%m %1~ %B%F{green}%%%f%b '

# Alias Assignemnt 
alias getm='geta'

# Snowflake 
alias snowsql=/Applications/SnowSQL.app/Contents/MacOS/snowsql
