function gid -w "git diff" --description 'alias gid=git diff --ignore-space-at-eol --diff-algorithm=patience'
	git diff --ignore-space-at-eol --diff-algorithm=patience $argv;
end
