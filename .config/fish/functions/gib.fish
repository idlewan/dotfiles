function gib -w "git branch" --description 'alias gib=git branch -v'
	git branch -v --sort=-committerdate $argv;
end
