# Lines configured by zsh-newuser-install
unsetopt autocd beep
# End of lines configured by zsh-newuser-install
source /usr/share/zsh-antigen/antigen.zsh
antigen use oh-my-zsh

# POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
# POWERLEVEL9K_MODE='awesome-fontconfig'
# antigen theme bhilburn/powerlevel9k powerlevel9k

antigen bundle <<EOBUNDLES
	# Bundles from the default repo (robbyrussell's oh-my-zsh)
        git
    
        # Syntax highlighting bundle.
        zsh-users/zsh-syntax-highlighting
	
       	# Other	
	command-not-found

        # Fish-like auto suggestions
        zsh-users/zsh-autosuggestions
    
        # Extra zsh completions
	zsh-users/zsh-completions
EOBUNDLES
    
# Load the theme
antigen theme PatTheMav/minimal2 minimal2

# Tell antigen that you're done
antigen apply
alias config='/usr/bin/git --git-dir=/home/soenke/.cfg/ --work-tree=/home/soenke'
