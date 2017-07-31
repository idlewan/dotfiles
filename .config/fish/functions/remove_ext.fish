function remove_ext
    echo (string split -r -m1 . $argv[1])[1]
end

