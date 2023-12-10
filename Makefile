build:
	@mkdir -p /home/alberto/data
	@mkdir -p /home/alberto/data/mariadb
	@mkdir -p /home/alberto/data/wordpress
	docker-compose -f ./srcs/docker-compose.yml up --build
	
down:
	docker-compose -f ./srcs/docker-compose.yml down

re:
	docker-compose -f ./srcs/docker-compose.yml up -d --build --force-recreate

clean:
	docker-compose -f ./srcs/docker-compose.yml down --volumes --remove-orphans
	chmod -R 777 /home/alberto/data
	rm -rf /home/alberto/data

.PHONY: build down re clean create-volumes-dirs
