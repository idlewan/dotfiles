function bmc -w wrk --description alias\ bmc=wrk\ -H\ \'Host:\ localhost\'\ -H\ \'Accept:\ application/json,text/html\;q=0.9,application/xhtml+xml\;q=0.9,application/xml\;q=0.8,\*/\*\;q=0.7\'\ -H\ \'Connection:\ keep-alive\'
	wrk -H 'Host: localhost' -H 'Accept: application/json,text/html;q=0.9,application/xhtml+xml;q=0.9,application/xml;q=0.8,*/*;q=0.7' -H 'Connection: keep-alive' $argv;
end
