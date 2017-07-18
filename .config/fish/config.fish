bind \co "rcd ; commandline -f repaint"

set -gx EDITOR nvim
set -gx ANDROID_HOME /opt/android-sdk/
set -U fish_greeting
set -U -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
set -gx BROWSER /usr/bin/firefox

source ~/.config/fish/other.fish

cd ~/FOLDERS
