function gilm -w "git log" --description 'alias gilm=git log --graph --abbrev-commit'
	git log --graph --abbrev-commit $argv;
end
