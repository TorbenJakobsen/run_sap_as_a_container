.ONESHELL:

.DEFAULT_GOAL := pull


.PHONY: pull
pull: 
	sudo docker pull sapse/abap-cloud-developer-trial:2023


.PHONY: setup
setup: 
	sudo sysctl vm.max_map_count=2147483647
	sudo sysctl fs.aio-max-nr=18446744073709551615

.PHONY: run
run:
	docker run --sysctl kernel.shmmni=32768 --stop-timeout 3600 -it --name a4h -h vhcala4hci sapse/abap-cloud-developer-trial:2023 


.PHONY: start
start:
	docker start -ai a4h


.PHONY: stop
stop:
	docker stop -t 7200 a4h


.PHONY: license
license:
	docker exec -it a4h less /SAP_COMMUNITY_DEVELOPER_License


.PHONY: code
code:
	code .
