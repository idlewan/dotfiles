function rcd
	ranger --choosedir=/tmp/chosen
    if [ -f /tmp/chosen -a (cat /tmp/chosen) != (pwd | tr -d "\n") ]
        cd (cat /tmp/chosen)
    end
    rm -f /tmp/chosen
end
