all: build

build:
	@docker build -t ${USER}/aerospike —-no-cache .
