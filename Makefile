build:
	@docker build -t zeineblabbane/truffle ./truffle
	@docker build -t zeineblabbane/ganache ./ganache
	@docker build -t zeineblabbane/ganache-cli-interface ./interface

push: build
	@docker push zeineblabbane/truffle
	@docker push zeineblabbane/ganache
	@docker push zeineblabbane/ganache-cli-interface

deploy_contract:
	@docker exec truffle /bin/sh -c "cd election && truffle migrate --reset"

run_front:
	@docker exec truffle /bin/sh -c "cd election && npm install && npm run dev"
