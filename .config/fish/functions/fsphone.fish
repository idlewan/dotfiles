function fsphone
	cd ~/FOLDERS
    and mkdir -p $argv[1]
    #simple-mtpfs $argv[1]
    go-mtpfs $argv[1]
end
