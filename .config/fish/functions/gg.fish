function gg -w "git grep" --description 'alias gg=git grep --break --heading --line-number'
	git grep --break --heading --line-number $argv;
end
