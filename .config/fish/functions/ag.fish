function ag -w rg --description 'alias ag=rg -i -C 2 --color always --heading'
	rg -i -C 2 --color always --heading $argv;
end
