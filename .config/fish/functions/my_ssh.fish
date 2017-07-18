function my_ssh
	autossh -M 0 -o ServerAliveInterval=10 -o ServerAliveCountMax=2 $MY_SSH_OPTS $argv
end
