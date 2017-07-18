function fs_mount
	cd ~/FOLDERS
    and mkdir -p $argv[1]
    and sshfs $MY_SSH_OPTS $argv[2] $argv[1] -o reconnect,ServerAliveInterval=10,ServerAliveCountMax=2
end
