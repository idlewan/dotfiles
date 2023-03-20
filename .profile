export XKB_DEFAULT_LAYOUT=us
export XKB_DEFAULT_VARIANT=altgr-intl
#export XKB_DEFAULT_OPTIONS=ctrl:nocaps,compose:ralt,altwin:swap_alt_win
export XKB_DEFAULT_OPTIONS=ctrl:nocaps,compose:ralt

# make gnome-control-center work
#export XDG_CURRENT_DESKTOP=GNOME
export XDG_CURRENT_DESKTOP=sway

export BROWSER=/usr/bin/firefox

export CHROME_EXECUTABLE=/usr/bin/chromium

# https://mastransky.wordpress.com/2020/03/16/wayland-x11-how-to-run-firefox-in-mixed-environment/
export MOZ_DBUS_REMOTE=1

export MOZ_ENABLE_WAYLAND=1

#export SDL_VIDEODRIVER=wayland

export QT_QPA_PLATFORMTHEME=gtk2

export PATH=$PATH:\
$HOME/.bin:\
$HOME/.bin_specific:\
$HOME/.nimble/bin:\
$HOME/.local/bin:\
$HOME/.config/nvim/bundle/vim-superman/bin:\
/opt/android-sdk/platform-tools/:\
/opt/android-sdk/ndk-bundle/:\
/opt/android-sdk/tools/

#/mnt/Naka/code_other/GUI/flutter/bin
#$HOME/.npm-global/bin:\
