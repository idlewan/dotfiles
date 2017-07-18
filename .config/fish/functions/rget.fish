function rget -w rsync --description 'alias rget=rsync -ahP'
	rsync -ahP $argv;
end
