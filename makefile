.PHONY: build test-login test-get-job-list	

build:
	go build && mv -f pewpew $(GOPATH)/bin/

test-login:
	@pewpew stress -X POST --body '{"phone":{"number":"1699087127","callingCode":"+84"},"password":"Aa1234567"}' \
	-n $(request) -c $(concurrency) -t $(timeout) -q --cpu 2 \
	$(url)

test-get-jobs:
	pewpew stress -X POST --body '{"query":"query {\n\tmobileLegsForDriver{\n\t\tid\n\t}\n}"}' \
	-H 'authorization: $(token)' \
	-n $(request) -c $(concurrency) -t $(timeout) -q --cpu 2 \
	$(url)
	