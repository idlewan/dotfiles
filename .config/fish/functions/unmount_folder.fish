function unmount_folder
	cd ~/FOLDERS
    and fusermount -u $argv[1]
    and rmdir $argv[1]
end
