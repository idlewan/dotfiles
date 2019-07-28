function ag -w rg --description 'alias ag=rg -i -C 2 --color always --heading'
	rg -S -C 2 -M 160 --color always --heading $argv;
end
