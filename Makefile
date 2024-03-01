SERVER_BINARY=serverApp
FRONT_BINARY=frontEndApp

## up: starts all containers in the background without forcing build
up:
	@echo "Starting Docker images..."
	docker-compose up -d
	@echo "Docker images started!"

## up_build: stops docker-compose (if running), builds all projects and starts docker compose
up_build: build_server build_front_linux
	@echo "Stopping docker images (if running...)"
	docker-compose down
	@echo "Building (when required) and starting docker images..."
	docker-compose up --build -d
	@echo "Docker images built and started!"

## down: stop docker compose
down:
	@echo "Stopping docker compose..."
	docker-compose down
	@echo "Done!"

## build_broker: builds the  binary as a linux executable
build_front_linux:
	@echo "Building front end binary..."
	cd ./front-end && env GOOS=linux CGO_ENABLED=0 go build -o ${FRONT_BINARY} ./cmd/web
	@echo "Done!"

## build_server: builds the binary as a linux executable
build_server:
	@echo "Building server binary..."
	cd ./server && env GOOS=linux CGO_ENABLED=0 go build -o ${SERVER_BINARY} .
	@echo "Done!"
