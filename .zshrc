# Add Android SDK to $PATH
export PATH=$PATH:"/opt/android-sdk/platform-tools"

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
alias config='/usr/bin/git --git-dir=/home/soenke/.cfg/ --work-tree=/home/soenke'
export PIP_REQUIRE_VIRTUALENV=true

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then

XKB_DEFAULT_LAYOUT=de QT_WAYLAND_FORCE_DPI=physical QT_QPA_PLATFORM=wayland-egl CLUTTER_BACKEND=wayland SDL_VIDEODRIVER=wayland BEMENU_BACKEND=wayland exec sway

fi

export MOZ_ENABLE_WAYLAND=1
export DISPLAY=$WAYLAND_DISPLAY
export QT_QPA_PLATFORM=wayland-egl
export SDL_VIDEODRIVER=wayland
