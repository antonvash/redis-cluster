init:
	docker-compose -f docker-compose.yml up -d --scale sentinel=3

benchmark:
	docker-compose -f docker-compose.yml start benchmark
	docker-compose -f docker-compose.yml logs -f --tail=1 benchmark

status:
	docker-compose -f docker-compose.yml exec redis1 redis-cli INFO replication; docker-compose -f docker-compose.yml exec redis2 redis-cli INFO replication; docker-compose -f docker-compose.yml exec redis3 redis-cli INFO replication

down:
	docker-compose -f docker-compose.yml down
