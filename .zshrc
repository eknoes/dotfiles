# Add Android SDK to $PATH
export PATH=$PATH:"/opt/android-sdk/platform-tools"
export PATH=$PATH:"/opt/flutter/bin"
export PATH=$PATH:"/home/soenke/bin"

# Jetbrains JDK      
export IDEA_JDK=/usr/lib/jvm/jre-jetbrains
export PHPSTORM_JDK=/usr/lib/jvm/jre-jetbrains
export WEBIDE_JDK=/usr/lib/jvm/jre-jetbrains
export PYCHARM_JDK=/usr/lib/jvm/jre-jetbrains
export RUBYMINE_JDK=/usr/lib/jvm/jre-jetbrains
export CL_JDK=/usr/lib/jvm/jre-jetbrains
export CLION_JDK=/usr/lib/jvm/jre-jetbrains
export DATAGRIP_JDK=/usr/lib/jvm/jre-jetbrains
export GOLAND_JDK=/usr/lib/jvm/jre-jetbrains
export STUDIO_JDK=/usr/lib/jvm/jre-jetbrains

# Master thesis
alias btfuzz="cargo run --release --"

# Alias nvim
alias vim='nvim'

# Lines configured by zsh-newuser-install
unsetopt autocd beep
# End of lines configured by zsh-newuser-install

[[ -a /usr/share/zsh-antigen/antigen.zsh ]] && source /usr/share/zsh-antigen/antigen.zsh
[[ -a /usr/share/zsh/share/antigen.zsh ]] && source /usr/share/zsh/share/antigen.zsh
	
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

	# Statusbar
	tobi-wan-kenobi/bumblebee-status.git bumblebee-status

        # Extra zsh completions
	zsh-users/zsh-completions
EOBUNDLES

antigen bundle zsh-users/zsh-autosuggestions

# Load the theme
antigen theme PatTheMav/minimal2 minimal2
# Tell antigen that you're done
antigen apply

prompt_minimal2_setup
alias dotfiles='/usr/bin/git --git-dir=/home/soenke/.dotfiles/ --work-tree=/home/soenke'
export PIP_REQUIRE_VIRTUALENV=true

alias dig='echo "You want to use drill instead"'
alias nslookup='echo "You want to use drill instead"'
export QT_WAYLAND_FORCE_DPI=96
PATH="$HOME/.node_modules/bin:$PATH"
DISABLE_UNTRACKED_FILES_DIRTY="true"

#export npm_config_prefix=~/.node_modules
setopt +o nomatch
