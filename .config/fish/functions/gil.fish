function gil -w "git log" --description 'alias gil=git log --graph --abbrev-commit --no-merges --date=iso'
	git log --graph --abbrev-commit --no-merges --date=iso $argv;
end
