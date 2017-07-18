function gis -w "git status" --description 'alias gis=git status -sb'
	git status -sb $argv;
end
