mkdir -p $(xdg-user-dir PICTURES)/screenshots
slurp | grim -g - $(xdg-user-dir PICTURES)/screenshots/$(date +'screenshot_%Y-%m-%d-%H%M%S.png')
