# ------------------------
# 1. REDIS BUILD
# ------------------------

# ------------------------
# Build an image
# Assign a container
# Assign a tag
# ------------------------

REDIS_TAG=3
REDIS_CONTAINER_NAME=redis
REDIS_IMAGE_NAME=redis

# Build and deploy of redis
build_redis:
	@echo 'Redis build with the TAG=${REDIS_TAG}'
	docker pull ${REDIS_IMAGE_NAME}:${REDIS_TAG}
	@echo 'Container execution of the image ${REDIS_IMAGE_NAME} with the name ${REDIS_CONTAINER_NAME}'
	docker run -d --name ${REDIS_CONTAINER_NAME} ${REDIS_IMAGE_NAME}:${REDIS_TAG}

# ------------------------------
# Visualize docker images
# Visualize active containers
# Visualize inactive containers
# ------------------------------

# Visualization
show_images_containers:
	@echo 'Docker images'
	docker images -a
	@echo 'Executing containers'
	docker ps --filter status=running
	@echo 'Non executing containers'
	docker ps --filter status=exited

# ------------------------------
# Delete redis container
# Visualize again
# ------------------------------

# Delete redis
delete_redis:
	@echo 'Stop redis'
	docker stop ${REDIS_CONTAINER_NAME}
	@echo 'Delete of the container ${REDIS_CONTAINER_NAME}'
	docker rm ${REDIS_CONTAINER_NAME}
	@echo 'Delete of the image ${REDIS_IMAGE_NAME}'
	docker rmi ${REDIS_IMAGE_NAME}:${REDIS_TAG}
	@echo 'Docker images'
	docker images -a
	@echo 'Deletion check'
	docker ps -a

# ------------------------
# 2. MONITOR DEPLOY
# ------------------------

# Monitor Build:
build_monitor_prometheus:
	@echo 'Build and Deploy of Prometheus'
	cd monitor/prometheus && docker-compose up -d

build_monitor_grafana:
	@echo 'Build and Deploy of Grafana'
	cd monitor/grafana && docker-compose up -d

build_monitor_redis:
	@echo 'Build and Deploy of Redis'
	cd monitor/redis && docker-compose up -d

build_monitor_redis_exporter:
	@echo 'Build and Deploy of redis-exporter'
	cd monitor/redis-exporter && docker-compose up -d

build_monitor:
	@echo 'Executing containers'
	docker ps -a
	$(MAKE) build_monitor_prometheus
	$(MAKE) build_monitor_grafana
	$(MAKE) build_monitor_redis
	$(MAKE) build_monitor_redis_exporter
	@echo 'Executing containers'
	docker ps -a

# Stop the monitor services
stop_monitor_prometheus:
	@echo 'Stop Prometheus service'
	cd monitor/prometheus && docker-compose stop prometheus

stop_monitor_redis:
	@echo 'Stop Redis service'
	cd monitor/redis && docker-compose stop redis

stop_monitor_grafana:
	@echo 'Stop Grafana service'
	cd monitor/grafana && docker-compose stop grafana

stop_monitor_redis_exporter:
	@echo 'Stop redis-exporter service'
	cd monitor/redis-exporter && docker-compose stop redis-exporter

stop_monitor:
	@echo 'Executing containers'
	docker ps -a
	$(MAKE) stop_monitor_prometheus
	$(MAKE) stop_monitor_grafana
	$(MAKE) stop_monitor_redis
	$(MAKE) stop_monitor_redis_exporter
	@echo 'Executing containers'
	docker ps -a

# Delete monitor services
down_monitor_prometheus:
	@echo 'Down Prometheus Service'
	cd monitor/prometheus && docker-compose down

down_monitor_redis:
	@echo 'Down Redis Service'
	cd monitor/redis && docker-compose down

down_monitor_redis_exporter:
	@echo 'Down redis-exporter Service'
	cd monitor/redis-exporter && docker-compose down

down_monitor_grafana:
	@echo 'Down Grafana Service'
	cd monitor/grafana && docker-compose down

down_monitor: ## Delete the monitor containers
	@echo 'Executing containers'
	docker ps -a
	$(MAKE) down_monitor_prometheus
	$(MAKE) down_monitor_redis
	$(MAKE) down_monitor_redis_exporter
	$(MAKE) down_monitor_grafana
	@echo 'Executing containers'
	docker ps -a

# Gives some help
.PHONY: help
help: ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

# ------------------------
# 3. ELK DEPLOY
# ------------------------

build_elk: ## Build and Deploy of ELK
	@echo 'Build of ELK'
	cd ELK && docker-compose build
	@echo 'Deploy of ELK'
	cd ELK && docker-compose up -d

stop_elk: ## Stop ELK services
	@echo 'Stop ELK services'
	cd ELK && docker-compose stop

start_elk: ## Start ELK services
	@echo 'Start ELK services'
	cd ELK && docker-compose start

restart_elk: ## Restart ELK services
	@echo 'Restart of ELK'
	$(MAKE) stop_elk
	$(MAKE) start_elk
	docker ps

# Variables
ELASTICSEARCH_IMAGE=elasticsearch:7.9.2
LOGSTASH_IMAGE=logstash:7.9.2
KIBANA_IMAGE=kibana:7.9.2

show: ## Show images and containers
	docker images -a
	@echo 'Running containers'
	docker ps --filter status=running
	@echo 'Non executing containers'
	docker ps --filter status=exited

deep_delete: ## Deep delete of ELK
	$(MAKE) show
	@echo 'Delete of containers'
	cd ELK && docker-compose down
	@echo 'Images purge'
	docker rmi $(ELASTICSEARCH_IMAGE) $(LOGSTASH_IMAGE) $(KIBANA_IMAGE)
	$(MAKE) show

# ------------------------
# 3. ELK DEPLOY
# ------------------------

DAPP_IMAGE=tokensnft
DAPP_TAG=v1
DAPP_CONTAINER_NAME=tokens_nft

build_dapp: ## Build the DAPP
	@echo 'Build the DAPP'
	cd colors && docker build -t $(DAPP_IMAGE):$(DAPP_TAG) .

run_dapp: ## DAPP Deploy
	@echo 'DAPP Deploy'
	docker run -dp 3000:3000 --name $(DAPP_CONTAINER_NAME) $(DAPP_IMAGE):$(DAPP_TAG)

stop_dapp: ## Stop DAPP
	@echo 'Stop DAPP'
	docker stop $(DAPP_CONTAINER_NAME)

restart_dapp: ## Restart DAPP
	@echo 'Restart DAPP'
	docker restart $(DAPP_CONTAINER_NAME)

delete_dapp: ## Delete DAPP
	@echo "Delete the DAPP's container"
	$(MAKE) stop_dapp
	docker rm $(DAPP_CONTAINER_NAME)

test_dapp: ## DAPP test
	@echo 'DAPP test'
	docker run -t $(DAPP_IMAGE):$(DAPP_TAG) test

# ------------------------
# 4. BUILD CADVISOR
# ------------------------

CADVISOR_IMAGE=google/cadvisor
CADVISOR_TAG=v0.33.0
CADVISOR_CONTAINER=cadvisor_santa
PATH_CADVISOR_IMAGE=/Users/martins/Desktop/automatic
build_cadvisor: ## Build and Run of CADVISOR
	@echo 'Download the image of $(CADVISOR_IMAGE)'
	docker pull $(CADVISOR_IMAGE):$(CADVISOR_TAG)
	@echo 'Run of $(CADVISOR_IMAGE)'
	docker run -dp 8080:8080 --name $(CADVISOR_CONTAINER) $(CADVISOR_IMAGE):$(CADVISOR_TAG)

save_cadvisor: ## Save the cadvisor image
	@echo 'Save the image of cAdvisor'
	docker save $(CADVISOR_IMAGE):$(CADVISOR_TAG) | gzip > $(PATH_CADVISOR_IMAGE)/cadvisor.tar.gz

load_cadvisor: ## Load the image of cadvisor and execute it
	@echo 'Load the image'
	docker load --input $(PATH_CADVISOR_IMAGE)/cadvisor.tar.gz
	@echo 'Execute a container for cadvisor'
	docker run -dp 8080:8080 --name $(CADVISOR_CONTAINER) $(CADVISOR_IMAGE):$(CADVISOR_TAG)

aws_connection:
	$(MAKE) save_cadvisor
	@echo 'Connection with AWS with SSH'
	@(MAKE) load_cadvisor

delete_cadvisor: ## Delete cadvisor
	@echo 'Delete cadvisor images and containers'
	docker rm -f $(CADVISOR_CONTAINER)
	docker rmi -f $(CADVISOR_IMAGE):$(CADVISOR_TAG)

stop_cadvisor: ## Stop cadvisor
	@echo 'Stop cadvisor'
	docker stop $(CADVISOR_CONTAINER)
