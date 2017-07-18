function bm -w wrk --description alias\ bm=wrk\ -H\ \'Host:\ localhost\'\ -H\ \'Accept:\ application/json,text/html\;q=0.9,application/xhtml+xml\;q=0.9,application/xml\;q=0.8,\*/\*\;q=0.7\'\ -H\ \'Connection:\ keep-alive\'\ -d\ 15\ -c\ 256\ -t\ 1
	wrk -H 'Host: localhost' -H 'Accept: application/json,text/html;q=0.9,application/xhtml+xml;q=0.9,application/xml;q=0.8,*/*;q=0.7' -H 'Connection: keep-alive' -d 15 -c 256 -t 1 $argv;
end
