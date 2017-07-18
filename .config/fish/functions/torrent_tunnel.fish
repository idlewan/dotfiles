function torrent_tunnel
	my_ssh -N -L 9091:localhost:9091 $argv
end
