function n -w "nim c" --description 'compile nim programs'
	nim c --nimcache:.__nimcache__ $argv
end
